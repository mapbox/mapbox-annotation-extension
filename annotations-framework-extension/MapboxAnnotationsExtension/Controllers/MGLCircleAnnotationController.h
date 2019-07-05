#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLCircleAnnotationController` is a controller that creates internally
 instances of an `MGLShapeSource` and `MGLCicleStyleLayer` to simplify the creation
 of runtime styling based annotations to the map.
 
 Create instances of `MGLCircleStyleAnnotation` and pass it to this controller.
 
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

@property (nonatomic, assign) CGVector circleTranslation;
@property (nonatomic, assign) MGLCircleTranslationAnchor circleTranslationAnchor;
@property (nonatomic, assign) MGLCirclePitchAlignment circlePitchAlignment;
@property (nonatomic, assign) MGLCircleScaleAlignment circleScaleAlignment;

@end

NS_ASSUME_NONNULL_END
