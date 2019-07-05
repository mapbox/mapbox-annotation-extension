#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLPolygonStyleAnnotation` is an `MGLFillStyleLayer` style layer annotation that
 renders one or more filled (and optionally stroked) polygons on the map.
 
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
@interface MGLPolygonStyleAnnotation : MGLStyleAnnotation

@property (nonatomic, strong) NSArray<MGLPolygonFeature *> *interiorPolygons;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) CGFloat fillOpacity;
@property (nonatomic, strong) UIColor *fillOutlineColor;
@property (nonatomic, strong) NSString *fillPattern;

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count;
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count fillColor:(UIColor *)fillColor;
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count interiorPolygons:(NSArray<MGLPolygonFeature *> *)interiorPolygons;

@end

NS_ASSUME_NONNULL_END
