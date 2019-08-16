#import "MGLPolygonStyleAnnotation.h"
#import "UIColor+MGLAnnotationExtension.h"

NSString *const MGLPropertyPolygonOpacity = @"fill-opacity";
NSString *const MGLPropertyPolygonColor = @"fill-color";
NSString *const MGLPropertyPolygonOutlineColor = @"fill-outline-color";
NSString *const MGLPropertyPolygonPattern = @"fill-pattern";

@interface MGLPolygonStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MGLPolygonFeature *polygonFeature;

@end

@implementation MGLPolygonStyleAnnotation

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        self.polygonFeature = [MGLPolygonFeature polygonWithCoordinates:coordinates count:count];
    }

    return self;
}

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count fillColor:(UIColor *)fillColor {
    if (self = [self initWithCoordinates:coordinates count:count]) {
        self.fillColor = fillColor;
    }

    return self;
}

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count interiorPolygons:(NSArray<MGLPolygonFeature *> *)interiorPolygons {
    if (self = [super init]) {
        self.polygonFeature = [MGLPolygonFeature polygonWithCoordinates:coordinates count:count interiorPolygons:interiorPolygons];
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

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta {
    CLLocationCoordinate2D *coordinates = self.polygonFeature.coordinates;
    NSUInteger count = self.polygonFeature.pointCount;
    CLLocationCoordinate2D *shiftedCoordinates = calloc(sizeof(CLLocationCoordinate2D), count);
    
    for (NSUInteger index = 0; index < count; index++) {
        CLLocationCoordinate2D currentCoordinate = coordinates[index];
        shiftedCoordinates[index] = CLLocationCoordinate2DMake(currentCoordinate.latitude + delta.dy, currentCoordinate.longitude + delta.dx);
    }
    
    for (MGLPolygon *polygon in self.polygonFeature.interiorPolygons) {
        CLLocationCoordinate2D *coords = polygon.coordinates;
        NSUInteger pointCount = polygon.pointCount;
        CLLocationCoordinate2D *shiftedCoords = calloc(sizeof(CLLocationCoordinate2D), pointCount);
        
        for (NSUInteger index = 0; index < count; index++) {
            CLLocationCoordinate2D currentCoordinate = coords[index];
            shiftedCoords[index] = CLLocationCoordinate2DMake(currentCoordinate.latitude + delta.dy, currentCoordinate.longitude + delta.dx);
        }
        [polygon setCoordinates:shiftedCoords count:pointCount];
        free(shiftedCoords);
    }
    
    [self.polygonFeature setCoordinates:shiftedCoordinates count:count];
    free(shiftedCoordinates);
    return self;
}

@end
