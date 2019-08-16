#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MGLPropertyAnnotationIdentifier;
FOUNDATION_EXPORT NSString *const MGLPropertyAnnotationTitle;
FOUNDATION_EXPORT NSString *const MGLPropertyAnnotationSubtitle;
FOUNDATION_EXPORT NSString *const MGLPropertyAnnotationTooltip;

@interface MGLStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta;

@end

NS_ASSUME_NONNULL_END
