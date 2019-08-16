#import "UIColor+MGLAnnotationExtension.h"

@implementation UIColor (MGLAnnotationExtension)

- (NSString *)mgl_rgbaColorString {
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    CGFloat multiplier = 255;

    return [NSString stringWithFormat:@"rgba(%ld, %ld, %ld, %.1f)",
            (long)(r*multiplier),
            (long)(g*multiplier),
            (long)(b*multiplier), a];
}

+ (UIColor *)mgl_colorWithRgbaColorString:(NSString *)rgbaColorString {
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9]{0,2}\\.?[0-9]+"
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
        
        r = red.doubleValue/multiplier;
        g = green.doubleValue/multiplier;
        b = blue.doubleValue/multiplier;
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    
    return nil;
}

@end
