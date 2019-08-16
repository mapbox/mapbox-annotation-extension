#import <XCTest/XCTest.h>
#import "MGLLineStyleAnnotation_Private.h"
#import <CoreGraphics/CoreGraphics.h>

@interface MGLLineStyleAnnotationTests : XCTestCase

@end

@implementation MGLLineStyleAnnotationTests

- (void)testProperties {
    CLLocationCoordinate2D coordinates[2] = {
        CLLocationCoordinate2DMake(0, 0),
        CLLocationCoordinate2DMake(1, 1)
    };
    MGLLineStyleAnnotation *annotation = [[MGLLineStyleAnnotation alloc] initWithCoordinates:coordinates count:2];
    // line-join
    {
        XCTAssertEqual(MGLLineJoinMiter, annotation.lineJoin);
        annotation.lineJoin = MGLLineJoinBevel;
        XCTAssertEqual(MGLLineJoinBevel, annotation.lineJoin);
        XCTAssertNotNil(annotation.attributes[MGLPropertyLineJoin]);
    }
    // line-blur
    {
        XCTAssertEqual(0.0, annotation.lineBlur);
        annotation.lineBlur = 2.0;
        XCTAssertEqual(2.0, annotation.lineBlur);
        XCTAssertNotNil(annotation.attributes[MGLPropertyLineBlur]);
    }
    // line-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.lineColor.CGColor));
        annotation.lineColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.lineColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MGLPropertyLineColor]);
    }
    // line-gap-width
    {
        XCTAssertEqual(0.0, annotation.lineGapWidth);
        annotation.lineGapWidth = 2.0;
        XCTAssertEqual(2.0, annotation.lineGapWidth);
        XCTAssertNotNil(annotation.attributes[MGLPropertyLineGapWidth]);
    }
    // line-offset
    {
        XCTAssertEqual(0.0, annotation.lineOffset);
        annotation.lineOffset = 2.0;
        XCTAssertEqual(2.0, annotation.lineOffset);
        XCTAssertNotNil(annotation.attributes[MGLPropertyLineOffset]);
    }
    // line-opacity
    {
        XCTAssertEqual(1.0, annotation.lineOpacity);
        annotation.lineOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.lineOpacity);
        XCTAssertNotNil(annotation.attributes[MGLPropertyLineOpacity]);
    }
    // line-pattern
    {
        XCTAssertNil(annotation.linePattern);
        annotation.linePattern = @"line-pattern";
        XCTAssertEqualObjects(@"line-pattern", annotation.linePattern);
        XCTAssertNotNil(annotation.attributes[MGLPropertyLinePattern]);
    }
    // line-width
    {
        XCTAssertEqual(1.0, annotation.lineWidth);
        annotation.lineWidth = 2.0;
        XCTAssertEqual(2.0, annotation.lineWidth);
        XCTAssertNotNil(annotation.attributes[MGLPropertyLineWidth]);
    }
}

@end
