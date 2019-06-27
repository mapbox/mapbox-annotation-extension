#import <Foundation/Foundation.h>
@import Mapbox;

@class MGLStyleAnnotation;
@class MGLAnnotationController;

NS_ASSUME_NONNULL_BEGIN

@protocol MGLAnnotationControllerDelegate <NSObject>

- (void)annotationController:(MGLAnnotationController *)annotationController didSelectStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;
- (void)annotationController:(MGLAnnotationController *)annotationController didDeselectStyleAnnotation:(MGLStyleAnnotation*)styleAnnotation;

@end

@interface MGLAnnotationController : NSObject

@property (nonatomic, assign) BOOL annotationsInteractionEnabled;
@property (nonatomic, strong) MGLMapView *mapView;

- (instancetype)initWithMapView:(MGLMapView *)mapView;
- (instancetype)initWithMapView:(MGLMapView *)mapView belowLayerIdentifier:(NSString *)layerIdentifier;

- (void)addStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;
- (void)addStyleAnnotations:(NSArray<MGLStyleAnnotation *> *)styleAnnotations;

- (void)removeStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;
- (void)removeStyleAnnotations:(NSArray <MGLStyleAnnotation *> *)styleAnnotations;

- (void)updateStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;
- (void)updateStyleAnnotations:(NSArray <MGLStyleAnnotation *> *)styleAnnotations;

- (void)setNeedsUpdate;


@end

NS_ASSUME_NONNULL_END
