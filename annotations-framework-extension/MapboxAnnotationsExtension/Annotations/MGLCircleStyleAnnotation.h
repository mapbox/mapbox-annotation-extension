#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLCircleStyleAnnotation` is a type of style layer annotation
 that renders one or more filled circles on the map.
 
 To display a circle style annotation on a map, use one of the initializers below to create a circle
 style annotation object. Then, use `-[MGLCircleAnnotationController add:]` to add the annotation
 to a circle style annotation controller.
 
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

/**
 Returns a new circle style annotation with a specified center.
 
 @param center The coordinate at the center of the circle style annotation.
 @return An initialized circle style annotation at the specified coordinate.
 */
- (instancetype)initWithCenter:(CLLocationCoordinate2D)center;

/**
 Returns a new circle style annotation with a specified center and radius.
 
 @param center The coordinate at the center of the circle style annotation.
 @param radius The radius of the circle, measured in screen points.
 @return An initialized circle style annotation at the specified coordinate with a defined radius.
 */
- (instancetype)initWithCenter:(CLLocationCoordinate2D)center radius:(CGFloat)radius;

/**
 Returns a new circle style annotation with a specified center and radius.
 
 @param center The coordinate at the center of the circle style annotation.
 @param radius The radius of the circle, measured in screen points.
 @param color The fill color of the circle style annotation.
 @return An initialized circle style annotation at the specified coordinate with a defined
    radius and fill color.
 */
- (instancetype)initWithCenter:(CLLocationCoordinate2D)center radius:(CGFloat)radius color:(UIColor *)color;

/**
 The center of the circle style annotation.
 */
@property (nonatomic, assign) CLLocationCoordinate2D center;

/**
 The radius of the circle style annotation, measured in screen points. Defaults to `5`.
 
 This property corresponds to the `circle-radius` property in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-radius).
 */
@property (nonatomic, assign) CGFloat circleRadius;

/**
 The fill color of the circle style annotation. Defaults to black.
 
 This property corresponds to the `circle-color` property in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-color).
 */
@property (nonatomic, assign) UIColor *circleColor;

/**
 The opacity of the fill color associated with the circle style annotation, represented as a range 
 of values between `0` and `1`. Defaults to `1`.
 
 This property corresponds to the `circle-opacity` property in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-opacity).
 */
@property (nonatomic, assign) CGFloat circleOpacity;

/**
 The width of the stroke or "outline" of the circle style annotation, measured in screen points.
 Defaults to `0`.
 
 This property corresponds to the `circle-stroke-width` property in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-stroke-width).
 */
@property (nonatomic, assign) CGFloat circleStrokeWidth;

/**
 The stroke or "outline" color of the circle style annotation. Defaults to black.
 
 This property corresponds to the `circle-stroke-color` property in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-stroke-color).
 */
@property (nonatomic, assign) UIColor *circleStrokeColor;

/**
 The opacity of the stroke or "outline" color of the circle style annotation, represented as a range 
 of values between `0` and `1`. Defaults to `1`.
 
 This property corresponds to the `circle-stroke-opacity` property in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-stroke-opacity).
 */
@property (nonatomic, assign) CGFloat circleStrokeOpacity;

/**
 The amount to blur the circle style annotation, measured in screen points. Defaults to `0`.
 A value of `1` blurs the circle style annotation such that only the centerpoint is shown at full opacity.
 
 This property corresponds to the `circle-blur` property in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-blur).
 */
@property (nonatomic, assign) CGFloat circleBlur;

@end

NS_ASSUME_NONNULL_END
