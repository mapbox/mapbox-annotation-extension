#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLCircleStyleAnnotation` is an `MGLCircleStyleLayer` style layer annotation
 that renders one or more filled circles on the map.
 
 A circle style annotation renders circles whose radii are measured in screen units.
 
 ### Example
 
 ```swift
 func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
    let circleAnnotationController = MGLCircleAnnotationController(mapView: self.mapView)
    let circle = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), radius: 3.0, color: .blue)
    circle.opacity = 0.5
    circleAnnotationController.add(circle)
 }
 ```
 */
@interface MGLCircleStyleAnnotation : MGLStyleAnnotation

@property (nonatomic, assign) CGFloat circleRadius;
@property (nonatomic, assign) UIColor *circleStrokeColor;
@property (nonatomic, assign) CGFloat circleStrokeOpacity;
@property (nonatomic, assign) CGFloat circleStrokeWidth;
@property (nonatomic, assign) CGFloat circleBlur;
@property (nonatomic, assign) UIColor *circleColor;
@property (nonatomic, assign) CGFloat circleOpacity;

- (instancetype)initWithCenter:(CLLocationCoordinate2D)center;
- (instancetype)initWithCenter:(CLLocationCoordinate2D)center radius:(CGFloat)radius;
- (instancetype)initWithCenter:(CLLocationCoordinate2D)center radius:(CGFloat)radius color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
