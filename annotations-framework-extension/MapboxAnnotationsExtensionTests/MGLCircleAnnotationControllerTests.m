#import <XCTest/XCTest.h>
#import "MGLCircleAnnotationController.h"

@interface MGLCircleAnnotationControllerTests : XCTestCase <MGLMapViewDelegate>

@property (nonatomic) MGLMapView *mapView;
@property (nonatomic) MGLCircleAnnotationController *annotationController;

@end

@implementation MGLCircleAnnotationControllerTests {
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
    self.annotationController = [[MGLCircleAnnotationController alloc] initWithMapView:mapView];
    [_styleLoadingExpectation fulfill];
}

- (void)testProperties {
    // circle-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.circleTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.circleTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.circleTranslation));
    }
    // circle-translation-anchor
    {
        XCTAssertEqual(MGLCircleTranslationAnchorMap, self.annotationController.circleTranslationAnchor);
        self.annotationController.circleTranslationAnchor = MGLCircleTranslationAnchorViewport;
        XCTAssertEqual(MGLCircleTranslationAnchorViewport, self.annotationController.circleTranslationAnchor);
    }
    // circle-pitch-alignment
    {
        XCTAssertEqual(MGLCirclePitchAlignmentViewport, self.annotationController.circlePitchAlignment);
        self.annotationController.circlePitchAlignment = MGLCirclePitchAlignmentMap;
        XCTAssertEqual(MGLCirclePitchAlignmentMap, self.annotationController.circlePitchAlignment);
    }
    // circle-scale-alignment
    {
        XCTAssertEqual(MGLCircleScaleAlignmentMap, self.annotationController.circleScaleAlignment);
        self.annotationController.circleScaleAlignment = MGLCircleScaleAlignmentViewport;
        XCTAssertEqual(MGLCircleScaleAlignmentViewport, self.annotationController.circleScaleAlignment);
    }
}

@end
