#import <UIKit/UIKit.h>
@import Mapbox;
@class MGLAnnotationController;

NS_ASSUME_NONNULL_BEGIN

@interface MGLAnnotationLayerView : UIView

@property (nonatomic, weak) MGLAnnotationController *annotationController;

- (void)selectAnnotation:(id<MGLFeature>)annotation;

- (void)deselectAnnotation:(id<MGLFeature>)annotation;

@end

NS_ASSUME_NONNULL_END
