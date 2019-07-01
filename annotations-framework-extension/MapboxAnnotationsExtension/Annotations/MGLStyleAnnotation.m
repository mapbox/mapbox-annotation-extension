#import "MGLStyleAnnotation.h"

NSString *const MGLPropertyAnnotationIdentifier = @"annotation-identifier";
NSString *const MGLPropertyAnnotationTitle = @"annotation-title";
NSString *const MGLPropertyAnnotationSubtitle = @"annotation-subtitle";
NSString *const MGLPropertyAnnotationTooltip = @"annotation-tooltip";

@interface MGLStyleAnnotation()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

@implementation MGLStyleAnnotation

- (instancetype)init {
    if (self = [super init]) {
        self.attributes = [NSMutableDictionary dictionary];
        self.identifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (instancetype)initWithFeature:(id<MGLFeature>)feature {
    if (self = [self init]) {
        _feature = feature;
    }

    return self;
}

- (instancetype)initWithGeoJSON:(NSData *)data {
    if (self = [self init]) {

    }

    return self;
}

- (void)setIdentifier:(NSString * _Nonnull)identifier {
    self.attributes[MGLPropertyAnnotationIdentifier] = identifier;
}

- (NSString *)identifier {
    return self.attributes[MGLPropertyAnnotationIdentifier];
}

- (void)setTitle:(NSString *)title {
    if (title) {
        self.attributes[MGLPropertyAnnotationTitle] = title;
    }
}

- (NSString *)title {
    return self.attributes[MGLPropertyAnnotationTitle];
}

- (void)setSubtitle:(NSString *)subtitle {
    if (subtitle) {
        self.attributes[MGLPropertyAnnotationSubtitle] = subtitle;
    }
}

- (NSString *)subtitle {
    return self.attributes[MGLPropertyAnnotationSubtitle];
}

- (NSDictionary *)geoJSONDictionary {
    return [NSDictionary dictionary];
}


@end
