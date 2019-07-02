#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLPolygonAnnotationController : MGLAnnotationController

@property (nonatomic, assign) BOOL fillAntialiased;
@property (nonatomic, assign) CGVector fillTranslation;
@property (nonatomic, assign) MGLFillTranslationAnchor fillTranslationAnchor;

@end

NS_ASSUME_NONNULL_END
