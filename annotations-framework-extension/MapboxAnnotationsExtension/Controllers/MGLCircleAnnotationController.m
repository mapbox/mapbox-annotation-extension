#import "MGLCircleAnnotationController.h"
#import "MGLCircleStyleAnnotation_Private.h"

@interface MGLCircleAnnotationController()

@property (nonatomic, strong) MGLShapeSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MGLCircleAnnotationController

- (instancetype)initWithMapView:(MGLMapView *)mapView {
    if (self = [super initWithMapView:mapView]) {
        [self commonInit];
        [self.mapView.style addLayer:self.layer];
    }
    return self;
}

- (instancetype)initWithMapView:(MGLMapView *)mapView belowLayerIdentifier:(NSString *)layerIdentifier {
    if (self = [self initWithMapView:mapView]) {
        [self commonInit];
        MGLStyleLayer *topLayer = [self.mapView.style layerWithIdentifier:layerIdentifier];
        [self.mapView.style insertLayer:self.layer belowLayer:topLayer];
    }
    return self;
}

- (void)commonInit {
    
    self.enabledPaintProperties = [NSMutableDictionary dictionary];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *circleLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MGLCircleStyleLayer *circleStyleLayer = [[MGLCircleStyleLayer alloc] initWithIdentifier:circleLayerIdentifier source:self.source];
    self.layer = circleStyleLayer;
}

- (MGLCircleStyleLayer *)circleStyleLayer {
    return (MGLCircleStyleLayer *)self.layer;
}

- (void)setCircleTranslation:(CGVector)circleTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(circleTranslation)];
    self.circleStyleLayer.circleTranslation = constantValue;
}

- (CGVector)circleTranslation {
    NSExpression *constantValue = self.circleStyleLayer.circleTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setCircleTranslationAnchor:(MGLCircleTranslationAnchor)circleTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(circleTranslationAnchor)];
    self.circleStyleLayer.circleTranslationAnchor = constantValue;
}

- (MGLCircleTranslationAnchor)circleTranslationAnchor {
    NSExpression *constantValue = self.circleStyleLayer.circleTranslationAnchor;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.MGLCircleTranslationAnchorValue;
}

- (void)setCirclePitchAlignment:(MGLCirclePitchAlignment)circlePitchAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(circlePitchAlignment)];
    self.circleStyleLayer.circlePitchAlignment = constantValue;
}

- (MGLCirclePitchAlignment)circlePitchAlignment {
    NSExpression *constantValue = self.circleStyleLayer.circlePitchAlignment;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.MGLCirclePitchAlignmentValue;
}

- (void)setCircleScaleAlignment:(MGLCircleScaleAlignment)circleScaleAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(circleScaleAlignment)];
    self.circleStyleLayer.circleScaleAlignment = constantValue;
}
- (MGLCircleScaleAlignment)circleScaleAlignment {
    NSExpression *constantValue = self.circleStyleLayer.circleScaleAlignment;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.MGLCircleScaleAlignmentValue;
}

- (void)enablePaintProperties:(MGLCircleStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MGLPropertyCircleRadius]) {
        self.enabledPaintProperties[MGLPropertyCircleRadius] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyCircleColor]) {
        self.enabledPaintProperties[MGLPropertyCircleColor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyCircleBlur]) {
        self.enabledPaintProperties[MGLPropertyCircleBlur] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyCircleOpacity]) {
        self.enabledPaintProperties[MGLPropertyCircleOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyCircleStrokeWidth]) {
        self.enabledPaintProperties[MGLPropertyCircleStrokeWidth] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyCircleStrokeColor]) {
        self.enabledPaintProperties[MGLPropertyCircleStrokeColor] = @YES;
    }
    if (styleAnnotation.attributes[MGLPropertyCircleStrokeOpacity]) {
        self.enabledPaintProperties[MGLPropertyCircleStrokeOpacity] = @YES;
    }
    
}

- (void)setPaintProperties {
    if (self.enabledPaintProperties[MGLPropertyCircleRadius]) {
        self.circleStyleLayer.circleRadius = [NSExpression expressionForKeyPath:MGLPropertyCircleRadius];
    }
    if (self.enabledPaintProperties[MGLPropertyCircleColor]) {
        self.circleStyleLayer.circleColor = [NSExpression expressionForKeyPath:MGLPropertyCircleColor];
    }
    if (self.enabledPaintProperties[MGLPropertyCircleBlur]) {
        self.circleStyleLayer.circleBlur = [NSExpression expressionForKeyPath:MGLPropertyCircleBlur];
    }
    if (self.enabledPaintProperties[MGLPropertyCircleOpacity]) {
        self.circleStyleLayer.circleOpacity = [NSExpression expressionForKeyPath:MGLPropertyCircleOpacity];
    }
    if (self.enabledPaintProperties[MGLPropertyCircleStrokeWidth]) {
        self.circleStyleLayer.circleStrokeWidth = [NSExpression expressionForKeyPath:MGLPropertyCircleStrokeWidth];
    }
    if (self.enabledPaintProperties[MGLPropertyCircleStrokeColor]) {
        self.circleStyleLayer.circleStrokeColor = [NSExpression expressionForKeyPath:MGLPropertyCircleStrokeColor];
    }
    if (self.enabledPaintProperties[MGLPropertyCircleStrokeOpacity]) {
        self.circleStyleLayer.circleStrokeOpacity = [NSExpression expressionForKeyPath:MGLPropertyCircleStrokeOpacity];
    }
}

@end
