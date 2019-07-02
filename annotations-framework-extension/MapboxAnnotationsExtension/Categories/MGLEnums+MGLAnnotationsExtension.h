#import <Foundation/Foundation.h>
@import Mapbox;

NS_ASSUME_NONNULL_BEGIN

@interface MGLEnums : NSObject

# pragma mark - Circle Style Layer enum properties
+ (NSString *)stringFromMGLCircleTranslationAnchor:(MGLCircleTranslationAnchor)translationAnchor;
+ (MGLCircleTranslationAnchor)circleTranslationAnchorFromNSString:(NSString *)translationAnchorString;

+ (NSString *)stringFromMGLCirclePitchAlignment:(MGLCirclePitchAlignment)circlePitchAlignment;
+ (MGLCirclePitchAlignment)circlePitchAlignmentFromNSString:(NSString *)circlePitchAlignmentString;

+ (NSString *)stringFromMGLCircleScaleAlignment:(MGLCircleScaleAlignment)circleScaleAlignment;
+ (MGLCircleScaleAlignment)circleScaleAlignmentFromNSString:(NSString *)circleScaleAlignmentString;

# pragma mark - Line Style Layer enum properties

+ (NSString *)stringFromMGLLineJoin:(MGLLineJoin)lineJoin;
+ (MGLLineJoin)lineJoinFromNSString:(NSString *)lineJoinString;

+ (NSString *)stringFromMGLLineCap:(MGLLineCap)lineCap;
+ (MGLLineCap)lineCapFromNSString:(NSString *)lineCapString;

+ (NSString *)stringFromMGLLineTranslationAnchor:(MGLLineTranslationAnchor)lineTranslationAnchor;
+ (MGLLineTranslationAnchor)lineTranslationAnchorFromNSString:(NSString *)lineTranslationAnchorString;

#pragma mark - Symbol Style Layer enum properties

+ (MGLIconPitchAlignment)iconPitchAlignmentFromNSString:(NSString *)iconPitchAlignmentString;

+ (NSString *)stringFromMGLIconRotationAlignment:(MGLIconRotationAlignment)iconRotationAlignment;
+ (MGLIconRotationAlignment)iconRotationAlignmentFromNSString:(NSString *)iconRotationAlignment;

+ (MGLIconTextFit)iconTextFitFromNSString:(NSString *)iconTextFit;

+ (MGLSymbolPlacement)symbolPlacementFromNSString:(NSString *)symbolPlacement;

+ (MGLSymbolZOrder)symbolZOrderFromNSString:(NSString *)symbolZOrder;

+ (MGLTextPitchAlignment)textPitchAlignmentFromNSString:(NSString *)textPitchAlignment;

+ (MGLTextRotationAlignment)textRotationAlignmentFromNSString:(NSString *)textRotationAlignment;

+ (NSString *)stringFromMGLTextAnchor:(MGLTextAnchor)textAnchor;
+ (MGLTextAnchor)textAnchorFromNSString:(NSString *)textAnchor;

+ (MGLIconTranslationAnchor)iconTranslationAnchorFromNSString:(NSString *)iconTranslationAnchor;

+ (MGLTextTranslationAnchor)textTranslationAnchorFromNSString:(NSString *)textTranslationAnchor;

+ (NSString *)stringFromMGLIconAnchor:(MGLIconAnchor)iconAnchor;
+ (MGLIconAnchor)iconAnchorFromNSString:(NSString *)iconAnchor;

+ (NSString *)stringFromMGLTextJustification:(MGLTextJustification)textJustification;
+ (MGLTextJustification)textJustificationFromNSString:(NSString *)textJustification;

+ (NSString *)stringFromMGLTextTransform:(MGLTextTransform)textTransform;
+ (MGLTextTransform)textTransformFromNSString:(NSString *)textTransform;

#pragma mark - Fill Style Layer enum properties

+ (NSString *)stringFromMGLFillTranslationAnchor:(MGLFillTranslationAnchor)translationAnchor;
+ (MGLFillTranslationAnchor)fillTranslationAnchorFromNSString:(NSString *)translationAnchorString;


@end

NS_ASSUME_NONNULL_END
