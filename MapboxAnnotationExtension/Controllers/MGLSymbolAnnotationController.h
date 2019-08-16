#import "MGLAnnotationController.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLSymbolAnnotationController` is a controller that creates internally
 instances of an `MGLShapeSource` and `MGLSymbolStyleLayer` to simplify the creation
 of runtime styling based annotations to the map.
 
 Create instances of `MGLSymbolStyleAnnotation` and pass it to this controller.
 
 An image must be supplied to the [map style's sprite](https://docs.mapbox.com/help/glossary/sprite/)
 before being able to assign it to be the icon image of a symbol.
 
 ### Example
 
 ```swift
 func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
    let attraction = UIImage(named: "attraction")
 
    if let styleImage = attraction {
        self.mapView.style?.setImage(styleImage, forName: "attraction")
    }
 
    let symbolAnnotationController = MGLSymbolAnnotationController(mapView: self.mapView)
 
    let symbol = MGLSymbolStyleAnnotation(coordinate: CLLocationCoordinate2DMake(59, 18));
    symbol.iconImageName = "attraction"
    symbol.text = "This is a cool place!"
    symbol.textFontSize = 16
    symbolAnnotationController.add(symbol)
 }
 ```
 */
@interface MGLSymbolAnnotationController : MGLAnnotationController

/**
 If true, the icon will be visible even if it collides with other previously drawn symbols.
 Requires `iconImageName`. Defaults to `NO`.
 
 This property corresponds to the `icon-allow-overlap` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-allow-overlap).
 */
@property (nonatomic, assign) BOOL iconAllowsOverlap;

/**
 If true, other symbols can be visible even if they collide with the icon.
 Requires `iconImageName`. Defaults to `NO`.
 
 This property corresponds to the `icon-ignore-placement` property in the style [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layout-symbol-icon-ignore-placement).
 */
@property (nonatomic, assign) BOOL iconIgnoresPlacement;

/**
 If true, text will display without their corresponding icons only when the icon collides with other
 symbols and the text does not. Requires `iconImageName`. Defaults to `NO`.
 
 This property corresponds to the `icon-optional` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-optional).
 */
@property (nonatomic, assign) BOOL iconOptional;

/**
 The size of the additional area around the icon's bounding box used for detecting symbol collisions.
 Requires `iconImageName`. Defaults to a `CGFloat` with a value of `2`.
 
 This property corresponds to the `icon-padding` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-padding).
 */
@property (nonatomic, assign) CGFloat iconPadding;

/**
 The orientation of the style annotation's icon when map is pitched, as defined by `MGLIconPitchAlignment`. 
 Requires `iconImageName`. Defaults to `auto`.
 
 This property corresponds to the `icon-pitch-alignment` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-pitch-alignment).
 */
@property (nonatomic, assign) MGLIconPitchAlignment iconPitchAlignment;

/**
 Determines the rotation behavior of icons, in combination with `symbolPlacement` as defined by `MGLIconRotationAlignment`.
 Requires `iconImageName`. Defaults to `auto`.
 
 This property corresponds to the `icon-pitch-alignment` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-rotation-alignment).
 */
@property (nonatomic, assign) MGLIconRotationAlignment iconRotationAlignment;

/**
 Scales the icon to fit around the associated text, as defined by `MGLIconTextFit`. 
 Requires `iconImageName` and `text`. Defaults to `none`.
 
 This property corresponds to the `icon-text-fit` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-text-fit).
 */
@property (nonatomic, assign) MGLIconTextFit iconTextFit;

/**
 The size of the additional area added to dimensions determined by `iconTextFit`.
 Defaults to `UIEdgeInsetsZero`.
 
 This property corresponds to the `icon-text-fit-padding` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-text-fit-padding).
 */
@property (nonatomic, assign) UIEdgeInsets iconTextFitPadding;

/**
 If true, the icon may be flipped to prevent it from being rendered upside-down.
 Requires `iconImageName`. Requires `iconRotationAlignment` to be set to `map`.
 Defaults to `NO`.
 
 This property corresponds to the `icon-keep-upright` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-keep-upright).
 */
@property (nonatomic, assign) BOOL keepsIconUpright;

/**
 If true, the text may be flipped vertically to prevent it from being rendered upside-down.
 Requires `text`. Requires `textRotationAlignment` to be set to `map`.
 Defaults to `YES`.
 
 This property corresponds to the `text-keep-upright` property in the style [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layout-symbol-text-keep-upright).
 */
@property (nonatomic, assign) BOOL keepsTextUpright;

/**
 Maximum angle change between adjacent characters, measured in degrees.
 Requires `text`. Requires `symbolPlacement` to be set to `line` or `center`. Defaults to `45` degrees.
 
 This property corresponds to the `text-max-angle` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-max-angle).
 */
@property (nonatomic, assign) CGFloat maximumTextAngle;

/**
 If true, the symbols will not cross tile edges to avoid mutual collisions. 
 Recommended in layers that don’t have enough padding in the vector tile to prevent collisions.
 
 This property corresponds to the `symbol-avoid-edges)` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-avoid-edges).
 */
@property (nonatomic, assign) BOOL symbolAvoidsEdges;

/**
 The placement of the symbol annotation's text relative to its geometry, as defined by `MGLSymbolPlacement`.
 Defaults to `point`.
 
 This property corresponds to the `symbol-placement` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-placement).
 */
@property (nonatomic, assign) MGLSymbolPlacement symbolPlacement;

/**
 Distance between two symbol anchors, measured in screen points.
 Requires `symbolPlacement` to be set to `line`. Defaults to a `CGFloat` that evaluates to `250`.
 
 This property corresponds to the `symbol-spacing` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-spacing).
 */
@property (nonatomic, assign) CGFloat symbolSpacing;

/**
 Controls the order in which overlapping symbol style annotations in the same 
 `MGLSymbolAnnotationController` are rendered, as defined by `MGLSymbolZOrder`. Defaults to `auto`.
 
 This property corresponds to the `symbol-z-order` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-z-order).
 */
@property (nonatomic, assign) MGLSymbolZOrder symbolZOrder;

/**
 If true, the symbol style annotation's text will be visible even if it collides with 
 other previously drawn symbol style annotations. Requires `text`. Defaults to `NO`.
 
 This property corresponds to the `text-allow-overlap` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-allow-overlap).
 */
@property (nonatomic, assign) BOOL textAllowsOverlap;

/**
 Text leading value for multi-line text, measured in [ems](https://en.wikipedia.org/wiki/Em_(typography)).
 Requires `text`. Defaults to a `CGFloat` that evaluates to `1.2`.
 
 This property corresponds to the `text-line-height` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-line-height).
 */
@property (nonatomic, assign) CGFloat textLineHeight;

/**
 If true, symbol style annotation icons will display without their corresponding text if the text 
 collides with other symbols and the icon does not. 
 Requires `iconImageName` and `text`. Defaults to `NO`.
 
 This property corresponds to the `text-optional` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-optional).
 */
@property (nonatomic, assign) BOOL textOptional;

/**
 The size of the additional area around the text bounding box used for detecting symbol collisions,
 measured in screen points greater than or equal to zero. 
 Requires `text`. Defaults to a `CGFloat` that evaluates to `2`.
 
 This property corresponds to the `text-padding` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-padding).
 */
@property (nonatomic, assign) CGFloat textPadding;

/**
 The orientation of the symbol style annotation's text when map is pitched, 
 as defined by `MGLTextPitchAlignment`. Requires `text`. Defaults to `auto`.
 
 This property corresponds to the `text-pitch-alignment` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-pitch-alignment).
 */
@property (nonatomic, assign) MGLTextPitchAlignment textPitchAlignment;

/**
 Determines the rotation behavior of the individual glyphs forming the text, in combination with `symbolPlacement` 
 and defined by `MGLTextRotationAlignment`. Requires `text`. Defaults to `auto`.
 
 This property corresponds to the `text-rotation-alignment` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-rotation-alignment).
 */
@property (nonatomic, assign) MGLTextRotationAlignment textRotationAlignment;

/**
 Determines the best placement for the text of multiple symbol style annotations given an array of 
 preferred `MGLTextAnchor` values. This allows the renderer to auto-select a unique `textAnchor` 
 for each symbol style annotation. Requires `symbolPlacement` to be set to `point`. 
 Disabled by `textOffset` and `textAnchor`. Not set by default.
 
 This property corresponds to the `text-variable-anchor` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-variable-anchor).
 */
@property (nonatomic, assign) NSArray<NSString *> *textVariableAnchor;

/**
 The distance that the icon anchor of the symbol style annotation is moved from its original placement,
 measured in screen points. Requires `iconImageName`.  Defaults to a `CGVector` struct set
 to 0 points rightward and 0 points downward.
 
 This property corresponds to the `icon-translate` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-translate).
 */
@property (nonatomic, assign) CGVector iconTranslation;

/**
 Controls the frame of reference for `iconTranslation`, as defined by `MGLIconTranslationAnchor`.
 Requires `iconImageName`. Defaults to `map`.
 
 This property corresponds to the `icon-translate-anchor` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-translate-anchor).
 */
@property (nonatomic, assign) MGLIconTranslationAnchor iconTranslationAnchor;

/**
 The distance that the text anchor of the symbol style annotation is moved from its original placement,
 measured in screen points. Requires `text`.  Defaults to a `CGVector` struct set
 to 0 points rightward and 0 points downward.
 
 This property corresponds to the `text-translate` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-translate).
 */
@property (nonatomic, assign) CGVector textTranslation;

/**
 Controls the frame of reference for `textTranslation`, as defined by `MGLTextTranslationAnchor`.
 Requires `text`. Defaults to `map`.
 
 This property corresponds to the `text-translate-anchor` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-translate-anchor).
 */
@property (nonatomic, assign) MGLTextTranslationAnchor textTranslationAnchor;


@end

NS_ASSUME_NONNULL_END
