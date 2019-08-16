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

/**
 The display of line endings, as defined by `MGLLineCap`. Defaults to `butt`.
 
 This property corresponds to the `line-cap` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-cap).
 */
@property (nonatomic, assign) MGLLineCap lineCap;

/**
 Used to automatically convert miter joins to bevel joins for sharp angles. 
 Requires `lineJoin` to be set to `miter`. Defaults to a `CGFloat` that evaluates to `2`.
 
 This property corresponds to the `line-miter-limit` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-miter-limit).
 */
@property (nonatomic, assign) CGFloat lineMiterLimit;

/**
 Used to automatically convert round joins to miter joins for shallow angles.
 Requires `lineJoin` to be set to `round`. Defaults to a `CGFloat` that evaluates to `1.05`.
 
 This property corresponds to the `line-round-limit` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-round-limit).
 */
@property (nonatomic, assign) CGFloat lineRoundLimit;

/**
 Specifies the lengths of the alternating dashes and gaps that form a dash pattern for 
 a line style annotation. Dash lengths are later scaled by the line width. 
 
 This property corresponds to the `line-dasharray` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-dasharray).
 */
@property (nonatomic, strong) NSArray *lineDashPattern;

/**
 The offset distance of the line style annotation from its anchor, measured in screen points. 
 Positive values indicate right and down, while negative values indicate left and up. 
 Defaults to a `CGVector` struct set to 0 points rightward and 0 points downward.
 
 This property corresponds to the `line-translate` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-translate).
 */
@property (nonatomic, assign) CGVector lineTranslation;

/**
 Controls the frame of reference for `lineTranslate`, as defined by `MGLLineTranslationAnchor`.
 Requires `lineTranslate`. Defaults to `map`.
 
 This property corresponds to the `line-translate-anchor` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-translate-anchor).
 */
@property (nonatomic, assign) MGLLineTranslationAnchor lineTranslationAnchor;

@property (nonatomic, strong) UIColor *lineGradient;

@end

NS_ASSUME_NONNULL_END
