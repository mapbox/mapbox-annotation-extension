#import <Foundation/Foundation.h>
@import Mapbox;

NS_ASSUME_NONNULL_BEGIN

@interface MGLEnums : NSObject

+ (NSString *)stringFromMGLLineJoin:(MGLLineJoin)lineJoin;
+ (MGLLineJoin)lineJoinFromNSString:(NSString *)lineJoinString;

@end

NS_ASSUME_NONNULL_END
