#import "MGLAnnotationController_Private.h"
#import "MGLStyleAnnotation.h"

@interface MGLAnnotationController ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, MGLStyleAnnotation *> *annotations;
@property (nonatomic, strong) MGLShapeSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;

- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MGLAnnotationController

- (instancetype)initWithMapView:(MGLMapView *)mapView {
    if (self = [super init]) {
        self.mapView = mapView;
        NSString *uuid = [[NSUUID UUID] UUIDString];
        
        NSString *sourceIdentifier = [NSString stringWithFormat:@"annotations-extension-source-%@", uuid];
        NSString *geoJSON = @"{\"type\": \"FeatureCollection\",\"features\": []}";
        NSData *data = [geoJSON dataUsingEncoding:NSUTF8StringEncoding];
        MGLShape *shape = [MGLShape shapeWithData:data encoding:NSUTF8StringEncoding error:NULL];
        self.source = [[MGLShapeSource alloc] initWithIdentifier:sourceIdentifier shape:shape options:nil];
        [self.mapView.style addSource:self.source];
        self.annotations = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (instancetype)initWithMapView:(MGLMapView *)mapView belowLayerIdentifier:(nonnull NSString *)layerIdentifier {
    self = [self initWithMapView:mapView];
    
    return self;
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

- (void)handleSingleTapGesture:(UITapGestureRecognizer *)singleTap {
    
}

@end
