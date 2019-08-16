#import "MGLSymbolAnnotationController.h"
#import "MGLEnums+MGLAnnotationExtension.h"
#import "MGLSymbolStyleAnnotation_Private.h"

@interface MGLSymbolAnnotationController()

@property (nonatomic, strong) MGLShapeSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)initializeLayer;
- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MGLSymbolAnnotationController

- (void)initializeLayer {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *symbolLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MGLSymbolStyleLayer *symbolStyleLayer = [[MGLSymbolStyleLayer alloc] initWithIdentifier:symbolLayerIdentifier source:self.source];
    self.layer = symbolStyleLayer;
}

- (MGLSymbolStyleLayer *)symbolStyleLayer {
    return (MGLSymbolStyleLayer *)self.layer;
}


- (void)setIconAllowsOverlap:(BOOL)iconAllowsOverlap {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconAllowsOverlap)];
    self.symbolStyleLayer.iconAllowsOverlap = constantValue;
}

- (BOOL)iconAllowsOverlap {
    NSExpression *constantValue = self.symbolStyleLayer.iconAllowsOverlap;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setIconIgnoresPlacement:(BOOL)iconIgnoresPlacement {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconIgnoresPlacement)];
    self.symbolStyleLayer.iconIgnoresPlacement = constantValue;
}

- (BOOL)iconIgnoresPlacement {
    NSExpression *constantValue = self.symbolStyleLayer.iconIgnoresPlacement;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setIconOptional:(BOOL)iconOptional {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconOptional)];
    self.symbolStyleLayer.iconOptional = constantValue;
}

- (BOOL)iconOptional {
    NSExpression *constantValue = self.symbolStyleLayer.iconOptional;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setIconPadding:(CGFloat)iconPadding {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconPadding)];
    self.symbolStyleLayer.iconPadding = constantValue;
}

- (CGFloat)iconPadding {
    NSExpression *constantValue = self.symbolStyleLayer.iconPadding;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setIconPitchAlignment:(MGLIconPitchAlignment)iconPitchAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLIconPitchAlignment:iconPitchAlignment]];
    self.symbolStyleLayer.iconPitchAlignment = constantValue;
}

- (MGLIconPitchAlignment)iconPitchAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.iconPitchAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums iconPitchAlignmentFromNSString:value];
}

- (void)setIconRotationAlignment:(MGLIconRotationAlignment)iconRotationAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLIconRotationAlignment:iconRotationAlignment]];
    self.symbolStyleLayer.iconRotationAlignment = constantValue;
}

- (MGLIconRotationAlignment)iconRotationAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.iconRotationAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums iconRotationAlignmentFromNSString:value];
}

- (void)setIconTextFit:(MGLIconTextFit)iconTextFit {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLIconTextFit:iconTextFit]];
    self.symbolStyleLayer.iconTextFit = constantValue;
}

- (MGLIconTextFit)iconTextFit {
    NSExpression *constantValue = self.symbolStyleLayer.iconTextFit;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums iconTextFitFromNSString:value];
}

- (void)setIconTextFitPadding:(UIEdgeInsets)iconTextFitPadding {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithUIEdgeInsets:iconTextFitPadding]];
    self.symbolStyleLayer.iconTextFitPadding = constantValue;
}

- (UIEdgeInsets)iconTextFitPadding {
    NSExpression *constantValue = self.symbolStyleLayer.iconTextFitPadding;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.UIEdgeInsetsValue;
}

- (void)setKeepsIconUpright:(BOOL)keepsIconUpright {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(keepsIconUpright)];
    self.symbolStyleLayer.keepsIconUpright = constantValue;
}

- (BOOL)keepsIconUpright {
    NSExpression *constantValue = self.symbolStyleLayer.keepsIconUpright;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setKeepsTextUpright:(BOOL)keepsTextUpright {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(keepsTextUpright)];
    self.symbolStyleLayer.keepsTextUpright = constantValue;
}

- (BOOL)keepsTextUpright {
    NSExpression *constantValue = self.symbolStyleLayer.keepsTextUpright;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setMaximumTextAngle:(CGFloat)maximumTextAngle {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(maximumTextAngle)];
    self.symbolStyleLayer.maximumTextAngle = constantValue;
}

- (CGFloat)maximumTextAngle {
    NSExpression *constantValue = self.symbolStyleLayer.maximumTextAngle;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setSymbolAvoidsEdges:(BOOL)symbolAvoidsEdges {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(symbolAvoidsEdges)];
    self.symbolStyleLayer.symbolAvoidsEdges = constantValue;
}

