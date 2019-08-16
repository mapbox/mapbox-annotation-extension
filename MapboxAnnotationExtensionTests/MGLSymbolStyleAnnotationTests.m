#import <XCTest/XCTest.h>
#import "MGLSymbolStyleAnnotation_Private.h"
#import <CoreGraphics/CoreGraphics.h>

@interface MGLSymbolStyleAnnotationTests : XCTestCase

@end

@implementation MGLSymbolStyleAnnotationTests

- (void)testProperties {
    MGLSymbolStyleAnnotation *annotation = [[MGLSymbolStyleAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(0, 0)];
    // icon-scale
    {
        XCTAssertEqual(1.0, annotation.iconScale);
        annotation.iconScale = 2.0;
        XCTAssertEqual(2.0, annotation.iconScale);
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconScale]);
    }
    // icon-image
    {
        XCTAssertNil(annotation.iconImageName);
        annotation.iconImageName = @"icon-image";
        XCTAssertEqualObjects(@"icon-image", annotation.iconImageName);
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconImageName]);
    }
    // icon-rotate
    {
        XCTAssertEqual(0.0, annotation.iconRotation);
        annotation.iconRotation = 2.0;
        XCTAssertEqual(2.0, annotation.iconRotation);
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconRotation]);
    }
    // icon-offset
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.iconOffset));
        origin = CGVectorMake(1, 1);
        annotation.iconOffset = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.iconOffset));
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconOffset]);
    }
    // icon-anchor
    {
        XCTAssertEqual(MGLIconAnchorCenter, annotation.iconAnchor);
        annotation.iconAnchor = MGLIconAnchorTop;
        XCTAssertEqual(MGLIconAnchorTop, annotation.iconAnchor);
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconAnchor]);
    }
    // icon-opacity
    {
        XCTAssertEqual(1.0, annotation.iconOpacity);
        annotation.iconOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.iconOpacity);
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconOpacity]);
    }
    // icon-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.iconColor.CGColor));
        annotation.iconColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.iconColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconColor]);
    }
    // icon-halo-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.clearColor.CGColor, annotation.iconHaloColor.CGColor));
        annotation.iconHaloColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.iconHaloColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconHaloColor]);
    }
    // icon-halo-width
    {
        XCTAssertEqual(0.0, annotation.iconHaloWidth);
        annotation.iconHaloWidth = 2.0;
        XCTAssertEqual(2.0, annotation.iconHaloWidth);
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconHaloWidth]);
    }
    // icon-halo-blur
    {
        XCTAssertEqual(0.0, annotation.iconHaloBlur);
        annotation.iconHaloBlur = 2.0;
        XCTAssertEqual(2.0, annotation.iconHaloBlur);
        XCTAssertNotNil(annotation.attributes[MGLPropertyIconHaloBlur]);
    }
    // text-field
    {
        XCTAssertNil(annotation.text);
        annotation.text = @"text";
        XCTAssertEqualObjects(@"text", annotation.text);
        XCTAssertNotNil(annotation.attributes[MGLPropertyText]);
    }
    // text-font
    {
        NSArray<NSString *> *fonts = @[@"Open Sans Regular", @"Arial Unicode MS Regular"];
        XCTAssertEqualObjects(fonts, annotation.fontNames);
        annotation.fontNames = @[@"text-font"];
        XCTAssertEqualObjects(@[@"text-font"], annotation.fontNames);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextFontNames]);
    }
    // text-size
    {
        XCTAssertEqual(16.0, annotation.textFontSize);
        annotation.textFontSize = 2.0;
        XCTAssertEqual(2.0, annotation.textFontSize);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextFontSize]);
    }
    // text-max-width
    {
        XCTAssertEqual(10.0, annotation.maximumTextWidth);
        annotation.maximumTextWidth = 2.0;
        XCTAssertEqual(2.0, annotation.maximumTextWidth);
        XCTAssertNotNil(annotation.attributes[MGLPropertyMaximumTextWidth]);
    }
    // text-letter-spacing
    {
        XCTAssertEqual(0.0, annotation.textLetterSpacing);
        annotation.textLetterSpacing = 2.0;
        XCTAssertEqual(2.0, annotation.textLetterSpacing);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextLetterSpacing]);
    }
    // text-justify
    {
        XCTAssertEqual(MGLTextJustificationCenter, annotation.textJustification);
        annotation.textJustification = MGLTextJustificationAuto;
        XCTAssertEqual(MGLTextJustificationAuto, annotation.textJustification);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextJustification]);
    }
    // text-radial-offset
    {
        XCTAssertEqual(0.0, annotation.textRadialOffset);
        annotation.textRadialOffset = 2.0;
        XCTAssertEqual(2.0, annotation.textRadialOffset);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextRadialOffset]);
    }
    // text-anchor
    {
        XCTAssertEqual(MGLTextAnchorCenter, annotation.textAnchor);
        annotation.textAnchor = MGLTextAnchorTop;
        XCTAssertEqual(MGLTextAnchorTop, annotation.textAnchor);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextAnchor]);
    }
    // text-rotate
    {
        XCTAssertEqual(0.0, annotation.textRotation);
        annotation.textRotation = 2.0;
        XCTAssertEqual(2.0, annotation.textRotation);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextRotation]);
    }
    // text-transform
    {
        XCTAssertEqual(MGLTextTransformNone, annotation.textTransform);
        annotation.textTransform = MGLTextTransformLowercase;
        XCTAssertEqual(MGLTextTransformLowercase, annotation.textTransform);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextTransform]);
    }
    // text-offset
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.textOffset));
        origin = CGVectorMake(1, 1);
        annotation.textOffset = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.textOffset));
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextOffset]);
    }
    // text-opacity
    {
        XCTAssertEqual(1.0, annotation.textOpacity);
        annotation.textOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.textOpacity);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextOpacity]);
    }
    // text-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.textColor.CGColor));
        annotation.textColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.textColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextColor]);
    }
    // text-halo-color
    {
        
        XCTAssertTrue(CGColorEqualToColor([UIColor clearColor].CGColor, annotation.textHaloColor.CGColor));
        annotation.textHaloColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.textHaloColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextHaloColor]);
    }
    // text-halo-width
    {
        XCTAssertEqual(0.0, annotation.textHaloWidth);
        annotation.textHaloWidth = 2.0;
        XCTAssertEqual(2.0, annotation.textHaloWidth);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextHaloWidth]);
    }
    // text-halo-blur
    {
        XCTAssertEqual(0.0, annotation.textHaloBlur);
        annotation.textHaloBlur = 2.0;
        XCTAssertEqual(2.0, annotation.textHaloBlur);
        XCTAssertNotNil(annotation.attributes[MGLPropertyTextHaloBlur]);
    }
    // symbol-sort-key
    {
        XCTAssertEqual(0, annotation.symbolSortKey);
        annotation.symbolSortKey = 2;
        XCTAssertEqual(2, annotation.symbolSortKey);
        XCTAssertNotNil(annotation.attributes[MGLPropertySymbolSortKey]);
    }
}

@end
