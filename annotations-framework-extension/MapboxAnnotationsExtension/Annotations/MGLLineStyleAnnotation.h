#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLLineStyleAnnotation : MGLStyleAnnotation

@property (nonatomic, assign) MGLLineJoin lineJoin;
@property (nonatomic, assign) CGFloat lineBlur;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineGapWidth;
@property (nonatomic, assign) CGFloat lineOffset;
@property (nonatomic, assign) CGFloat lineOpacity;
@property (nonatomic, strong) NSString *linePattern;
@property (nonatomic, assign) CGFloat lineWidth;

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count;
- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
