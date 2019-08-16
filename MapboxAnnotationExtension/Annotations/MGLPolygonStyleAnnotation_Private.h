#import "MGLPolygonStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MGLPropertyPolygonOpacity;
FOUNDATION_EXPORT NSString *const MGLPropertyPolygonColor;
FOUNDATION_EXPORT NSString *const MGLPropertyPolygonOutlineColor;
FOUNDATION_EXPORT NSString *const MGLPropertyPolygonPattern;

@interface MGLPolygonStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END

