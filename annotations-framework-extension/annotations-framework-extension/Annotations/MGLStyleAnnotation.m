#import "MGLStyleAnnotation.h"

@interface MGLStyleAnnotation ()

@property (nonatomic) NSString *UUID;

- (NSDictionary*)geoJSONDictionary;

@end

@implementation MGLStyleAnnotation

- (instancetype)initWithFeature:(id<MGLFeature>)feature {
    if (self = [super init]) {

    }

    return self;
}

- (instancetype)initWithGeoJSON:(NSData *)data {
    if (self = [super init]) {

    }

    return self;
}

- (NSDictionary *)geoJSONDictionary {
    return [NSDictionary dictionary];
}


@end
