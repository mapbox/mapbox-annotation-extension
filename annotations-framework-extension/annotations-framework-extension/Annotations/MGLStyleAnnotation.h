#import <Foundation/Foundation.h>
@import Mapbox;

NS_ASSUME_NONNULL_BEGIN

@interface MGLStyleAnnotation : NSObject

@property (nonatomic, nullable) NSString *title;
@property (nonatomic, nullable) NSString *subtitle;
@property (nonatomic, nullable) NSString *tooltip;
@property (nonatomic, strong) id<MGLFeature> feature;

-(instancetype)initWithFeature:(id<MGLFeature>)feature;
-(instancetype)initWithGeoJSON:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
