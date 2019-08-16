#import "MGLEnums+MGLAnnotationExtension.h"

@implementation MGLEnums

+ (NSString *)stringFromMGLLineJoin:(MGLLineJoin)lineJoin {
    NSDictionary *constantValues = @{
                                     [NSNumber numberWithInteger:MGLLineJoinBevel] : @"bevel",
                                     [NSNumber numberWithInteger:MGLLineJoinRound] : @"round",
                                     [NSNumber numberWithInteger:MGLLineJoinMiter] : @"miter"
                                     };
    return constantValues[[NSNumber numberWithInteger:lineJoin]];
}

+ (MGLLineJoin)lineJoinFromNSString:(NSString *)lineJoinString {
    NSDictionary<NSString *, NSValue*> *constantValues = @{
                                                           @"bevel" : [NSValue valueWithMGLLineJoin:MGLLineJoinBevel],
                                                           @"round" : [NSValue valueWithMGLLineJoin:MGLLineJoinRound],
                                                           @"miter" : [NSValue valueWithMGLLineJoin:MGLLineJoinMiter]
                                                           };

    MGLLineJoin lineJoin = -1;

    if (constantValues[lineJoinString]) {
        lineJoin = constantValues[lineJoinString].MGLLineJoinValue;
    }

    return lineJoin;
}

+ (NSString *)stringFromMGLCircleTranslationAnchor:(MGLCircleTranslationAnchor)translationAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLCircleTranslationAnchorMap] : @"map",
                                                             [NSNumber numberWithInteger:MGLCircleTranslationAnchorViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:translationAnchor]];
}

+ (MGLCircleTranslationAnchor)circleTranslationAnchorFromNSString:(NSString *)translationAnchorString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLCircleTranslationAnchor:MGLCircleTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMGLCircleTranslationAnchor:MGLCircleTranslationAnchorViewport],
                                                            };
    return constantValues[translationAnchorString].MGLCircleTranslationAnchorValue;
}

+ (NSString *)stringFromMGLCirclePitchAlignment:(MGLCirclePitchAlignment)circlePitchAlignment {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLCirclePitchAlignmentMap] : @"map",
                                                             [NSNumber numberWithInteger:MGLCirclePitchAlignmentViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:circlePitchAlignment]];
}

+ (MGLCirclePitchAlignment)circlePitchAlignmentFromNSString:(NSString *)circlePitchAlignmentString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLCirclePitchAlignment:MGLCirclePitchAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMGLCirclePitchAlignment:MGLCirclePitchAlignmentViewport],
                                                            };
    return constantValues[circlePitchAlignmentString].MGLCirclePitchAlignmentValue;
}

+ (NSString *)stringFromMGLCircleScaleAlignment:(MGLCircleScaleAlignment)circleScaleAlignment {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLCircleScaleAlignmentMap] : @"map",
                                                             [NSNumber numberWithInteger:MGLCircleScaleAlignmentViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:circleScaleAlignment]];
}

+ (MGLCircleScaleAlignment)circleScaleAlignmentFromNSString:(NSString *)circleScaleAlignmentString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLCircleScaleAlignment:MGLCircleScaleAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMGLCircleScaleAlignment:MGLCircleScaleAlignmentViewport],
                                                            };
    return constantValues[circleScaleAlignmentString].MGLCircleScaleAlignmentValue;
}

+ (NSString *)stringFromMGLLineCap:(MGLLineCap)lineCap {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLLineCapButt] : @"butt",
                                                             [NSNumber numberWithInteger:MGLLineCapRound] : @"round",
                                                             [NSNumber numberWithInteger:MGLLineCapSquare] : @"square",
                                                             };
    return constantValues[[NSNumber numberWithInteger:lineCap]];
}

+ (MGLLineCap)lineCapFromNSString:(NSString *)lineCapString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"butt" : [NSValue valueWithMGLLineCap:MGLLineCapButt],
                                                            @"round" : [NSValue valueWithMGLLineCap:MGLLineCapRound],
                                                            @"square" : [NSValue valueWithMGLLineCap:MGLLineCapSquare]
                                                            };
    return constantValues[lineCapString].MGLLineCapValue;
}