- (BOOL)symbolAvoidsEdges {
    NSExpression *constantValue = self.symbolStyleLayer.symbolAvoidsEdges;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setSymbolPlacement:(MGLSymbolPlacement)symbolPlacement {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLSymbolPlacement:symbolPlacement]];
    self.symbolStyleLayer.symbolPlacement = constantValue;
}

- (MGLSymbolPlacement)symbolPlacement {
    NSExpression *constantValue = self.symbolStyleLayer.symbolPlacement;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums symbolPlacementFromNSString:value];
}

- (void)setSymbolSpacing:(CGFloat)symbolSpacing {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(symbolSpacing)];
    self.symbolStyleLayer.symbolSpacing = constantValue;
}

- (CGFloat)symbolSpacing {
    NSExpression *constantValue = self.symbolStyleLayer.symbolSpacing;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setSymbolZOrder:(MGLSymbolZOrder)symbolZOrder {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLSymbolZOrder:symbolZOrder]];
    self.symbolStyleLayer.symbolZOrder = constantValue;
}

- (MGLSymbolZOrder)symbolZOrder {
    NSExpression *constantValue = self.symbolStyleLayer.symbolZOrder;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums symbolZOrderFromNSString:value];
}

- (void)setTextAllowsOverlap:(BOOL)textAllowsOverlap {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textAllowsOverlap)];
    self.symbolStyleLayer.textAllowsOverlap = constantValue;
}

- (BOOL)textAllowsOverlap {
    NSExpression *constantValue = self.symbolStyleLayer.textAllowsOverlap;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setTextLineHeight:(CGFloat)textLineHeight {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textLineHeight)];
    self.symbolStyleLayer.textLineHeight = constantValue;
}

- (CGFloat)textLineHeight {
    NSExpression *constantValue = self.symbolStyleLayer.textLineHeight;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setTextOptional:(BOOL)textOptional {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textOptional)];
    self.symbolStyleLayer.textOptional = constantValue;
}

- (BOOL)textOptional {
    NSExpression *constantValue = self.symbolStyleLayer.textOptional;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setTextPadding:(CGFloat)textPadding {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textPadding)];
    self.symbolStyleLayer.textPadding = constantValue;
}

- (CGFloat)textPadding {
    NSExpression *constantValue = self.symbolStyleLayer.textPadding;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setTextPitchAlignment:(MGLTextPitchAlignment)textPitchAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLTextPitchAlignment:textPitchAlignment]];
    self.symbolStyleLayer.textPitchAlignment = constantValue;
}

- (MGLTextPitchAlignment)textPitchAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.textPitchAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums textPitchAlignmentFromNSString:value];
}

- (void)setTextRotationAlignment:(MGLTextRotationAlignment)textRotationAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLTextRotationAlignment:textRotationAlignment]];
    self.symbolStyleLayer.textRotationAlignment = constantValue;
}

- (MGLTextRotationAlignment)textRotationAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.textRotationAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums textRotationAlignmentFromNSString:value];
}

- (void)setTextVariableAnchor:(NSArray<NSString *>*)textVariableAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:textVariableAnchor];
    self.symbolStyleLayer.textVariableAnchor = constantValue;
}

- (NSArray<NSString *> *)textVariableAnchor {
    NSExpression *constantValue = self.symbolStyleLayer.textVariableAnchor;
    NSArray *value = [constantValue expressionValueWithObject:nil context:nil];
    return value;
}

- (void)setIconTranslation:(CGVector)iconTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithCGVector:iconTranslation]];
    self.symbolStyleLayer.iconTranslation = constantValue;
}

- (CGVector)iconTranslation {
    NSExpression *constantValue = self.symbolStyleLayer.iconTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setIconTranslationAnchor:(MGLIconTranslationAnchor)iconTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLIconTranslationAnchor:iconTranslationAnchor]];
    self.symbolStyleLayer.iconTranslationAnchor = constantValue;
}

- (MGLIconTranslationAnchor)iconTranslationAnchor {
    NSExpression *constantValue = self.symbolStyleLayer.iconTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums iconTranslationAnchorFromNSString:value];
}

- (void)setTextTranslation:(CGVector)textTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithCGVector:textTranslation]];
    self.symbolStyleLayer.textTranslation = constantValue;
}

