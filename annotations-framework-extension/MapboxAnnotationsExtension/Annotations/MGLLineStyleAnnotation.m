#import "MGLLineStyleAnnotation.h"
#import "UIColor+MGLAnnotationsExtension.h"
#import "MGLEnums+MGLAnnotationsExtension.h"

static NSString * const MGLPropertyLineJoin = @"line-join";
static NSString * const MGLPropertyLineBlur = @"line-blur";
static NSString * const MGLPropertyLineColor = @"line-color";
static NSString * const MGLPropertyLineGapWidth = @"line-gap-width";
static NSString * const MGLPropertyLineOffset = @"line-offset";
static NSString * const MGLPropertyLineOpacity = @"line-opacity";
static NSString * const MGLPropertyLinePattern = @"line-pattern";
static NSString * const MGLPropertyLineWidth = @"line-width";

@interface MGLLineStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MGLPolylineFeature *polylineFeature;

@end

@implementation MGLLineStyleAnnotation

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        self.polylineFeature = [[MGLPolylineFeature alloc] init];
        self.attributes = [NSMutableDictionary dictionary];
    }

    return self;
}

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count color:(UIColor *)color {
    if (self = [super init]) {
        self.polylineFeature = [MGLPolylineFeature polylineWithCoordinates:coordinates count:count];
        self.lineColor = color;
        self.attributes = [NSMutableDictionary dictionary];
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
        NSString *colorString = MGLPropertyLineColor;
        return [UIColor mgl_colorWithRgbaColorString:colorString];
    }

    return nil;
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

@end
