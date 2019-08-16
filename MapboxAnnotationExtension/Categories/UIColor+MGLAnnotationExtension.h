#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MGLAnnotationExtension)

- (NSString *)mgl_rgbaColorString;
+ (UIColor *)mgl_colorWithRgbaColorString:(NSString *)rgbaColorString;

@end

NS_ASSUME_NONNULL_END
