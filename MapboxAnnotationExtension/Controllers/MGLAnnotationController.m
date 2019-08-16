#import "MGLAnnotationController_Private.h"
#import "MGLStyleAnnotation_Private.h"
#import "MGLAnnotationLayerView.h"

@interface MGLAnnotationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableDictionary<NSString *, MGLStyleAnnotation *> *annotations;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;
@property (nonatomic, strong) MGLShapeSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;
@property (nonatomic) UITapGestureRecognizer *singleTapGestureRecognizer;
@property (nonatomic) id<MGLFeature> selectedFeature;
@property (nonatomic, assign) BOOL interactionEnabled;
@property (nonatomic, strong) MGLAnnotationLayerView *annotationLayerView;

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
    
    self.annotationLayerView = [[MGLAnnotationLayerView alloc] initWithFrame:mapView.frame];
    self.annotationLayerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.annotationLayerView.userInteractionEnabled = YES;
    self.annotationLayerView.annotationController = self;
    [mapView addSubview:self.annotationLayerView];
    
    self.annotationsInteractionEnabled = YES;
}

- (void)setAnnotationsInteractionEnabled:(BOOL)annotationsInteractionEnabled {
    self.annotationLayerView.userInteractionEnabled = annotationsInteractionEnabled;
}

- (BOOL)annotationsInteractionEnabled {
    return self.annotationLayerView.userInteractionEnabled;
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


- (void)selectStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation {
    [self.annotationLayerView selectAnnotation:styleAnnotation.feature];
}

- (void)deselectStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation {
    [self.annotationLayerView deselectAnnotation:styleAnnotation.feature];
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
        [features addObject:annotation.feature];
        [weakSelf enablePaintProperties:annotation];
    }];
    
    [self setPaintProperties];

    MGLShape *shape = [MGLShapeCollectionFeature shapeCollectionWithShapes:features];
    self.source.shape = shape;
    
}

- (NSArray<MGLStyleAnnotation *> *)styleAnnotations {
    return self.annotations.allValues;
}

- (void)dealloc {
    [self.annotationLayerView removeFromSuperview];
}

@end
