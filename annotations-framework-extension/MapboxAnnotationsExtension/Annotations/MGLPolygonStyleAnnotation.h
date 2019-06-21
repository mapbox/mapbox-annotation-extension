#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLPolygonStyleAnnotation : MGLStyleAnnotation

@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) CGFloat fillOpacity;
@property (nonatomic, strong) UIColor *fillOutlineColor;
@property (nonatomic, strong) NSArray *fillPattern;

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count;
- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count fillColor:(UIColor *)fillColor;
- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count interiorPolygons:(NSArray<MGLPolygonFeature *> *)interiorPolygons;

@end

NS_ASSUME_NONNULL_END