+ (NSString *)stringFromMGLLineTranslationAnchor:(MGLLineTranslationAnchor)lineTranslationAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLLineTranslationAnchorMap] : @"map",
                                                             [NSNumber numberWithInteger:MGLLineTranslationAnchorViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:lineTranslationAnchor]];
}

+ (MGLLineTranslationAnchor)lineTranslationAnchorFromNSString:(NSString *)lineTranslationAnchorString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLLineTranslationAnchor:MGLLineTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMGLLineTranslationAnchor:MGLLineTranslationAnchorViewport],
                                                            };
    return constantValues[lineTranslationAnchorString].MGLLineTranslationAnchorValue;
}

#pragma mark - Symbol layer enum transformation

+ (MGLIconPitchAlignment)iconPitchAlignmentFromNSString:(NSString *)iconPitchAlignmentString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLIconPitchAlignment:MGLIconPitchAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMGLIconPitchAlignment:MGLIconPitchAlignmentViewport],
                                                            @"auto" : [NSValue valueWithMGLIconPitchAlignment:MGLIconPitchAlignmentAuto],
                                                            };
    return constantValues[iconPitchAlignmentString].MGLIconPitchAlignmentValue;
}

+ (NSString *)stringFromMGLIconRotationAlignment:(MGLIconRotationAlignment)iconRotationAlignment {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLIconRotationAlignmentMap] : @"map",
                                                             [NSNumber numberWithInteger:MGLIconRotationAlignmentViewport] : @"viewport",
                                                             [NSNumber numberWithInteger:MGLIconRotationAlignmentAuto] : @"auto",
                                                             };
    return constantValues[[NSNumber numberWithInteger:iconRotationAlignment]];
}

+ (MGLIconRotationAlignment)iconRotationAlignmentFromNSString:(NSString *)iconRotationAlignment {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLIconRotationAlignment:MGLIconRotationAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMGLIconRotationAlignment:MGLIconRotationAlignmentViewport],
                                                            @"auto" : [NSValue valueWithMGLIconRotationAlignment:MGLIconRotationAlignmentAuto],
                                                            };
    return constantValues[iconRotationAlignment].MGLIconRotationAlignmentValue;
}

+ (MGLIconTextFit)iconTextFitFromNSString:(NSString *)iconTextFit {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"both" : [NSValue valueWithMGLIconTextFit:MGLIconTextFitBoth],
                                                            @"none" : [NSValue valueWithMGLIconTextFit:MGLIconTextFitNone],
                                                            @"width" : [NSValue valueWithMGLIconTextFit:MGLIconTextFitWidth],
                                                            @"height" : [NSValue valueWithMGLIconTextFit:MGLIconTextFitHeight],
                                                            };
    return constantValues[iconTextFit].MGLIconTextFitValue;
}

+ (MGLSymbolPlacement)symbolPlacementFromNSString:(NSString *)symbolPlacement {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"point" : [NSValue valueWithMGLSymbolPlacement:MGLSymbolPlacementPoint],
                                                            @"line" : [NSValue valueWithMGLSymbolPlacement:MGLSymbolPlacementLine],
                                                            @"line-center" : [NSValue valueWithMGLSymbolPlacement:MGLSymbolPlacementLineCenter],
                                                            };
    return constantValues[symbolPlacement].MGLSymbolPlacementValue;
}

+ (MGLSymbolZOrder)symbolZOrderFromNSString:(NSString *)symbolZOrder {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"auto" : [NSValue valueWithMGLSymbolZOrder:MGLSymbolZOrderAuto],
                                                            @"source" : [NSValue valueWithMGLSymbolZOrder:MGLSymbolZOrderSource],
                                                            @"viewport-y" : [NSValue valueWithMGLSymbolZOrder:MGLSymbolZOrderViewportY],
                                                            };
    return constantValues[symbolZOrder].MGLSymbolZOrderValue;
}

