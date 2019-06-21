#import "MGLLineStyleAnnotation.h"

static NSString * const MGLPropertyLineJoin = @"";
static NSString * const MGLPropertyLineOpacity = @"";
static NSString * const MGLPropertyLineColor = @"";
static NSString * const MGLPropertyLineGapWidth = @"";
static NSString * const MGLPropertyLineWidth = @"";
static NSString * const MGLPropertyLineOffset = @"";
static NSString * const MGLPropertyLineBlur = @"";
static NSString * const MGLPropertyLinePattern = @"";

@implementation MGLLineStyleAnnotation

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)init:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count color:(UIColor *)color {
    if (self = [super init]) {
        
    }
    return self;
}

@end
