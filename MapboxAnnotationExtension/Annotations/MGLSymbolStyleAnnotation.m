#import "MGLSymbolStyleAnnotation_Private.h"
#import "MGLEnums+MGLAnnotationExtension.h"
#import "UIColor+MGLAnnotationExtension.h"

NSString *const  MGLPropertyIconScale = @"icon-size";
NSString *const  MGLPropertyIconImageName = @"icon-image";
NSString *const  MGLPropertyIconRotation = @"icon-rotate";
NSString *const  MGLPropertyIconOffset = @"icon-offset";
NSString *const  MGLPropertyIconAnchor = @"icon-anchor";
NSString *const  MGLPropertyIconOpacity = @"icon-opacity";
NSString *const  MGLPropertyIconColor = @"icon-color";
NSString *const  MGLPropertyIconHaloColor = @"icon-halo-color";
NSString *const  MGLPropertyIconHaloWidth = @"icon-halo-width";
NSString *const  MGLPropertyIconHaloBlur = @"icon-halo-blur";

NSString *const  MGLPropertyText = @"text-field";
NSString *const  MGLPropertyTextFontNames = @"text-font";
NSString *const  MGLPropertyTextFontSize = @"text-size";
NSString *const  MGLPropertyMaximumTextWidth = @"text-max-width";
NSString *const  MGLPropertyTextLetterSpacing = @"text-letter-spacing";
NSString *const  MGLPropertyTextJustification = @"text-justify";
NSString *const  MGLPropertyTextRadialOffset = @"text-radial-offset";
NSString *const  MGLPropertyTextAnchor = @"text-anchor";
NSString *const  MGLPropertyTextRotation = @"text-rotate";
NSString *const  MGLPropertyTextTransform = @"text-transform";
NSString *const  MGLPropertyTextOffset = @"text-offset";
NSString *const  MGLPropertyTextOpacity = @"text-opacity";
NSString *const  MGLPropertyTextColor = @"text-color";
NSString *const  MGLPropertyTextHaloColor = @"text-halo-color";
NSString *const  MGLPropertyTextHaloWidth = @"text-halo-width";
NSString *const  MGLPropertyTextHaloBlur = @"text-halo-blur";

NSString *const  MGLPropertySymbolSortKey = @"symbol-sort-key";

@interface MGLSymbolStyleAnnotation()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MGLPointFeature * pointFeature;

@end

@implementation MGLSymbolStyleAnnotation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    if (self = [super init]) {
        self.pointFeature = [[MGLPointFeature alloc] init];
        self.pointFeature.coordinate = coordinate;
    }
    return self;
}

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate text:(NSString *)text color:(UIColor *)color {
    if (self = [self initWithCoordinate:coordinate]) {
        self.text = text;
        self.textColor = color;
    }
    return self;
}

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate iconImageName:(NSString *)iconImageName {
    if (self = [self initWithCoordinate:coordinate]) {
        self.iconImageName = iconImageName;
    }
    return self;
}

- (void)setIconAnchor:(MGLIconAnchor)iconAnchor {
    self.attributes[MGLPropertyIconAnchor] = [MGLEnums stringFromMGLIconAnchor:iconAnchor];
}

- (MGLIconAnchor)iconAnchor {
    if (self.attributes[MGLPropertyIconAnchor]) {
        NSString *constantValue = self.attributes[MGLPropertyIconAnchor];
        return [MGLEnums iconAnchorFromNSString:constantValue];
    }
    return MGLIconAnchorCenter;
}

- (void)setIconImageName:(NSString *)iconImageName {
    if (iconImageName) {
        self.attributes[MGLPropertyIconImageName] = iconImageName;
    }
}

- (NSString *)iconImageName {
    return self.attributes[MGLPropertyIconImageName];
}

- (void)setIconOffset:(CGVector)iconOffset {
    self.attributes[MGLPropertyIconOffset] = @[@(iconOffset.dx), @(iconOffset.dy)];
}

- (CGVector)iconOffset {
    if (self.attributes[MGLPropertyIconOffset]) {
        NSArray<NSNumber *> *constantValue = self.attributes[MGLPropertyIconOffset];
        return CGVectorMake(constantValue[0].doubleValue, constantValue[1].doubleValue);
    }
    return CGVectorMake(0.0, 0.0);
}

- (void)setIconRotation:(CGFloat)iconRotation {
    self.attributes[MGLPropertyIconRotation] = @(iconRotation);
}