+ (MGLTextPitchAlignment)textPitchAlignmentFromNSString:(NSString *)textPitchAlignment {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLTextPitchAlignment:MGLTextPitchAlignmentMap],
                                                            @"auto" : [NSValue valueWithMGLTextPitchAlignment:MGLTextPitchAlignmentAuto],
                                                            @"viewport" : [NSValue valueWithMGLTextPitchAlignment:MGLTextPitchAlignmentViewport],
                                                            };
    return constantValues[textPitchAlignment].MGLTextPitchAlignmentValue;
}

+ (MGLTextRotationAlignment)textRotationAlignmentFromNSString:(NSString *)textRotationAlignment {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLTextRotationAlignment:MGLTextRotationAlignmentMap],
                                                            @"auto" : [NSValue valueWithMGLTextRotationAlignment:MGLTextRotationAlignmentAuto],
                                                            @"viewport" : [NSValue valueWithMGLTextRotationAlignment:MGLTextRotationAlignmentViewport],
                                                            };
    return constantValues[textRotationAlignment].MGLTextRotationAlignmentValue;
}

+ (NSString *)stringFromMGLTextAnchor:(MGLTextAnchor)textAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLTextAnchorTop] : @"top",
                                                             [NSNumber numberWithInteger:MGLTextAnchorLeft] : @"left",
                                                             [NSNumber numberWithInteger:MGLTextAnchorRight] : @"right",
                                                             [NSNumber numberWithInteger:MGLTextAnchorBottom] : @"bottom",
                                                             [NSNumber numberWithInteger:MGLTextAnchorCenter] : @"center",
                                                             [NSNumber numberWithInteger:MGLTextAnchorTopLeft] : @"top-left",
                                                             [NSNumber numberWithInteger:MGLTextAnchorTopRight] : @"top-right",
                                                             [NSNumber numberWithInteger:MGLTextAnchorBottomLeft] : @"bottom-left",
                                                             [NSNumber numberWithInteger:MGLTextAnchorBottomRight] : @"bottom-right",
                                                             };
    return constantValues[[NSNumber numberWithInteger:textAnchor]];
}

+ (MGLTextAnchor)textAnchorFromNSString:(NSString *)textAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"top" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorTop],
                                                            @"left" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorLeft],
                                                            @"right" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorRight],
                                                            @"bottom" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorBottom],
                                                            @"center" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorCenter],
                                                            @"top-left" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorTopLeft],
                                                            @"top-right" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorTopRight],
                                                            @"bottom-left" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorBottomLeft],
                                                            @"bottom-right" : [NSValue valueWithMGLTextAnchor:MGLTextAnchorBottomRight],
                                                            };
    return constantValues[textAnchor].MGLTextAnchorValue;
}

+ (MGLIconTranslationAnchor)iconTranslationAnchorFromNSString:(NSString *)iconTranslationAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLIconTranslationAnchor:MGLIconTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMGLIconTranslationAnchor:MGLIconTranslationAnchorViewport],
                                                            };
    return constantValues[iconTranslationAnchor].MGLIconTranslationAnchorValue;
}

+ (MGLTextTranslationAnchor)textTranslationAnchorFromNSString:(NSString *)textTranslationAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLTextTranslationAnchor:MGLTextTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMGLTextTranslationAnchor:MGLTextTranslationAnchorViewport],
                                                            };
    return constantValues[textTranslationAnchor].MGLTextTranslationAnchorValue;
}

