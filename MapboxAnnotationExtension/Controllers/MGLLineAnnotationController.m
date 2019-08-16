#import "MGLLineAnnotationController.h"
#import "MGLLineStyleAnnotation_Private.h"
#import "MGLEnums+MGLAnnotationExtension.h"
#import "UIColor+MGLAnnotationExtension.h"

@interface MGLLineAnnotationController()

@property (nonatomic, strong) MGLShapeSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)initializeLayer;
- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MGLLineAnnotationController

- (void)initializeLayer {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *lineStyleLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MGLLineStyleLayer *lineStyleLayer = [[MGLLineStyleLayer alloc] initWithIdentifier:lineStyleLayerIdentifier source:self.source];
    self.layer = lineStyleLayer;
}

- (MGLLineStyleLayer *)lineStyleLayer {
    return (MGLLineStyleLayer *)self.layer;
}

- (void)setLineCap:(MGLLineCap)lineCap {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLLineCap:lineCap]];
    self.lineStyleLayer.lineCap = constantValue;
}

- (MGLLineCap)lineCap {
    NSExpression *constantValue = self.lineStyleLayer.lineCap;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums lineCapFromNSString:value];
}

- (void)setLineMiterLimit:(CGFloat)lineMiterLimit {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(lineMiterLimit)];
    self.lineStyleLayer.lineMiterLimit = constantValue;
}

- (CGFloat)lineMiterLimit {
    NSExpression *constantValue = self.lineStyleLayer.lineMiterLimit;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setLineRoundLimit:(CGFloat)lineRoundLimit {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(lineRoundLimit)];
    self.lineStyleLayer.lineRoundLimit = constantValue;
}

- (CGFloat)lineRoundLimit {
    NSExpression *constantValue = self.lineStyleLayer.lineRoundLimit;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:lineDashPattern];
    self.lineStyleLayer.lineDashPattern = constantValue;
}

- (NSArray *)lineDashPattern {
    NSExpression *constantValue = self.lineStyleLayer.lineDashPattern;
    NSArray *value = [constantValue expressionValueWithObject:nil context:nil];
    return value;
}

- (void)setLineGradient:(UIColor *)lineGradient {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:lineGradient];
    self.lineStyleLayer.lineGradient = constantValue;
}

- (UIColor *)lineGradient {
    NSExpression *constantValue = self.lineStyleLayer.lineGradient;
    UIColor *value = [constantValue expressionValueWithObject:nil context:nil];
    return value;
}

- (void)setLineTranslation:(CGVector)lineTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(lineTranslation)];
    self.lineStyleLayer.lineTranslation = constantValue;
}

- (CGVector)lineTranslation {
    NSExpression *constantValue = self.lineStyleLayer.lineTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setLineTranslationAnchor:(MGLLineTranslationAnchor)lineTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLLineTranslationAnchor:lineTranslationAnchor]];
    self.lineStyleLayer.lineTranslationAnchor = constantValue;
}

- (MGLLineTranslationAnchor)lineTranslationAnchor {
    NSExpression *constantValue = self.lineStyleLayer.lineTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums lineTranslationAnchorFromNSString:value];
}

- (void)enablePaintProperties:(MGLLineStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MGLPropertyLineJoin]) {
        self.enabledPaintProperties[MGLPropertyLineJoin] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyLineBlur]) {
        self.enabledPaintProperties[MGLPropertyLineBlur] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyLineColor]) {
        self.enabledPaintProperties[MGLPropertyLineColor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyLineGapWidth]) {
        self.enabledPaintProperties[MGLPropertyLineGapWidth] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyLineOffset]) {
        self.enabledPaintProperties[MGLPropertyLineOffset] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyLineOpacity]) {
        self.enabledPaintProperties[MGLPropertyLineOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyLinePattern]) {
        self.enabledPaintProperties[MGLPropertyLinePattern] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyLineWidth]) {
        self.enabledPaintProperties[MGLPropertyLineWidth] = @YES;
    }
}

- (void)setPaintProperties {
    if (self.enabledPaintProperties[MGLPropertyLineJoin]) {
        self.lineStyleLayer.lineJoin = [NSExpression expressionForKeyPath:MGLPropertyLineJoin];
    }
    if (self.enabledPaintProperties[MGLPropertyLineBlur]) {
        self.lineStyleLayer.lineBlur = [NSExpression expressionForKeyPath:MGLPropertyLineBlur];
    }
    if (self.enabledPaintProperties[MGLPropertyLineColor]) {
        self.lineStyleLayer.lineColor = [NSExpression expressionForKeyPath:MGLPropertyLineColor];
    }
    if (self.enabledPaintProperties[MGLPropertyLineGapWidth]) {
        self.lineStyleLayer.lineGapWidth = [NSExpression expressionForKeyPath:MGLPropertyLineGapWidth];
    }
    if (self.enabledPaintProperties[MGLPropertyLineOffset]) {
        self.lineStyleLayer.lineOffset = [NSExpression expressionForKeyPath:MGLPropertyLineOffset];
    }
    if (self.enabledPaintProperties[MGLPropertyLineOpacity]) {
        self.lineStyleLayer.lineOpacity = [NSExpression expressionForKeyPath:MGLPropertyLineOpacity];
    }
    if (self.enabledPaintProperties[MGLPropertyLinePattern]) {
        self.lineStyleLayer.linePattern = [NSExpression expressionForKeyPath:MGLPropertyLinePattern];
    }
    if (self.enabledPaintProperties[MGLPropertyLineWidth]) {
        self.lineStyleLayer.lineWidth = [NSExpression expressionForKeyPath:MGLPropertyLineWidth];
    }
    
}

@end
