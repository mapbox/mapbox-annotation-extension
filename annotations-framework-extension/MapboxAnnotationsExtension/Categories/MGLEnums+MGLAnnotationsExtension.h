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


@end

NS_ASSUME_NONNULL_END
