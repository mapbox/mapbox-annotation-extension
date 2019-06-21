#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLCircleAnnotationController : MGLAnnotationController

@property (nonatomic, assign) CGVector circleTranslation;
@property (nonatomic, assign) MGLCircleTranslationAnchor circleTranslationAnchor;
@property (nonatomic, assign) MGLCirclePitchAlignment circlePitchAlignment;
@property (nonatomic, assign) MGLCircleScaleAlignment circleScaleAlignment;

@end

NS_ASSUME_NONNULL_END
