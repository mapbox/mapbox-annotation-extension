#import "MGLLineStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MGLPropertyLineJoin;
FOUNDATION_EXPORT NSString *const MGLPropertyLineBlur;
FOUNDATION_EXPORT NSString *const MGLPropertyLineColor;
FOUNDATION_EXPORT NSString *const MGLPropertyLineGapWidth;
FOUNDATION_EXPORT NSString *const MGLPropertyLineOffset;
FOUNDATION_EXPORT NSString *const MGLPropertyLineOpacity;
FOUNDATION_EXPORT NSString *const MGLPropertyLinePattern;
FOUNDATION_EXPORT NSString *const MGLPropertyLineWidth;

@interface MGLLineStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END
