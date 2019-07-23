#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLCircleAnnotationController` is a controller that creates internally
 instances of an `MGLShapeSource` and `MGLCicleStyleLayer` to simplify the creation
 of runtime styling based annotations to the map.
 
 Create instances of `MGLCircleStyleAnnotation` and pass it to this controller to add
 circular shapes to an `MGLMapView`.
 
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
@interface MGLCircleAnnotationController : MGLAnnotationController


#pragma mark Layout properties

/**
 The offset distance of the circle style annotation from its anchor coordinate. 
 Positive values indicate right and down, while negative values indicate left and up. 
 Defaults to a `CGVector` struct set to 0 points rightward and 0 points downward.
 
 This property corresponds to the `circle-translate` property in the style [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#paint-circle-translate). 
 */
@property (nonatomic, assign) CGVector circleTranslation;

/**
 Controls the distance of the circle style annotation from its anchor coordinate. 
 Defaults to `map`. Disabled by `circleTranslation`.
 
 * `map`: The circle is translated relative to the map.
 * `viewport`: The circle is translated relative to the viewport.
 
 This property corresponds to the `circle-translate` property in the style [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#paint-circle-translate-anchor). 
 */
@property (nonatomic, assign) MGLCircleTranslationAnchor circleTranslationAnchor;

/**
 Controls the orientation of the circle style annotation when the map is pitched. 
 Defaults to `viewport`.
 
 * `map`: The circle is aligned to the plane of the map.
 * `viewport`: The circle is aligned to the plane of the viewport.
 
 This property corresponds to the `circle-translate` property in the style [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#paint-circle-pitch-alignment). 
 */
@property (nonatomic, assign) MGLCirclePitchAlignment circlePitchAlignment;

/**
 Controls the scaling behavior of the circle style annotation when the map is pitched. 
 Defaults to `map`.
 
 * `map`: Circles are scaled according to their apparent distance to the camera.
 * `viewport`: Circles are not scaled.
 
 This property corresponds to the `circle-translate` property in the style [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#paint-circle-scale-alignment). 
 */
@property (nonatomic, assign) MGLCircleScaleAlignment circleScaleAlignment;

@end

NS_ASSUME_NONNULL_END
