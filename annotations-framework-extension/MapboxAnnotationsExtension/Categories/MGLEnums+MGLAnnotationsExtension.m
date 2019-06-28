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

@end
