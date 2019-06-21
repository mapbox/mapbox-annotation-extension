#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLSymbolAnnotationController : MGLAnnotationController

@property (nonatomic, assign) BOOL iconAllowsOverlap;
@property (nonatomic, assign) BOOL iconIgnoresPlacement;
@property (nonatomic, assign) BOOL iconOptional;
@property (nonatomic, assign) CGFloat iconPadding;
@property (nonatomic, assign) MGLIconPitchAlignment iconPitchAlignment;
@property (nonatomic, assign) MGLIconRotationAlignment iconRotationAlignment;
@property (nonatomic, assign) MGLIconTextFit iconTextFit;
@property (nonatomic, assign) UIEdgeInsets  iconTextFitPadding;
@property (nonatomic, assign) BOOL keepsIconUpright;
@property (nonatomic, assign) BOOL keepsTextUpright;
@property (nonatomic, assign) CGFloat maximumTextAngle;
@property (nonatomic, assign) BOOL symbolAvoidsEdges;
@property (nonatomic, assign) MGLSymbolPlacement symbolPlacement;
@property (nonatomic, assign) CGFloat symbolSpacing;
@property (nonatomic, assign) MGLSymbolZOrder symbolZOrder;
@property (nonatomic, assign) BOOL textAllowsOverlap;
@property (nonatomic, assign) CGFloat textLineHeight;
@property (nonatomic, assign) BOOL textOptional;
@property (nonatomic, assign) CGFloat textPadding;
@property (nonatomic, assign) MGLTextPitchAlignment textPitchAlignment;
@property (nonatomic, assign) MGLTextRotationAlignment textRotationAlignment;
@property (nonatomic, assign) MGLTextAnchor textVariableAnchor;
@property (nonatomic, assign) CGVector iconTranslation;
@property (nonatomic, assign) MGLIconTranslationAnchor iconTranslationAnchor;
@property (nonatomic, assign) CGVector textTranslation;
@property (nonatomic, assign) MGLTextTranslationAnchor textTranslationAnchor;


@end

NS_ASSUME_NONNULL_END
