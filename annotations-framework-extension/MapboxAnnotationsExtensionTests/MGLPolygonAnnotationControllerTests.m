#import <XCTest/XCTest.h>
#import "MGLPolygonAnnotationController.h"

@interface MGLPolygonAnnotationControllerTests : XCTestCase <MGLMapViewDelegate>

@property (nonatomic) MGLMapView *mapView;
@property (nonatomic) MGLPolygonAnnotationController *annotationController;

@end

@implementation MGLPolygonAnnotationControllerTests {
    XCTestExpectation *_styleLoadingExpectation;
}

- (void)setUp {
    [super setUp];
    
    [MGLAccountManager setAccessToken:@"pk.feedcafedeadbeefbadebede"];
    NSURL *styleURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"one-liner" withExtension:@"json"];
    self.mapView = [[MGLMapView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) styleURL:styleURL];
    self.mapView.delegate = self;
    if (!self.mapView.style) {
        _styleLoadingExpectation = [self expectationWithDescription:@"Map view should finish loading style."];
        [self waitForExpectationsWithTimeout:10 handler:nil];
    }
}

- (void)mapView:(MGLMapView *)mapView didFinishLoadingStyle:(MGLStyle *)style {
    XCTAssertNotNil(mapView.style);
    XCTAssertEqual(mapView.style, style);
    self.mapView = mapView;
    self.annotationController = [[MGLPolygonAnnotationController alloc] initWithMapView:mapView];
    [_styleLoadingExpectation fulfill];
}

- (void)testProperties {
    // fill-antialias
    {
        XCTAssertTrue(self.annotationController.fillAntialiased);
        self.annotationController.fillAntialiased = NO;
        XCTAssertFalse(self.annotationController.fillAntialiased);
    }
    // fill-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.fillTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.fillTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.fillTranslation));
    }
    // line-translation-anchor
    {
        XCTAssertEqual(MGLFillTranslationAnchorMap, self.annotationController.fillTranslationAnchor);
        self.annotationController.fillTranslationAnchor = MGLFillTranslationAnchorViewport;
        XCTAssertEqual(MGLFillTranslationAnchorViewport, self.annotationController.fillTranslationAnchor);
    }
    
}

@end
