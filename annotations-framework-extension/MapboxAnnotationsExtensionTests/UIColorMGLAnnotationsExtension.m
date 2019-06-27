#import <XCTest/XCTest.h>
#import "../MapboxAnnotationsExtension/Categories/UIColor+MGLAnnotationsExtension.h"

@interface UIColorMGLAnnotationsExtension : XCTestCase

@end

@implementation UIColorMGLAnnotationsExtension

- (void)testColorToString {
    UIColor *whiteColor = [UIColor whiteColor];
    NSString *colorString = @"rgba(255, 255, 255, 1)";
    XCTAssertEqualObjects(colorString, whiteColor.mgl_rgbaColorString, @"The color conversion to string should match the format rbga(X, X, X, X)");
    
    UIColor *papayawhip = [UIColor colorWithRed:255.0/255 green:239.0/255 blue:213.0/255 alpha:1.0];
    colorString = @"rgba(255, 239, 213, 1)";
    XCTAssertEqualObjects(colorString, papayawhip.mgl_rgbaColorString, @"The color conversion to string should match the format rbga(X, X, X, X)");
}

- (void)testStringToColor {
    
    NSString *colorString = @"rgba(255, 255, 255, 1)";
    UIColor *whiteColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1]; // [UIColor whiteColor] uses an optimized color scale
    XCTAssertEqualObjects(whiteColor, [UIColor mgl_colorWithRgbaColorString:colorString]);
    
    colorString = @"rgba(255, 239, 213, 1)";
    UIColor *papayawhip = [UIColor colorWithRed:255.0/255 green:239.0/255 blue:213.0/255 alpha:1.0];
    XCTAssertEqualObjects(papayawhip, [UIColor mgl_colorWithRgbaColorString:colorString]);
    
}

@end