- (CGVector)textTranslation {
    NSExpression *constantValue = self.symbolStyleLayer.textTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setTextTranslationAnchor:(MGLTextTranslationAnchor)textTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMGLTextTranslationAnchor:textTranslationAnchor]];
    self.symbolStyleLayer.textTranslationAnchor = constantValue;
}

- (MGLTextTranslationAnchor)textTranslationAnchor {
    NSExpression *constantValue = self.symbolStyleLayer.textTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums textTranslationAnchorFromNSString:value];
}


- (void)enablePaintProperties:(MGLSymbolStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MGLPropertyIconScale]) {
        self.enabledPaintProperties[MGLPropertyIconScale] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconImageName]) {
        self.enabledPaintProperties[MGLPropertyIconImageName] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconRotation]) {
        self.enabledPaintProperties[MGLPropertyIconRotation] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconOffset]) {
        self.enabledPaintProperties[MGLPropertyIconOffset] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconAnchor]) {
        self.enabledPaintProperties[MGLPropertyIconAnchor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconOpacity]) {
        self.enabledPaintProperties[MGLPropertyIconOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconColor]) {
        self.enabledPaintProperties[MGLPropertyIconColor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconHaloColor]) {
        self.enabledPaintProperties[MGLPropertyIconHaloColor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconHaloWidth]) {
        self.enabledPaintProperties[MGLPropertyIconHaloWidth] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyIconHaloBlur]) {
        self.enabledPaintProperties[MGLPropertyIconHaloBlur] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyText]) {
        self.enabledPaintProperties[MGLPropertyText] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextFontNames]) {
        self.enabledPaintProperties[MGLPropertyTextFontNames] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextFontSize]) {
        self.enabledPaintProperties[MGLPropertyTextFontSize] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyMaximumTextWidth]) {
        self.enabledPaintProperties[MGLPropertyMaximumTextWidth] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextLetterSpacing]) {
        self.enabledPaintProperties[MGLPropertyTextLetterSpacing] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextJustification]) {
        self.enabledPaintProperties[MGLPropertyTextJustification] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextRadialOffset]) {
        self.enabledPaintProperties[MGLPropertyTextRadialOffset] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextAnchor]) {
        self.enabledPaintProperties[MGLPropertyTextAnchor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextRotation]) {
        self.enabledPaintProperties[MGLPropertyTextRotation] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextTransform]) {
        self.enabledPaintProperties[MGLPropertyTextTransform] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextOffset]) {
        self.enabledPaintProperties[MGLPropertyTextOffset] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextOpacity]) {
        self.enabledPaintProperties[MGLPropertyTextOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextColor]) {
        self.enabledPaintProperties[MGLPropertyTextColor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextHaloColor]) {
        self.enabledPaintProperties[MGLPropertyTextHaloColor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextHaloWidth]) {
        self.enabledPaintProperties[MGLPropertyTextHaloWidth] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyTextHaloBlur]) {
        self.enabledPaintProperties[MGLPropertyTextHaloBlur] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertySymbolSortKey]) {
        self.enabledPaintProperties[MGLPropertySymbolSortKey] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyMaximumTextWidth]) {
        self.enabledPaintProperties[MGLPropertyMaximumTextWidth] = @YES;
    }
}


