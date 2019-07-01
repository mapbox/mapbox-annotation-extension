#import "MGLPolygonStyleAnnotation.h"
#import "MGLPolygonStyleAnnotation_Private.h"
#import "UIColor+MGLAnnotationsExtension.h"

NSString *const MGLPropertyPolygonOpacity = @"fill-opacity";
NSString *const MGLPropertyPolygonColor = @"fill-color";
NSString *const MGLPropertyPolygonOutlineColor = @"fill-outline-color";
NSString *const MGLPropertyPolygonPattern = @"fill-pattern";

@interface MGLPolygonStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MGLPolygonFeature * polygonFeature;

@end

@implementation MGLPolygonStyleAnnotation

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        self.polygonFeature = [MGLPolygonFeature polygonWithCoordinates:coordinates count:count];
    }

    return self;
}

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count fillColor:(UIColor *)fillColor {
    if (self = [self init:coordinates count:count]) {
        self.fillColor = fillColor;
    }

    return self;
}

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count interiorPolygons:(NSArray<MGLPolygonFeature *> *)interiorPolygons {
    if (self = [self init:coordinates count:count]) {
        self.interiorPolygons = interiorPolygons;
    }

    return self;
}

- (UIColor *)fillColor {
    if (self.attributes[MGLPropertyPolygonColor]) {
        NSString *colorString = self.attributes[MGLPropertyPolygonColor];
        return [UIColor mgl_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setFillColor:(UIColor *)fillColor {
    NSString *colorString = fillColor.mgl_rgbaColorString;
    self.attributes[MGLPropertyPolygonColor] = colorString;
}

- (CGFloat)fillOpacity {
    if (self.attributes[MGLPropertyPolygonOpacity]) {
        NSNumber *constantValue = self.attributes[MGLPropertyPolygonOpacity];
        return constantValue.doubleValue;
    }
    return 1.0;
}

- (void)setFillOpacity:(CGFloat)fillOpacity {
    self.attributes[MGLPropertyPolygonOpacity] = @(fillOpacity);
}

- (UIColor *)fillOutlineColor {
    if (self.attributes[MGLPropertyPolygonOutlineColor]) {
        NSString *colorString = self.attributes[MGLPropertyPolygonOutlineColor];
        return [UIColor mgl_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setFillOutlineColor:(UIColor *)fillOutlineColor {
    NSString *colorString = fillOutlineColor.mgl_rgbaColorString;
    self.attributes[MGLPropertyPolygonOutlineColor] = colorString;
}

- (NSString *)fillPattern {
    if (self.attributes[MGLPropertyPolygonPattern]) {
        return self.attributes[MGLPropertyPolygonPattern];
    }

    return nil;
}

- (void)setFillPattern:(NSString *)fillPattern {
    self.attributes[MGLPropertyPolygonPattern] = fillPattern;
}

- (id<MGLFeature>)feature {
    self.polygonFeature.attributes = self.attributes;
    return self.polygonFeature;
}

@end
