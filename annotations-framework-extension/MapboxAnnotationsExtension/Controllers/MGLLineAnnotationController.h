#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLLineAnnotationController : MGLAnnotationController

@property (nonatomic, assign) MGLLineCap lineCap;
@property (nonatomic, assign) CGFloat lineMiterLimit;
@property (nonatomic, assign) CGFloat lineRoundLimit;
@property (nonatomic, strong) NSArray *lineDashPattern;
@property (nonatomic, strong) UIColor *lineGradient;
@property (nonatomic, assign) CGVector lineTranslation;
@property (nonatomic, assign) MGLLineTranslationAnchor lineTranslationAnchor;

@end

NS_ASSUME_NONNULL_END