- (void)setPaintProperties {
    if (self.enabledPaintProperties[MGLPropertyIconScale]) {
        self.symbolStyleLayer.iconScale = [NSExpression expressionForKeyPath:MGLPropertyIconScale];
    }
    if (self.enabledPaintProperties[MGLPropertyIconImageName]) {
        self.symbolStyleLayer.iconImageName = [NSExpression expressionForKeyPath:MGLPropertyIconImageName];
    }
    if (self.enabledPaintProperties[MGLPropertyIconRotation]) {
        self.symbolStyleLayer.iconRotation = [NSExpression expressionForKeyPath:MGLPropertyIconRotation];
    }
    if (self.enabledPaintProperties[MGLPropertyIconOffset]) {
        self.symbolStyleLayer.iconOffset = [NSExpression expressionForKeyPath:MGLPropertyIconOffset];
    }
    if (self.enabledPaintProperties[MGLPropertyIconAnchor]) {
        self.symbolStyleLayer.iconAnchor = [NSExpression expressionForKeyPath:MGLPropertyIconAnchor];
    }
    if (self.enabledPaintProperties[MGLPropertyIconOpacity]) {
        self.symbolStyleLayer.iconOpacity = [NSExpression expressionForKeyPath:MGLPropertyIconOpacity];
    }
    if (self.enabledPaintProperties[MGLPropertyIconColor]) {
        self.symbolStyleLayer.iconColor = [NSExpression expressionForKeyPath:MGLPropertyIconColor];
    }
    if (self.enabledPaintProperties[MGLPropertyIconHaloColor]) {
        self.symbolStyleLayer.iconHaloColor = [NSExpression expressionForKeyPath:MGLPropertyIconHaloColor];
    }
    if (self.enabledPaintProperties[MGLPropertyIconHaloWidth]) {
        self.symbolStyleLayer.iconHaloWidth = [NSExpression expressionForKeyPath:MGLPropertyIconHaloWidth];
    }
    if (self.enabledPaintProperties[MGLPropertyIconHaloBlur]) {
        self.symbolStyleLayer.iconHaloBlur = [NSExpression expressionForKeyPath:MGLPropertyIconHaloBlur];
    }
    if (self.enabledPaintProperties[MGLPropertyText]) {
        self.symbolStyleLayer.text = [NSExpression expressionForKeyPath:MGLPropertyText];
    }
    if (self.enabledPaintProperties[MGLPropertyTextFontNames]) {
        self.symbolStyleLayer.textFontNames = [NSExpression expressionForKeyPath:MGLPropertyTextFontNames];
    }
    if (self.enabledPaintProperties[MGLPropertyTextFontSize]) {
        self.symbolStyleLayer.textFontSize = [NSExpression expressionForKeyPath:MGLPropertyTextFontSize];
    }
    if (self.enabledPaintProperties[MGLPropertyMaximumTextWidth]) {
        self.symbolStyleLayer.maximumTextWidth = [NSExpression expressionForKeyPath:MGLPropertyMaximumTextWidth];
    }
    if (self.enabledPaintProperties[MGLPropertyTextLetterSpacing]) {
        self.symbolStyleLayer.textLetterSpacing = [NSExpression expressionForKeyPath:MGLPropertyTextLetterSpacing];
    }
    if (self.enabledPaintProperties[MGLPropertyTextJustification]) {
        self.symbolStyleLayer.textJustification = [NSExpression expressionForKeyPath:MGLPropertyTextJustification];
    }
    if (self.enabledPaintProperties[MGLPropertyTextRadialOffset]) {
        self.symbolStyleLayer.textRadialOffset = [NSExpression expressionForKeyPath:MGLPropertyTextRadialOffset];
    }
    if (self.enabledPaintProperties[MGLPropertyTextAnchor]) {
        self.symbolStyleLayer.textAnchor = [NSExpression expressionForKeyPath:MGLPropertyTextAnchor];
    }
    if (self.enabledPaintProperties[MGLPropertyTextRotation]) {
        self.symbolStyleLayer.textRotation = [NSExpression expressionForKeyPath:MGLPropertyTextRotation];
    }
    if (self.enabledPaintProperties[MGLPropertyTextTransform]) {
        self.symbolStyleLayer.textTransform = [NSExpression expressionForKeyPath:MGLPropertyTextTransform];
    }
    if (self.enabledPaintProperties[MGLPropertyTextOffset]) {
        self.symbolStyleLayer.textOffset = [NSExpression expressionForKeyPath:MGLPropertyTextOffset];
    }
    if (self.enabledPaintProperties[MGLPropertyTextOpacity]) {
        self.symbolStyleLayer.textOpacity = [NSExpression expressionForKeyPath:MGLPropertyTextOpacity];
    }
    if (self.enabledPaintProperties[MGLPropertyTextColor]) {
        self.symbolStyleLayer.textColor = [NSExpression expressionForKeyPath:MGLPropertyTextColor];
    }
    if (self.enabledPaintProperties[MGLPropertyTextHaloColor]) {
        self.symbolStyleLayer.textHaloColor = [NSExpression expressionForKeyPath:MGLPropertyTextHaloColor];
    }
    if (self.enabledPaintProperties[MGLPropertyTextHaloWidth]) {
        self.symbolStyleLayer.textHaloWidth = [NSExpression expressionForKeyPath:MGLPropertyTextHaloWidth];
    }
    if (self.enabledPaintProperties[MGLPropertyTextHaloBlur]) {
        self.symbolStyleLayer.textHaloBlur = [NSExpression expressionForKeyPath:MGLPropertyTextHaloBlur];
    }
    if (self.enabledPaintProperties[MGLPropertySymbolSortKey]) {
        self.symbolStyleLayer.symbolSortKey = [NSExpression expressionForKeyPath:MGLPropertySymbolSortKey];
    }
}

@end
