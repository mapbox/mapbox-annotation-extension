#import <Foundation/Foundation.h>
@import Mapbox;

@class MGLStyleAnnotation;
@class MGLAnnotationController;

NS_ASSUME_NONNULL_BEGIN

/**
 The `MGLAnnotationControllerDelegate` protocol defines a set of optional methods that you
 can use to receive updates to style annotation changes.
 */
@protocol MGLAnnotationControllerDelegate <NSObject>

@optional

/**
 Called after the user has tapped and selected a style annotation.
 
 @param styleAnnotation The annotation that was selected.
 */
- (void)annotationController:(MGLAnnotationController *)annotationController didSelectStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;

/**
 Called after the user has tapped and deselected a style annotation.
 
 @param styleAnnotation The annotation that was deselected.
 */
- (void)annotationController:(MGLAnnotationController *)annotationController didDeselectStyleAnnotation:(MGLStyleAnnotation*)styleAnnotation;

@end

/**
  An `MGLStyleAnnotationController` is the object responsible for adding, removing, and updating
 `MGLStyleAnnotation`s on a map.

  Do not create instances of `MGLStyleAnnotationController` directly. Instead, create an instance of
 `MGLCircleAnnotationController`, `MGLLineAnnotationController`, `MGLPolygonAnnotationController`, or
 `MGLSymbolAnnotationController` and use `-[MGLAnnotationController addShape:]` or 
 `-[MGLStyleAnnotationController addShapes:]` to add shapes to an `MGLMapView`.
 */

@interface MGLAnnotationController : NSObject

/**
 A boolean indicating whether style annotations belonging to the controller should support
 callouts when the user taps on them.
 */
@property (nonatomic, assign) BOOL annotationsInteractionEnabled;

/**
 The `MGLMapView` associated with the style annotation controller.
 */
@property (nonatomic, strong) MGLMapView *mapView;

/**
 The receiver's delegate.
 
 An annotation controller sends messages to its delegate to notify when a style annotation
 is selected/deselected.
 */
@property (nonatomic, weak, nullable) id<MGLAnnotationControllerDelegate> delegate;

# pragma mark Initializing style annotation controllers
/**
 Returns a new style annotation controller for the specified map view.
 
 @param mapView The `MGLMapView` the that style annotations should be added to.
 @return An initialized style annotation controller.
*/
- (instancetype)initWithMapView:(MGLMapView *)mapView;

/**
 Returns a new style annotation controller for the specified map view, that will be capable of
 adding style annotations below a given [style layer](https://docs.mapbox.com/help/glossary/layer/) 
 within a `MGLStyle`.
 
 @param mapView The `MGLMapView` the that style annotations should be added to.
 @param layerIdentifier The unique string identifier representing the layer at which style 
    annotations can be inserted under.
 @return An initialized style annotation controller.
*/
- (instancetype)initWithMapView:(MGLMapView *)mapView belowLayerIdentifier:(NSString *)layerIdentifier;


# pragma mark Adding, removing, and updating style annotations

/**
 Adds a single style annotation to the `MGLMapView`.
 
 @param styleAnnotation The `MGLStyleAnnotation` that should be added.
 */
- (void)addStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;

/**
 Adds multiple style annotations to the `MGLMapView`.
 
 @param styleAnnotations An array of `MGLStyleAnnotation`s that should be added to the `MGLMapView`.
 */
- (void)addStyleAnnotations:(NSArray<MGLStyleAnnotation *> *)styleAnnotations;


/**
 Removes a single style annotation from the `MGLMapView`.
 
 @param styleAnnotation The `MGLStyleAnnotation` that should be removed.
 */
- (void)removeStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;

/**
 Removes multiple style annotation from the `MGLMapView`.
 
 @param styleAnnotations An array of `MGLStyleAnnotation`s that should be removed from the `MGLMapView`.
 */
- (void)removeStyleAnnotations:(NSArray <MGLStyleAnnotation *> *)styleAnnotations;

/**
 Updates a single style annotation on the `MGLMapView`.
 
 @param styleAnnotation The `MGLStyleAnnotation` that should be updated.
 */
- (void)updateStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;

/**
 Updates multiple style annotationa on the `MGLMapView`.
 
 @param styleAnnotations An array of `MGLStyleAnnotation`s that should be updated.
 */
- (void)updateStyleAnnotations:(NSArray <MGLStyleAnnotation *> *)styleAnnotations;

/**
 Selects the style annotation programmatically.
 
 @param styleAnnotation The `MGLStyleAnnotation` to be selected.
 */
- (void)selectStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;

/**
 Deselects the style annotation programmatically.
 
 @param styleAnnotation The `MGLStyleAnnotation` to be deselected.
 */
- (void)deselectStyleAnnotation:(MGLStyleAnnotation *)styleAnnotation;

/**
 :nodoc:
 An internal method to update the coordinates and paint properties of annotations within
 a style annotation controller.
 */
- (void)setNeedsUpdate;

/**
 Returns the style annotations added to the controller.
 
 Objects returned may not be in the same order as they were added.
 */
- (NSArray<MGLStyleAnnotation*> *)styleAnnotations;

@end

NS_ASSUME_NONNULL_END
