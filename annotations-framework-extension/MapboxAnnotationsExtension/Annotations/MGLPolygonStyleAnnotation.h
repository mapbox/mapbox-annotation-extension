#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLPolygonStyleAnnotation` is a type of style layer annotation that
 renders one or more polygons on the map.
 
 To display a line style annotation on a map, use one of the initializers below to create a polygon
 style annotation object. Then, use `-[MGLPolygonAnnotationController add:]` to add the annotation
 to a polygon style annotation controller.
 
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
    polygonAnnotationController.add(polygon)
 }
 ```
 */
@interface MGLPolygonStyleAnnotation : MGLStyleAnnotation

/**
 Returns a polygon style annotation initialized with coordinates.
 
 @param coordinates An array of coordinates representing the polygon shape.
 @return An initialized polygon style annotation.
 */
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count;

/**
 Returns a polygon style annotation initialized with coordinates and a specified fill color.
 
 @param coordinates An array of coordinates representing the polygon shape.
 @param fillColor The fill color of the polygon style annotation.
 @return An initialized polygon style annotation with a defined fill color.
 */
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count fillColor:(UIColor *)fillColor;

/**
 Returns a polygon style annotation with interior polygons, initialized with coordinates 
 and a specified fill color.
 
 @param coordinates An array of coordinates representing the polygon shape.
 @param interiorPolygons An array of `MGLPolygonFeature`s  that represent any holes the 
    polygon may contain.
 @return An initialized polygon style annotation with a defined fill color.
 */
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count interiorPolygons:(NSArray<MGLPolygonFeature *> *)interiorPolygons;

/**
 The fill color of the polygon style annotation. Defaults to black.
 
 This property corresponds to the `fill-color` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-color).
 */
@property (nonatomic, strong) UIColor *fillColor;

/**
 The stroke or "outline" color of the polygon style annotation. Not set by default. 
 Disabled if `fillPattern` is specified.
 
 This property corresponds to the `fill-outline-color` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-outline-color).
 */
@property (nonatomic, strong) UIColor *fillOutlineColor;

/**
 The opacity of the fill color associated with the polygon style annotation, represented as a range 
 of values between `0` and `1`. Defaults to `1`.
 
 This property corresponds to the `fill-opacity` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-opacity).
 */
@property (nonatomic, assign) CGFloat fillOpacity;

/**
 The name of the image within an `MGLMapStyle`'s [sprite](https://docs.mapbox.com/help/glossary/sprite/) 
 to use for filling the polygon style annotation. Not set by default.
 
 To add an image to the map style's sprite, use the `-[MGLStyle setImage:forName:]` method 
 within the [Mapbox Maps SDK for iOS](https://docs.mapbox.com/ios/api/maps/).
 For seamless patterns, image width must be a factor of two (2, 4, 8, …, 512).
 
 This property corresponds to the `fill-pattern` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-pattern).
 */
@property (nonatomic, strong) NSString *fillPattern;

@end

NS_ASSUME_NONNULL_END
