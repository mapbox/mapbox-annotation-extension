#import "MGLCircleStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN


FOUNDATION_EXPORT NSString *const MGLPropertyCircleRadius;
FOUNDATION_EXPORT NSString *const MGLPropertyCircleColor;
FOUNDATION_EXPORT NSString *const MGLPropertyCircleBlur;
FOUNDATION_EXPORT NSString *const MGLPropertyCircleOpacity;
FOUNDATION_EXPORT NSString *const MGLPropertyCircleStrokeWidth;
FOUNDATION_EXPORT NSString *const MGLPropertyCircleStrokeColor;
FOUNDATION_EXPORT NSString *const MGLPropertyCircleStrokeOpacity;

@interface MGLCircleStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END