- (CGFloat)iconRotation {
    if (self.attributes[MGLPropertyIconRotation]) {
        NSNumber *value = self.attributes[MGLPropertyIconRotation];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setIconScale:(CGFloat)iconScale {
    self.attributes[MGLPropertyIconScale] = @(iconScale);
}

- (CGFloat)iconScale {
    if (self.attributes[MGLPropertyIconScale]) {
        NSNumber *value = self.attributes[MGLPropertyIconScale];
        return value.doubleValue;
    }
    return 1.0;
}

- (void)setIconColor:(UIColor *)iconColor {
    self.attributes[MGLPropertyIconColor] = iconColor.mgl_rgbaColorString;
}

- (UIColor *)iconColor {
    if (self.attributes[MGLPropertyIconColor]) {
        NSString *colorString = self.attributes[MGLPropertyIconColor];
        return [UIColor mgl_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setIconHaloBlur:(CGFloat)iconHaloBlur {
    self.attributes[MGLPropertyIconHaloBlur] = @(iconHaloBlur);
}

- (CGFloat)iconHaloBlur {
    if (self.attributes[MGLPropertyIconHaloBlur]) {
        NSNumber *value = self.attributes[MGLPropertyIconHaloBlur];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setIconHaloColor:(UIColor *)iconHaloColor {
    self.attributes[MGLPropertyIconHaloColor] = iconHaloColor.mgl_rgbaColorString;
}

- (UIColor *)iconHaloColor {
    if (self.attributes[MGLPropertyIconHaloColor]) {
        NSString *value = self.attributes[MGLPropertyIconHaloColor];
        return [UIColor mgl_colorWithRgbaColorString:value];
    }
    return UIColor.clearColor;
}

- (void)setIconHaloWidth:(CGFloat)iconHaloWidth {
    self.attributes[MGLPropertyIconHaloWidth] = @(iconHaloWidth);
}

- (CGFloat)iconHaloWidth {
    if (self.attributes[MGLPropertyIconHaloWidth]) {
        NSNumber *value = self.attributes[MGLPropertyIconHaloWidth];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setIconOpacity:(CGFloat)iconOpacity {
    self.attributes[MGLPropertyIconOpacity] = @(iconOpacity);
}

- (CGFloat)iconOpacity {
    if (self.attributes[MGLPropertyIconOpacity]) {
        NSNumber *value = self.attributes[MGLPropertyIconOpacity];
        return value.doubleValue;
    }
    return 1.0;
}

- (void)setText:(NSString *)text {
    if (text) {
        self.attributes[MGLPropertyText] = text;
    }
}

- (NSString *)text {
    return self.attributes[MGLPropertyText];
}

- (void)setTextAnchor:(MGLTextAnchor)textAnchor {
    self.attributes[MGLPropertyTextAnchor] = [MGLEnums stringFromMGLTextAnchor:textAnchor];
}

- (MGLTextAnchor)textAnchor {
    if (self.attributes[MGLPropertyTextAnchor]) {
        NSString *value = self.attributes[MGLPropertyTextAnchor];
        return [MGLEnums textAnchorFromNSString:value];
    }
    return MGLTextAnchorCenter;
}

- (void)setFontNames:(NSArray<NSString *> *)fontNames {
    if (fontNames) {
        self.attributes[MGLPropertyTextFontNames] = fontNames;
    }
}

- (NSArray<NSString *> *)fontNames {
    if (self.attributes[MGLPropertyTextFontNames]) {
        NSArray<NSString *> *value = self.attributes[MGLPropertyTextFontNames];
        return value;
    }
    return @[@"Open Sans Regular", @"Arial Unicode MS Regular"];
}

- (void)setTextFontSize:(CGFloat)textFontSize {
    self.attributes[MGLPropertyTextFontSize] = @(textFontSize);
}

- (CGFloat)textFontSize {
    if (self.attributes[MGLPropertyTextFontSize]) {
        NSNumber *value = self.attributes[MGLPropertyTextFontSize];
        return value.doubleValue;
    }
    return 16.0;
}

- (void)setTextJustification:(MGLTextJustification)textJustification {
    self.attributes[MGLPropertyTextJustification] = [MGLEnums stringFromMGLTextJustification:textJustification];
}

- (MGLTextJustification)textJustification {
    if (self.attributes[MGLPropertyTextJustification]) {
        NSString *value = self.attributes[MGLPropertyTextJustification];
        return [MGLEnums textJustificationFromNSString:value];
    }
    return MGLTextJustificationCenter;
}

- (void)setTextLetterSpacing:(CGFloat)textLetterSpacing {
    self.attributes[MGLPropertyTextLetterSpacing] = @(textLetterSpacing);
}

- (CGFloat)textLetterSpacing {
    if (self.attributes[MGLPropertyTextLetterSpacing]) {
        NSNumber *value = self.attributes[MGLPropertyTextLetterSpacing];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextOffset:(CGVector)textOffset {
    self.attributes[MGLPropertyTextOffset] = @[@(textOffset.dx), @(textOffset.dy)];
}

- (CGVector)textOffset {
    if (self.attributes[MGLPropertyTextOffset]) {
        NSArray<NSNumber *> *value = self.attributes[MGLPropertyTextOffset];
        return CGVectorMake(value[0].doubleValue, value[1].doubleValue);
    }
    return CGVectorMake(0.0, 0.0);
}

- (void)setTextRadialOffset:(CGFloat)textRadialOffset {
    self.attributes[MGLPropertyTextRadialOffset] = @(textRadialOffset);
}

- (CGFloat)textRadialOffset {
    if (self.attributes[MGLPropertyTextRadialOffset]) {
        NSNumber *value = self.attributes[MGLPropertyTextRadialOffset];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextRotation:(CGFloat)textRotation {
    self.attributes[MGLPropertyTextRotation] = @(textRotation);
}

- (CGFloat)textRotation {
    if (self.attributes[MGLPropertyTextRotation]) {
        NSNumber *value = self.attributes[MGLPropertyTextRotation];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextTransform:(MGLTextTransform)textTransform {
    self.attributes[MGLPropertyTextTransform] = [MGLEnums stringFromMGLTextTransform:textTransform];
}

- (MGLTextTransform)textTransform {
    if (self.attributes[MGLPropertyTextTransform]) {
        NSString *value = self.attributes[MGLPropertyTextTransform];
        return [MGLEnums textTransformFromNSString:value];
    }
    return MGLTextTransformNone;
}

- (void)setTextColor:(UIColor *)textColor {
    self.attributes[MGLPropertyTextColor] = textColor.mgl_rgbaColorString;
}

- (UIColor *)textColor {
    if (self.attributes[MGLPropertyTextColor]) {
        NSString *value = self.attributes[MGLPropertyTextColor];
        return [UIColor mgl_colorWithRgbaColorString:value];
    }
    return UIColor.blackColor;
}

- (void)setTextHaloBlur:(CGFloat)textHaloBlur {
    self.attributes[MGLPropertyTextHaloBlur] = @(textHaloBlur);
}

- (CGFloat)textHaloBlur {
    if (self.attributes[MGLPropertyTextHaloBlur]) {
        NSNumber *value = self.attributes[MGLPropertyTextHaloBlur];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextHaloColor:(UIColor *)textHaloColor {
    self.attributes[MGLPropertyTextHaloColor] = textHaloColor.mgl_rgbaColorString;
}

- (UIColor *)textHaloColor {
    if (self.attributes[MGLPropertyTextHaloColor]) {
        NSString *value = self.attributes[MGLPropertyTextHaloColor];
        return [UIColor mgl_colorWithRgbaColorString:value];
    }
    return [UIColor clearColor];
}

- (void)setTextHaloWidth:(CGFloat)textHaloWidth {
    self.attributes[MGLPropertyTextHaloWidth] = @(textHaloWidth);
}

- (CGFloat)textHaloWidth {
    if (self.attributes[MGLPropertyTextHaloWidth]) {
        NSNumber *value = self.attributes[MGLPropertyTextHaloWidth];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextOpacity:(CGFloat)textOpacity {
    self.attributes[MGLPropertyTextOpacity] = @(textOpacity);
}

- (CGFloat)textOpacity {
    if (self.attributes[MGLPropertyTextOpacity]) {
        NSNumber *value = self.attributes[MGLPropertyTextOpacity];
        return value.doubleValue;
    }
    return 1.0;
}

- (void)setMaximumTextWidth:(CGFloat)maximumTextWidth {
    self.attributes[MGLPropertyMaximumTextWidth] = @(maximumTextWidth);
}

- (CGFloat)maximumTextWidth {
    if (self.attributes[MGLPropertyMaximumTextWidth]) {
        NSNumber *value = self.attributes[MGLPropertyMaximumTextWidth];
        return value.doubleValue;
    }
    return 10.0;
}

- (void)setSymbolSortKey:(NSInteger)symbolSortKey {
    self.attributes[MGLPropertySymbolSortKey] = @(symbolSortKey);
}

- (NSInteger)symbolSortKey {
    if (self.attributes[MGLPropertySymbolSortKey]) {
        NSNumber *value = self.attributes[MGLPropertySymbolSortKey];
        return value.integerValue;
    }
    return 0;
}

- (id<MGLFeature>)feature {
    self.pointFeature.attributes = self.attributes;
    return self.pointFeature;
}

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta {
    CLLocationCoordinate2D center = self.pointFeature.coordinate;
    self.pointFeature.coordinate = CLLocationCoordinate2DMake(center.latitude + delta.dy, center.longitude + delta.dx);
    return self;
}

@end
