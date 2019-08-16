#import "MGLLineStyleAnnotation.h"
#import "UIColor+MGLAnnotationExtension.h"
#import "MGLEnums+MGLAnnotationExtension.h"

NSString *const MGLPropertyLineJoin = @"line-join";
NSString *const MGLPropertyLineBlur = @"line-blur";
NSString *const MGLPropertyLineColor = @"line-color";
NSString *const MGLPropertyLineGapWidth = @"line-gap-width";
NSString *const MGLPropertyLineOffset = @"line-offset";
NSString *const MGLPropertyLineOpacity = @"line-opacity";
NSString *const MGLPropertyLinePattern = @"line-pattern";
NSString *const MGLPropertyLineWidth = @"line-width";

@interface MGLLineStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MGLPolylineFeature *polylineFeature;

@end

@implementation MGLLineStyleAnnotation

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        self.polylineFeature = [MGLPolylineFeature polylineWithCoordinates:coordinates count:count];
    }

    return self;
}

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count color:(UIColor *)color {
    if (self = [self initWithCoordinates:coordinates count:count]){
        self.lineColor = color;
    }

    return self;
}

- (MGLLineJoin)lineJoin {
    if (self.attributes[MGLPropertyLineJoin]) {
        return [MGLEnums lineJoinFromNSString:self.attributes[MGLPropertyLineJoin]];
    }

    return MGLLineJoinMiter;
}

- (void)setLineJoin:(MGLLineJoin)lineJoin {
    self.attributes[MGLPropertyLineJoin] = [MGLEnums stringFromMGLLineJoin:lineJoin];
}

- (CGFloat)lineBlur {
    if (self.attributes[MGLPropertyLineBlur]) {
        NSNumber *constantValue = self.attributes[MGLPropertyLineBlur];
        return constantValue.doubleValue;
    }

    return 0.0;
}

- (void)setLineBlur:(CGFloat)lineBlur {
    self.attributes[MGLPropertyLineBlur] = @(lineBlur);
}

- (UIColor *)lineColor {
    if (self.attributes[MGLPropertyLineColor]) {
        NSString *colorString = self.attributes[MGLPropertyLineColor];
        return [UIColor mgl_colorWithRgbaColorString:colorString];
    }

    return UIColor.blackColor;
}

- (void)setLineColor:(UIColor *)lineColor {
    NSString *colorString = lineColor.mgl_rgbaColorString;
    self.attributes[MGLPropertyLineColor] = colorString;
}

- (CGFloat)lineGapWidth {
    if (self.attributes[MGLPropertyLineGapWidth]) {
        NSNumber *constantValue = self.attributes[MGLPropertyLineGapWidth];
        return constantValue.doubleValue;
    }

    return 0.0;
}

- (void)setLineGapWidth:(CGFloat)lineGapWidth {
    self.attributes[MGLPropertyLineGapWidth] = @(lineGapWidth);
}

- (CGFloat)lineOffset {
    if (self.attributes[MGLPropertyLineOffset]) {
        NSNumber *constantValue = self.attributes[MGLPropertyLineOffset];
        return constantValue.doubleValue;
    }

    return 0.0;
}

- (void)setLineOffset:(CGFloat)lineOffset {;
    self.attributes[MGLPropertyLineOffset] = @(lineOffset);
}

- (CGFloat)lineOpacity {
    if (self.attributes[MGLPropertyLineOpacity]) {
        NSNumber *constantValue = self.attributes[MGLPropertyLineOpacity];
        return constantValue.doubleValue;
    }

    return 1.0;
}

- (void) setLineOpacity:(CGFloat)lineOpacity {
    self.attributes[MGLPropertyLineOpacity] = @(lineOpacity);
}

- (NSString *)linePattern {
    if (self.attributes[MGLPropertyLinePattern]) {
        return self.attributes[MGLPropertyLinePattern];
    }

    return nil;
}

- (void)setLinePattern:(NSString *)linePattern {
    self.attributes[MGLPropertyLinePattern] = linePattern;
}

- (CGFloat)lineWidth {
    if (self.attributes[MGLPropertyLineWidth]) {
        NSNumber *constantValue = self.attributes[MGLPropertyLineWidth];
        return constantValue.doubleValue;
    }

    return 1.0;
}

- (void) setLineWidth:(CGFloat)lineWidth {
    self.attributes[MGLPropertyLineWidth] = @(lineWidth);
}

- (id<MGLFeature>)feature {
    self.polylineFeature.attributes = self.attributes;
    return self.polylineFeature;
}

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta {
    CLLocationCoordinate2D *coordinates = self.polylineFeature.coordinates;
    NSUInteger count = self.polylineFeature.pointCount;
    CLLocationCoordinate2D *shiftedCoordinates = calloc(sizeof(CLLocationCoordinate2D), count);
    
    for (NSUInteger index = 0; index < count; index++) {
        CLLocationCoordinate2D currentCoordinate = coordinates[index];
        shiftedCoordinates[index] = CLLocationCoordinate2DMake(currentCoordinate.latitude + delta.dy, currentCoordinate.longitude + delta.dx);
    }
    
    [self.polylineFeature setCoordinates:shiftedCoordinates count:count];
    free(shiftedCoordinates);
    return self;
}

@end
