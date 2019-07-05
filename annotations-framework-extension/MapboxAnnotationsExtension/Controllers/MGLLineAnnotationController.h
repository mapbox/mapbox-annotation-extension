#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLLineAnnotationController` is a controller that creates internally
 instances of an `MGLShapeSource` and `MGLLineStyleLayer` to simplify the creation
 of runtime styling based annotations to the map.
 
 Create instances of `MGLLineStyleAnnotation` and pass it to this controller.
 
 ### Example
 
 ```swift
 func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
    let lineAnnotationController = MGLLineAnnotationController(mapView: self.mapView)
 
    let lineCoordinates = [
        CLLocationCoordinate2D(latitude: 59, longitude: 18),
        CLLocationCoordinate2D(latitude: 60, longitude: 20)
    ]
 
    let line = MGLLineStyleAnnotation(coordinates: lineCoordinates, count: UInt(lineCoordinates.count))
    line.color = .purple
    lineAnnotationController.add(line)
 }
 ```
 */
@interface MGLLineAnnotationController : MGLAnnotationController

@property (nonatomic, assign) MGLLineCap lineCap;
@property (nonatomic, assign) CGFloat lineMiterLimit;
@property (nonatomic, assign) CGFloat lineRoundLimit;
@property (nonatomic, strong) NSArray *lineDashPattern;
@property (nonatomic, strong) UIColor *lineGradient;
@property (nonatomic, assign) CGVector lineTranslation;
@property (nonatomic, assign) MGLLineTranslationAnchor lineTranslationAnchor;

@end

NS_ASSUME_NONNULL_END
