#import "MGLStyleAnnotation.h"

@implementation MGLStyleAnnotation

- (instancetype)init {
    if (self = [super init]) {
        self.identifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (instancetype)initWithFeature:(id<MGLFeature>)feature {
    if (self = [self init]) {

    }

    return self;
}

- (instancetype)initWithGeoJSON:(NSData *)data {
    if (self = [self init]) {

    }

    return self;
}

- (NSDictionary *)geoJSONDictionary {
    return [NSDictionary dictionary];
}


@end
