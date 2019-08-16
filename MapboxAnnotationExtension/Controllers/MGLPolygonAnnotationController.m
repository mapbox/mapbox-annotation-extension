#import "MGLPolygonAnnotationController.h"
#import "MGLEnums+MGLAnnotationExtension.h"
#import "MGLPolygonStyleAnnotation_Private.h"

@interface MGLPolygonAnnotationController()

@property (nonatomic, strong) MGLShapeSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)initializeLayer;
- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MGLPolygonAnnotationController

- (void)initializeLayer {
    NSString *uuid = [[NSUUID UUID] UUIDString];

    NSString *polygonLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MGLFillStyleLayer *polygonStyleLayer = [[MGLFillStyleLayer alloc] initWithIdentifier:polygonLayerIdentifier source:self.source];
    self.layer = polygonStyleLayer;
}

- (MGLFillStyleLayer *)fillStyleLayer {
    return (MGLFillStyleLayer *)self.layer;
}

# pragma mark Layout properties

- (void)setFillAntialiased:(BOOL)fillAntialias {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(fillAntialias)];
    self.fillStyleLayer.fillAntialiased = constantValue;
}

- (BOOL)fillAntialiased {
    NSExpression *constantValue = self.fillStyleLayer.fillAntialiased;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setFillTranslation:(CGVector)fillTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(fillTranslation)];
    self.fillStyleLayer.fillTranslation = constantValue;
}

- (CGVector)fillTranslation {
    NSExpression *constantValue = self.fillStyleLayer.fillTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setFillTranslationAnchor:(MGLFillTranslationAnchor)fillTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(fillTranslationAnchor)];
    self.fillStyleLayer.fillTranslationAnchor = constantValue;
}

- (MGLFillTranslationAnchor)fillTranslationAnchor {
    NSExpression *constantValue = self.fillStyleLayer.fillTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MGLEnums fillTranslationAnchorFromNSString:value];
}


# pragma mark Paint properties

- (void)enablePaintProperties:(MGLPolygonStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MGLPropertyPolygonOpacity]) {
        self.enabledPaintProperties[MGLPropertyPolygonOpacity] = @YES;
    }

    if (styleAnnotation.attributes[MGLPropertyPolygonColor]) {
        self.enabledPaintProperties[MGLPropertyPolygonColor] = @YES;
    }

    if (styleAnnotation.attributes[MGLPropertyPolygonOutlineColor]) {
        self.enabledPaintProperties[MGLPropertyPolygonOutlineColor] = @YES;
    }

    if (styleAnnotation.attributes[MGLPropertyPolygonPattern]) {
        self.enabledPaintProperties[MGLPropertyPolygonPattern] = @YES;
    }
}

- (void)setPaintProperties {
    if (self.enabledPaintProperties[MGLPropertyPolygonOpacity]) {
        self.fillStyleLayer.fillOpacity = [NSExpression expressionForKeyPath:MGLPropertyPolygonOpacity];

    }

    if (self.enabledPaintProperties[MGLPropertyPolygonColor]) {
        self.fillStyleLayer.fillColor = [NSExpression expressionForKeyPath:MGLPropertyPolygonColor];
    }

    if (self.enabledPaintProperties[MGLPropertyPolygonOutlineColor]) {
        self.fillStyleLayer.fillOutlineColor = [NSExpression expressionForKeyPath:MGLPropertyPolygonOutlineColor];
    }

    if (self.enabledPaintProperties[MGLPropertyPolygonPattern]) {
        self.fillStyleLayer.fillPattern = [NSExpression expressionForKeyPath:MGLPropertyPolygonPattern];
    }
}

@end
