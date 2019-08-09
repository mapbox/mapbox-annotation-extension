#import <Foundation/Foundation.h>
@import Mapbox;

NS_ASSUME_NONNULL_BEGIN

/**
  An `MGLStyleAnnotation` represents a single point, line, or polygon shape that can be displayed
  on an `MGLMapView` within a geographical coordinate space.
 
  Do not create instances of `MGLStyleAnnotation` directly. Instead, create an instance of
 `MGLCircleStyleAnnotation`, `MGLLineStyleAnnotation`, `MGLPolygonStyleAnnotation`, or
 `MGLSymbolStyleAnnotation` and use `-[MGLAnnotationController addShape:]` or 
 `-[MGLStyleAnnotationController addShapes:]` to add an `MGLStyleAnnotation` to a map view.
 */

@interface MGLStyleAnnotation : NSObject

/**
 The universally unique identifier of the style annotation.
 */
@property (nonatomic, copy, readonly) NSString *identifier;

/**
 If provided, the title string displayed if callouts are enabled.
 */
@property (nonatomic, nullable) NSString *title;

/**
 If provided, the subtitle string displayed if callouts are enabled.
 */
@property (nonatomic, nullable) NSString *subtitle;

/**
 :nodoc:
 The `MGLFeature` associated with the style annotation.
 */
@property (nonatomic, strong) id<MGLFeature> feature;

/**
 :nodoc:
 The dictionary of values describing which style properties are enabled for the style annotation.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, id> *geoJSONDictionary;

/**
 A Boolean value indicating whether the annotation view is draggable.
 
 If this property is set to `YES`, the user can drag the annotation after
 pressing and holding the view. The default value of this property is
 `NO`.
 */
@property (nonatomic, assign, getter=isDraggable) BOOL draggable;

//-(instancetype)initWithFeature:(id<MGLFeature>)feature;
//-(instancetype)initWithGeoJSON:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
