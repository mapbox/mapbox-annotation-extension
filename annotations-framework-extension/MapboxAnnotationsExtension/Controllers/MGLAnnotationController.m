#import "MGLAnnotationController_Private.h"
#import "MGLStyleAnnotation_Private.h"

@interface MGLAnnotationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableDictionary<NSString *, MGLStyleAnnotation *> *annotations;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;
@property (nonatomic, strong) MGLShapeSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;
@property (nonatomic) UITapGestureRecognizer *singleTapGestureRecognizer;
@property (nonatomic) id<MGLFeature> selectedFeature;
@property (nonatomic, assign) BOOL interactionEnabled;

- (void)initializeLayer;
- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MGLAnnotationController

- (instancetype)initWithMapView:(MGLMapView *)mapView {
    if (self = [super init]) {
        [self commonInit:mapView];
        [self initializeLayer];
        [self.mapView.style addLayer:self.layer];
    }
    
    return self;
}

- (instancetype)initWithMapView:(MGLMapView *)mapView belowLayerIdentifier:(nonnull NSString *)layerIdentifier {
    if (self = [super init]) {
        [self commonInit:mapView];
        [self initializeLayer];
        MGLStyleLayer *topLayer = [self.mapView.style layerWithIdentifier:layerIdentifier];
        [self.mapView.style insertLayer:self.layer belowLayer:topLayer];
    }
    
    return self;
}

- (void)commonInit:(MGLMapView *)mapView {
    self.mapView = mapView;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *sourceIdentifier = [NSString stringWithFormat:@"annotations-extension-source-%@", uuid];
    NSString *geoJSON = @"{\"type\": \"FeatureCollection\",\"features\": []}";
    NSData *data = [geoJSON dataUsingEncoding:NSUTF8StringEncoding];
    MGLShape *shape = [MGLShape shapeWithData:data encoding:NSUTF8StringEncoding error:NULL];
    self.source = [[MGLShapeSource alloc] initWithIdentifier:sourceIdentifier shape:shape options:nil];
    [self.mapView.style addSource:self.source];
    self.annotations = [NSMutableDictionary dictionary];
    self.enabledPaintProperties = [NSMutableDictionary dictionary];
    self.annotationsInteractionEnabled = YES;
}

- (void)setAnnotationsInteractionEnabled:(BOOL)annotationsInteractionEnabled {
    if (annotationsInteractionEnabled && !self.singleTapGestureRecognizer) {
        self.singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        self.singleTapGestureRecognizer.numberOfTapsRequired = 1;
        self.singleTapGestureRecognizer.delegate = self;
        
        UITapGestureRecognizer *mapViewTapGestureRecognizer = [self.mapView performSelector:@selector(singleTapGestureRecognizer)];
        [self.mapView removeGestureRecognizer:mapViewTapGestureRecognizer];
        for (UIGestureRecognizer *recognizer in self.mapView.gestureRecognizers) {
            if ([recognizer isKindOfClass:[UITapGestureRecognizer class]]) {
                [self.singleTapGestureRecognizer requireGestureRecognizerToFail:recognizer];
            }
        }
        [mapViewTapGestureRecognizer requireGestureRecognizerToFail:self.singleTapGestureRecognizer];
        
        [self.mapView addGestureRecognizer:self.singleTapGestureRecognizer];
        [self.mapView addGestureRecognizer:mapViewTapGestureRecognizer];
    } else if (!annotationsInteractionEnabled && self.singleTapGestureRecognizer) {
        [self.mapView removeGestureRecognizer:self.singleTapGestureRecognizer];
    }
    _interactionEnabled = annotationsInteractionEnabled;
}

- (BOOL)annotationsInteractionEnabled {
    return _interactionEnabled;
}

- (void)initializeLayer {
    // This method should be overrided by subclasses.
}

- (void)addStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation {
    [self addStyleAnnotations:@[styleAnnotation]];
}

- (void)addStyleAnnotations:(NSArray<MGLStyleAnnotation *> *)styleAnnotations {
    for (MGLStyleAnnotation *annotation in styleAnnotations) {
        [self.annotations setValue:annotation forKey:annotation.identifier];
    }
    [self setNeedsUpdate];
}

- (void)removeStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation {
    [self removeStyleAnnotations:@[styleAnnotation]];
}

- (void)removeStyleAnnotations:(NSArray<MGLStyleAnnotation *> *)styleAnnotations {
    for (MGLStyleAnnotation *annotation in styleAnnotations) {
        [self.annotations removeObjectForKey:annotation.identifier];
    }
    [self setNeedsUpdate];
}

