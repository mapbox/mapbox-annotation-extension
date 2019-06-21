#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLCircleStyleAnnotation : MGLStyleAnnotation

@property (nonatomic, assign) CGFloat circleRadius;
@property (nonatomic, assign) UIColor *circleStrokeColor;
@property (nonatomic, assign) CGFloat circleStrokeOpacity;
@property (nonatomic, assign) CGFloat circleStrokeWidth;
@property (nonatomic, assign) CGFloat circleBlur;
@property (nonatomic, assign) UIColor *circleColor;
@property (nonatomic, assign) CGFloat circleOpacity;

- (instancetype)init:(CLLocationCoordinate2D)center;
- (instancetype)init:(CLLocationCoordinate2D)center radius:(CGFloat)radius;
- (instancetype)init:(CLLocationCoordinate2D)center radius:(CGFloat)radius color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
