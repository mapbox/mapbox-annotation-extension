#import "MGLAnnotationController.h"

@class MGLStyleAnnotation;

NS_ASSUME_NONNULL_BEGIN

@interface MGLAnnotationController (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, MGLStyleAnnotation *> *annotations;
@property (nonatomic, strong) MGLSource *source;
@property (nonatomic, strong) MGLStyleLayer *layer;

- (void)initializeLayer;
- (void)enablePaintProperties:(MGLStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

NS_ASSUME_NONNULL_END
