#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLLineStyleAnnotation` is an `MGLLineStyleLayer` style layer that
 renders one or more stroked polylines on the map.
 
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

@property (nonatomic, assign) MGLLineJoin lineJoin;
@property (nonatomic, assign) CGFloat lineBlur;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineGapWidth;
@property (nonatomic, assign) CGFloat lineOffset;
@property (nonatomic, assign) CGFloat lineOpacity;
@property (nonatomic, strong) NSString *linePattern;
@property (nonatomic, assign) CGFloat lineWidth;

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count;
- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
