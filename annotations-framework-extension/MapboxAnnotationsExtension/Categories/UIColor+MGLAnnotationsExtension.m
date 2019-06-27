#import "UIColor+MGLAnnotationsExtension.h"

@implementation UIColor (MGLAnnotationsExtension)

- (NSString *)mgl_rgbaColorString {
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    CGFloat multiplier = 255.0;
    // UIColor provides non-premultiplied color components, so we have to premultiply each
    // color component with the alpha value to transform it into a valid
    // mbgl::Color which expects premultiplied color components.
    return [NSString stringWithFormat:@"rgba(%.0f, %.0f, %.0f, %.0f)", r*a*multiplier, g*a*multiplier, b*a*multiplier, a];
}

+ (UIColor *)mgl_colorWithRgbaColorString:(NSString *)rgbaColorString {
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"([0-9]{1,3})"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSArray *matches = [regex matchesInString:rgbaColorString
                                      options:0
                                        range:NSMakeRange(0, [rgbaColorString length])];
    
    if (matches.count == 4) {
        NSString *red = [rgbaColorString substringWithRange:[matches[0] range]];
        NSString *green = [rgbaColorString substringWithRange:[matches[1] range]];
        NSString *blue = [rgbaColorString substringWithRange:[matches[2] range]];
        NSString *alpha = [rgbaColorString substringWithRange:[matches[3] range]];
        
        CGFloat r = red.doubleValue;
        CGFloat g = green.doubleValue;
        CGFloat b = blue.doubleValue;
        CGFloat a = alpha.doubleValue;
        CGFloat multiplier = 255;
        
        if (a == 0.0f) {
            r = red.doubleValue/multiplier;
            g = green.doubleValue/multiplier;
            b = blue.doubleValue/multiplier;
        } else {
            r = (red.doubleValue/a)/multiplier;
            g = (green.doubleValue/a)/multiplier;
            b = (blue.doubleValue/a)/multiplier;
        }
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    
    return nil;
}

@end