+ (NSString *)stringFromMGLIconAnchor:(MGLIconAnchor)iconAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLIconAnchorTop] : @"top",
                                                             [NSNumber numberWithInteger:MGLIconAnchorLeft] : @"left",
                                                             [NSNumber numberWithInteger:MGLIconAnchorRight] : @"right",
                                                             [NSNumber numberWithInteger:MGLIconAnchorBottom] : @"bottom",
                                                             [NSNumber numberWithInteger:MGLIconAnchorCenter] : @"center",
                                                             [NSNumber numberWithInteger:MGLIconAnchorTopLeft] : @"top-left",
                                                             [NSNumber numberWithInteger:MGLIconAnchorTopRight] : @"top-right",
                                                             [NSNumber numberWithInteger:MGLIconAnchorBottomLeft] : @"bottom-left",
                                                             [NSNumber numberWithInteger:MGLIconAnchorBottomRight] : @"bottom-right",
                                                             };
    return constantValues[[NSNumber numberWithInteger:iconAnchor]];
}

+ (MGLIconAnchor)iconAnchorFromNSString:(NSString *)iconAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"top" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorTop],
                                                            @"left" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorLeft],
                                                            @"right" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorRight],
                                                            @"bottom" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorBottom],
                                                            @"center" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorCenter],
                                                            @"top-left" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorTopLeft],
                                                            @"top-right" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorTopRight],
                                                            @"bottom-left" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorBottomLeft],
                                                            @"bottom-right" : [NSValue valueWithMGLIconAnchor:MGLIconAnchorBottomRight],
                                                            };
    return constantValues[iconAnchor].MGLIconAnchorValue;
}

+ (NSString *)stringFromMGLTextJustification:(MGLTextJustification)textJustification {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLTextJustificationAuto] : @"auto",
                                                             [NSNumber numberWithInteger:MGLTextJustificationLeft] : @"left",
                                                             [NSNumber numberWithInteger:MGLTextJustificationRight] : @"right",
                                                             [NSNumber numberWithInteger:MGLTextJustificationCenter] : @"center",
                                                             };
    return constantValues[[NSNumber numberWithInteger:textJustification]];
}

+ (MGLTextJustification)textJustificationFromNSString:(NSString *)textJustification {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"center" : [NSValue valueWithMGLTextJustification:MGLTextJustificationCenter],
                                                            @"left" : [NSValue valueWithMGLTextJustification:MGLTextJustificationLeft],
                                                            @"right" : [NSValue valueWithMGLTextJustification:MGLTextJustificationRight],
                                                            @"auto" : [NSValue valueWithMGLTextJustification:MGLTextJustificationAuto],
                                                            };
    return constantValues[textJustification].MGLTextJustificationValue;
}

+ (NSString *)stringFromMGLTextTransform:(MGLTextTransform)textTransform {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLTextTransformNone] : @"none",
                                                             [NSNumber numberWithInteger:MGLTextTransformLowercase] : @"lowercase",
                                                             [NSNumber numberWithInteger:MGLTextTransformUppercase] : @"uppercase",
                                                             };
    return constantValues[[NSNumber numberWithInteger:textTransform]];
}

+ (MGLTextTransform)textTransformFromNSString:(NSString *)textTransform {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"none" : [NSValue valueWithMGLTextTransform:MGLTextTransformNone],
                                                            @"uppercase" : [NSValue valueWithMGLTextTransform:MGLTextTransformUppercase],
                                                            @"lowercase" : [NSValue valueWithMGLTextTransform:MGLTextTransformLowercase],
                                                            };
    return constantValues[textTransform].MGLTextTransformValue;
}

#pragma mark - Fill layer enum transformation

+ (NSString *)stringFromMGLFillTranslationAnchor:(MGLFillTranslationAnchor)translationAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MGLFillTranslationAnchorMap] : @"map",
                                                             [NSNumber numberWithInteger:MGLFillTranslationAnchorViewport] : @"viewport"
                                                             };
    return constantValues[[NSNumber numberWithInteger:translationAnchor]];
}

+ (MGLFillTranslationAnchor)fillTranslationAnchorFromNSString:(NSString *)translationAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMGLFillTranslationAnchor:MGLFillTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMGLFillTranslationAnchor:MGLFillTranslationAnchorViewport]
                                                            };
    return constantValues[translationAnchor].MGLFillTranslationAnchorValue;
}

@end
