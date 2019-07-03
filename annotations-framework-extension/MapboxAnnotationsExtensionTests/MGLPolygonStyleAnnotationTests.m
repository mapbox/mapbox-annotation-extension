#import <XCTest/XCTest.h>
#import "MGLPolygonStyleAnnotation_Private.h"
#import <CoreGraphics/CoreGraphics.h>

@interface MGLPolygonStyleAnnotationTests : XCTestCase

@end

@implementation MGLPolygonStyleAnnotationTests

- (void)testProperties {
    CLLocationCoordinate2D coordinates[3] = {
        CLLocationCoordinate2DMake(0, 0),
        CLLocationCoordinate2DMake(0, 1),
        CLLocationCoordinate2DMake(1, 1)
    };
    MGLPolygonStyleAnnotation *annotation = [[MGLPolygonStyleAnnotation alloc] initWithCoordinates:coordinates count:3];
    // fill-opacity
    {
        XCTAssertEqual(1.0, annotation.fillOpacity);
        annotation.fillOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.fillOpacity);
        XCTAssertNotNil(annotation.attributes[MGLPropertyPolygonOpacity]);
    }
    // fill-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.fillColor.CGColor));
        annotation.fillColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.fillColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MGLPropertyPolygonColor]);
    }
    // fill-outline-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.fillOutlineColor.CGColor));
        annotation.fillOutlineColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.fillOutlineColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MGLPropertyPolygonOutlineColor]);
    }
    // fill-pattern
    {
        XCTAssertNil(annotation.fillPattern);
        annotation.fillPattern = @"fill-pattern";
        XCTAssertEqualObjects(@"fill-pattern", annotation.fillPattern);
        XCTAssertNotNil(annotation.attributes[MGLPropertyPolygonPattern]);
    }
}

@end
