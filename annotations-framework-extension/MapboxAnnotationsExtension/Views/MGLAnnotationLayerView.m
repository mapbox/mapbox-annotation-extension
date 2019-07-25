#import "MGLAnnotationLayerView.h"
#import "MGLAnnotationController_Private.h"
#import "MGLStyleAnnotation_Private.h"

@interface MGLAnnotationLayerView()<UIGestureRecognizerDelegate>

@property (nonatomic) UITapGestureRecognizer *singleTapGestureRecognizer;
@property (nonatomic) id<MGLFeature> selectedFeature;
@property (nonatomic) NSArray *features;

@end

@implementation MGLAnnotationLayerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        self.singleTapGestureRecognizer.numberOfTapsRequired = 1;
        self.singleTapGestureRecognizer.delegate = self;
        [self addGestureRecognizer:self.singleTapGestureRecognizer];
        
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect pointRect = {point, CGSizeZero};
    CGRect positionRect = CGRectInset(pointRect, -22.0, -22.0);
    self.features = [self.annotationController.mapView visibleFeaturesInRect:positionRect
                                                    inStyleLayersWithIdentifiers:[NSSet setWithArray:@[self.annotationController.layer.identifier]]];
    
    return self.features.count ? YES : NO;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    return view;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)singleTap {
    
    CGPoint point = [singleTap locationInView:self.annotationController.mapView];
    CLLocationCoordinate2D currentCoordinate = [self.annotationController.mapView convertPoint:point
                                                                          toCoordinateFromView:self.annotationController.mapView];
    NSArray *sortedFeatures = [self.features sortedArrayUsingComparator:^NSComparisonResult(id<MGLFeature>  _Nonnull featureA, id<MGLFeature>  _Nonnull featureB) {
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
    [self.annotationController.mapView selectAnnotation:feature animated:YES];
}

- (void)removeAnnotationFromMapView:(id<MGLFeature>)featureAnnotation {
    if (!featureAnnotation) {
        return;
    }
    [self.annotationController.mapView deselectAnnotation:featureAnnotation animated:YES];
    [self.annotationController.mapView removeAnnotation:featureAnnotation];
    self.selectedFeature = nil;
}

@end
