#import "MGLPolygonStyleAnnotation.h"

static NSString * const MGLPropertyPolygonOpacity = @"";
static NSString * const MGLPropertyPolygonColor = @"";
static NSString * const MGLPropertyPolygonOutlineColor = @"";
static NSString * const MGLPropertyPolygonPattern = @"";

@implementation MGLPolygonStyleAnnotation

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count fillColor:(UIColor *)fillColor {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count interiorPolygons:(NSArray<MGLPolygonFeature *> *)interiorPolygons {
    if (self = [super init]) {
        
    }
    return self;
}

@end