- (void)updateStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation {
    [self addStyleAnnotations:@[styleAnnotation]];
}

- (void)updateStyleAnnotations:(NSArray<MGLStyleAnnotation *> *)styleAnnotations {
    [self addStyleAnnotations:styleAnnotations];
}

- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation {
    // This method should be overrided by subclasses.
}

- (void)setPaintProperties {
    // This method should be overrided by subclasses.
}

- (void)setNeedsUpdate {
    __block NSMutableArray *features = [NSMutableArray arrayWithCapacity:self.annotations.count];
    __weak typeof (self) weakSelf = self;
    [self.annotations enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, MGLStyleAnnotation * _Nonnull annotation, BOOL * _Nonnull stop) {
        [features addObject:annotation.geoJSONDictionary];
        [weakSelf enablePaintProperties:annotation];
    }];
    
    [self setPaintProperties];
    
    NSDictionary *geoJSON = @{@"type": @"FeatureCollection",
                              @"features": features};
    
    NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:geoJSON options:0 error:nil];
    MGLShape *shape = [MGLShape shapeWithData:jsonData encoding:NSUTF8StringEncoding error:NULL];
    self.source.shape = shape;
    
}

- (void)handleTapGesture:(UITapGestureRecognizer *)singleTap {
    
    CGPoint point = [singleTap locationInView:singleTap.view];
    
    CGRect pointRect = {point, CGSizeZero};
    CGRect positionRect = CGRectInset(pointRect, -22.0, -22.0);
    NSArray *features = [self.mapView visibleFeaturesInRect:positionRect
                                             inStyleLayersWithIdentifiers:[NSSet setWithArray:@[self.layer.identifier]]];
    CLLocationCoordinate2D currentCoordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    NSArray *sortedFeatures = [features sortedArrayUsingComparator:^NSComparisonResult(id<MGLFeature>  _Nonnull featureA, id<MGLFeature>  _Nonnull featureB) {
        CLLocationCoordinate2D coordinateA = featureA.coordinate;
        CLLocationCoordinate2D coordinateB = featureB.coordinate;
        
        CLLocationDegrees deltaA = hypot(coordinateA.latitude - currentCoordinate.latitude,
                                         coordinateA.longitude - currentCoordinate.longitude);
        CLLocationDegrees deltaB = hypot(coordinateB.latitude - currentCoordinate.latitude,
                                         coordinateB.longitude - currentCoordinate.longitude);
        
        if (deltaA < deltaB) {
            return NSOrderedAscending;
        } else if (deltaA > deltaB) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    
    if (sortedFeatures.firstObject) {
        [self showCallout:sortedFeatures.firstObject];
    } else if (self.selectedFeature){
        [self removeAnnotationFromMapView:self.selectedFeature];
        self.selectedFeature = nil;
    }
    
}

- (void)showCallout:(id<MGLFeature>)feature {
    if (!feature) {
        return;
    }
    
    [self removeAnnotationFromMapView:self.selectedFeature];
    
    if ([feature isKindOfClass:[MGLPointFeature class]]) {
        ((MGLPointFeature*)feature).title = feature.attributes[MGLPropertyAnnotationTitle];
        ((MGLPointFeature*)feature).subtitle = feature.attributes[MGLPropertyAnnotationSubtitle];
        
    } else if ([feature isKindOfClass:[MGLPolylineFeature class]]) {
        ((MGLPolylineFeature*)feature).title = feature.attributes[MGLPropertyAnnotationTitle];
        ((MGLPolylineFeature*)feature).subtitle = feature.attributes[MGLPropertyAnnotationSubtitle];
        
    } else if ([feature isKindOfClass:[MGLPolygonFeature class]]) {
        ((MGLPolygonFeature*)feature).title = feature.attributes[MGLPropertyAnnotationTitle];
        ((MGLPolygonFeature*)feature).subtitle = feature.attributes[MGLPropertyAnnotationSubtitle];
        
    }
    
    self.selectedFeature = feature;
    [self.mapView selectAnnotation:feature animated:YES];
}

- (void)removeAnnotationFromMapView:(id<MGLFeature>)featureAnnotation {
    if (!featureAnnotation) {
        return;
    }
    [self.mapView deselectAnnotation:featureAnnotation animated:YES];
    [self.mapView removeAnnotation:featureAnnotation];
}

@end
