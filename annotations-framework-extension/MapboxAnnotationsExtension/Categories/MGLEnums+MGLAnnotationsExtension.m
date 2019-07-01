#import "MGLEnums+MGLAnnotationsExtension.h"

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

@end
