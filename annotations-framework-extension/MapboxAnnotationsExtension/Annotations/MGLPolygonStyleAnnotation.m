#import "MGLPolygonStyleAnnotation.h"
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
