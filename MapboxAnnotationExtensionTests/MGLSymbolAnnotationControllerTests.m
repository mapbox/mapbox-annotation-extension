#import <XCTest/XCTest.h>
#import "MGLSymbolAnnotationController.h"
#import "MGLSymbolStyleAnnotation.h"

@interface MGLSymbolAnnotationControllerTests : XCTestCase <MGLMapViewDelegate>

@property (nonatomic) MGLMapView *mapView;
@property (nonatomic) MGLSymbolAnnotationController *annotationController;
@property (nonatomic) MGLSymbolStyleAnnotation *symbolAnnotation;

@end

@implementation MGLSymbolAnnotationControllerTests {
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
    self.annotationController = [[MGLSymbolAnnotationController alloc] initWithMapView:mapView];
    self.symbolAnnotation = [[MGLSymbolStyleAnnotation alloc]initWithCoordinate:mapView.centerCoordinate];
    [_styleLoadingExpectation fulfill];
}

- (void)testProperties {
    // icon-allows-overlap
    {
        XCTAssertFalse(self.annotationController.iconAllowsOverlap);
        self.annotationController.iconAllowsOverlap = YES;
        XCTAssertTrue(self.annotationController.iconAllowsOverlap);
    }
    // icon-ignores-placement
    {
        XCTAssertFalse(self.annotationController.iconIgnoresPlacement);
        self.annotationController.iconIgnoresPlacement = YES;
        XCTAssertTrue(self.annotationController.iconIgnoresPlacement);
    }
    // icon-optional
    {
        XCTAssertFalse(self.annotationController.iconOptional);
        self.annotationController.iconOptional = YES;
        XCTAssertTrue(self.annotationController.iconOptional);
    }
    // icon-padding
    {
        XCTAssertEqual(2.0, self.annotationController.iconPadding);
        self.annotationController.iconPadding = 1.0;
        XCTAssertEqual(1.0, self.annotationController.iconPadding);
    }
    // icon-pitch-alignment
    {
        XCTAssertEqual(MGLIconPitchAlignmentAuto, self.annotationController.iconPitchAlignment);
        self.annotationController.iconPitchAlignment = MGLIconPitchAlignmentMap;
        XCTAssertEqual(MGLIconPitchAlignmentMap, self.annotationController.iconPitchAlignment);
    }
    // icon-rotation-alignment
    {
        XCTAssertEqual(MGLIconRotationAlignmentAuto, self.annotationController.iconRotationAlignment);
        self.annotationController.iconRotationAlignment = MGLIconRotationAlignmentMap;
        XCTAssertEqual(MGLIconRotationAlignmentMap, self.annotationController.iconRotationAlignment);
    }
    // icon-text-fit
    {
        XCTAssertEqual(MGLIconTextFitNone, self.annotationController.iconTextFit);
        self.annotationController.iconTextFit = MGLIconTextFitBoth;
        XCTAssertEqual(MGLIconTextFitBoth, self.annotationController.iconTextFit);
    }
    // icon-text-fit-padding
    {
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
        XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(insets, self.annotationController.iconTextFitPadding));
        insets = UIEdgeInsetsMake(1, 1, 1, 1);
        self.annotationController.iconTextFitPadding = insets;
        XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(insets, self.annotationController.iconTextFitPadding));
    }
    // keeps-icon-upright
    {
        XCTAssertFalse(self.annotationController.keepsIconUpright);
        self.annotationController.keepsIconUpright = YES;
        XCTAssertTrue(self.annotationController.keepsIconUpright);
    }
    // keeps-text-upright
    {
        XCTAssertTrue(self.annotationController.keepsTextUpright);
        self.annotationController.keepsTextUpright = NO;
        XCTAssertFalse(self.annotationController.keepsTextUpright);
    }
    // maximum-text-angle
    {
        XCTAssertEqual(45.0, self.annotationController.maximumTextAngle);
        self.annotationController.maximumTextAngle = 1.0;
        XCTAssertEqual(1.0, self.annotationController.maximumTextAngle);
    }
    // symbol-avoids-edges
    {
        XCTAssertFalse(self.annotationController.symbolAvoidsEdges);
        self.annotationController.symbolAvoidsEdges = YES;
        XCTAssertTrue(self.annotationController.symbolAvoidsEdges);
    }
    // symbol-placement
    {
        XCTAssertEqual(MGLSymbolPlacementPoint, self.annotationController.symbolPlacement);
        self.annotationController.symbolPlacement = MGLSymbolPlacementLine;
        XCTAssertEqual(MGLSymbolPlacementLine, self.annotationController.symbolPlacement);
    }
    // symbol-spacing
    {
        XCTAssertEqual(250.0, self.annotationController.symbolSpacing);
        self.annotationController.symbolSpacing = 1.0;
        XCTAssertEqual(1.0, self.annotationController.symbolSpacing);
    }
    // symbol-z-order
    {
        XCTAssertEqual(MGLSymbolZOrderAuto, self.annotationController.symbolZOrder);
        self.annotationController.symbolZOrder = MGLSymbolZOrderSource;
        XCTAssertEqual(MGLSymbolZOrderSource, self.annotationController.symbolZOrder);
    }
    // text-allows-overlap
    {
        XCTAssertFalse(self.annotationController.textAllowsOverlap);
        self.annotationController.textAllowsOverlap = YES;
        XCTAssertTrue(self.annotationController.textAllowsOverlap);
    }
    // text-line-height
    {
        XCTAssertEqualWithAccuracy(1.2, self.annotationController.textLineHeight, 0.01);
        self.annotationController.textLineHeight = 2.0;
        XCTAssertEqual(2.0, self.annotationController.textLineHeight);
    }
    // text-optional
    {
        XCTAssertFalse(self.annotationController.textOptional);
        self.annotationController.textOptional = YES;
        XCTAssertTrue(self.annotationController.textOptional);
    }
    // text-padding
    {
        XCTAssertEqual(2.0, self.annotationController.textPadding);
        self.annotationController.textPadding = 1.0;
        XCTAssertEqual(1.0, self.annotationController.textPadding);
    }
    // text-pitch-alignment
    {
        XCTAssertEqual(MGLTextPitchAlignmentAuto, self.annotationController.textPitchAlignment);
        self.annotationController.textPitchAlignment = MGLTextPitchAlignmentMap;
        XCTAssertEqual(MGLTextPitchAlignmentMap, self.annotationController.textPitchAlignment);
    }
    // text-rotation-alignment
    {
        XCTAssertEqual(MGLTextRotationAlignmentAuto, self.annotationController.textRotationAlignment);
        self.annotationController.textRotationAlignment = MGLTextRotationAlignmentMap;
        XCTAssertEqual(MGLTextRotationAlignmentMap, self.annotationController.textRotationAlignment);
    }
    // text-variable-anchor
    {
        XCTAssertEqual(0, self.annotationController.textVariableAnchor.count);
        NSArray<NSString *> *anchors = @[@"center", @"left"];
        self.annotationController.textVariableAnchor = anchors;
        XCTAssertEqualObjects(anchors, self.annotationController.textVariableAnchor);
    }
    // icon-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.iconTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.iconTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.iconTranslation));
    }
    // icon-translation-anchor
    {
        XCTAssertEqual(MGLIconTranslationAnchorMap, self.annotationController.iconTranslationAnchor);
        self.annotationController.iconTranslationAnchor = MGLIconTranslationAnchorViewport;
        XCTAssertEqual(MGLIconTranslationAnchorViewport, self.annotationController.iconTranslationAnchor);
    }
    // text-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.textTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.textTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.textTranslation));
    }
    // text-translation-anchor
    {
        XCTAssertEqual(MGLTextTranslationAnchorMap, self.annotationController.textTranslationAnchor);
        self.annotationController.textTranslationAnchor = MGLTextTranslationAnchorViewport;
        XCTAssertEqual(MGLTextTranslationAnchorViewport, self.annotationController.textTranslationAnchor);
    }
}

- (void)testAddingLineStyleAnnotation {
    [self.annotationController addStyleAnnotation:self.symbolAnnotation];
    XCTAssertEqual(1, self.annotationController.styleAnnotations.count);
}

- (void)testProgrammaticSelection {
    [self.annotationController selectStyleAnnotation:self.symbolAnnotation];
    XCTAssertEqual(1, self.mapView.selectedAnnotations.count);
    
    XCTAssertTrue([self.mapView.selectedAnnotations containsObject:self.symbolAnnotation.feature]);
    
    [self.annotationController deselectStyleAnnotation:self.symbolAnnotation];
    XCTAssertEqual(0, self.mapView.selectedAnnotations.count);
}

@end
