#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLPolygonAnnotationController` is a controller that creates internally
 instances of an `MGLShapeSource` and `MGLFillStyleLayer` to simplify the creation
 of runtime styling based annotations to the map.
 
 Create instances of `MGLPolygonStyleAnnotation` and pass it to this controller.
 
 ### Example
 
 ```swift
 func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
    let polygonAnnotationController = MGLPolygonAnnotationController(mapView: self.mapView)
 
    let polygonCoordinates = [
        CLLocationCoordinate2DMake(59, 18),
        CLLocationCoordinate2DMake(62, 19),
        CLLocationCoordinate2DMake(54, 20),
        CLLocationCoordinate2DMake(59, 18)
    ]
 
    let polygon = MGLPolygonStyleAnnotation(coordinates: polygonCoordinates, count: UInt(polygonCoordinates.count))
    polygon.fillOutlineColor = .red
    polygonAnnotationController.add(line)
 }
 ```
 */
@interface MGLPolygonAnnotationController : MGLAnnotationController

@property (nonatomic, assign) BOOL fillAntialiased;
@property (nonatomic, assign) CGVector fillTranslation;
@property (nonatomic, assign) MGLFillTranslationAnchor fillTranslationAnchor;

@end

NS_ASSUME_NONNULL_END
