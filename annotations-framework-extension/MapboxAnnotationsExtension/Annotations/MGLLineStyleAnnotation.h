#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLLineStyleAnnotation` is a type of style layer annotation that
 renders one or more stroked polylines on the map.
 
 To display a line style annotation on a map, use one of the initializers below to create a line
 style annotation object. Then, use `-[MGLLineAnnotationController add:]` to add the annotation
 to a line style annotation controller.
 
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
@interface MGLLineStyleAnnotation : MGLStyleAnnotation

/**
 Returns a line style annotation initialized with coordinates.
 
 @param coordinates An array of coordinates representing the line shape.
 @return An initialized line style annotation.
 */
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count;

/**
 Returns a line style annotation initialized with coordinates and a specified line color.
 
 @param coordinates An array of coordinates representing the line shape.
 @param color The line color of the line style annotation.
 @return An initialized line style annotation with a defined line color.
 */
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count color:(UIColor *)color;

/**
 The color with which the line style annotation will be drawn. Defaults to black.
 
 This property corresponds to the `line-color` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-color).
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 The width of the line style annotation, measured in screen points. Defaults to `1`.
 
 This property corresponds to the `line-width` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-width).
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 The opacity of the line style annotation, represented as a range of values between `0` and `1`.
 Defaults to `1`.
 
 This property corresponds to the `line-opacity` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-opacity).
 */
@property (nonatomic, assign) CGFloat lineOpacity;

/**
 Draws a line casing outside of the line style annotation's actual coordinate path. 
 Value indicates the width of the inner gap, measured in screen points. Defaults to `0`.
 
 This property corresponds to the `line-gap-width` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-gap-width).
 */
@property (nonatomic, assign) CGFloat lineGapWidth;

/**
 The display of the line style annotation when joining with other lines, as specified by `MGLLineJoin`. 
 Defaults to `miter`.
 
 This property corresponds to the `line-join` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-join).
 */
@property (nonatomic, assign) MGLLineJoin lineJoin;

/**
 The blur applied to the line, measured in screen points greater than or equal to zero. 
 Defaults to `0`.
 
 This property corresponds to the `line-blur` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-blue).
 */
@property (nonatomic, assign) CGFloat lineBlur;

/**
 The line style annotation's offset. A positive value offsets the line to the right, relative to 
 the direction of the line. A negative value offsets the line to the left. Defaults to `0`.
 
 This property corresponds to the `line-offset` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-offset).
 */
@property (nonatomic, assign) CGFloat lineOffset;

/**
 The name of the image within an `MGLMapStyle`'s [sprite](https://docs.mapbox.com/help/glossary/sprite/) 
 to use for drawing image lines. Not set by default. 
 
 To add an image to the map style's sprite, 
 use the `-[MGLStyle setImage:forName:]` method within the [Mapbox Maps SDK for iOS](https://docs.mapbox.com/ios/api/maps/).
 For seamless patterns, image width must be a factor of two (2, 4, 8, …, 512).
 
 This property corresponds to the `line-pattern` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-pattern).
 */
@property (nonatomic, strong) NSString *linePattern;

@end

NS_ASSUME_NONNULL_END
