#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLSymbolStyleAnnotation` is a type of style layer annotation that renders both an icon
 and text label at a specified coordinate.
 
 To display a symbol style annotation on a map, use one of the initializers below to create a symbol
 style annotation object. Then, use `-[MGLSymbolAnnotationController add:]` to add the annotation
 to a symbol style annotation controller.
 
 If rendering an icon, first add an image to the map style's sprite using
 the `-[MGLStyle setImage:forName:]` method within the [Mapbox Maps SDK for iOS](https://docs.mapbox.com/ios/api/maps/).
  
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
@interface MGLSymbolStyleAnnotation : MGLStyleAnnotation

/**
 Returns a new symbol style annotation anchored at a specified coordinate.
 
 @param coordinate The coordinate at which the symbol style annotation's anchor should be placed.
 @return An initialized symbol style annotation anchored at the specified coordinate.
 */
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

/**
 Returns a new symbol style annotation anchored at a specified coordinate with a defined text color.
 
 @param coordinate The coordinate at which the symbol style annotation's anchor should be placed.
 @param color The `textColor` of the symbol style annotation's `text`.
 @return An initialized symbol style annotation anchored at the specified coordinate with a 
    text field and a defined text color.
 */
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate text:(NSString *)text color:(UIColor *)color;

/**
 Returns a new symbol style annotation anchored at a specified coordinate with a defined icon image.
 
 To add an image to the map style's sprite, use the `-[MGLStyle setImage:forName:]` method 
 within the [Mapbox Maps SDK for iOS](https://docs.mapbox.com/ios/api/maps/).
 
 @param coordinate The coordinate at which the symbol style annotation's anchor should be placed.
 @param iconImageName The name of the image within the `MGLMapStyle`'s 
    [sprite](https://docs.mapbox.com/help/glossary/sprite/) to use for rendering the icon image of 
    the symbol style annotation.
 @return An initialized symbol style annotation anchored at the specified coordinate with a 
 defined icon image.
 */
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate iconImageName:(NSString *)iconImageName;


# pragma mark Icon properties

/**
 The name of the image within an `MGLMapStyle`'s [sprite](https://docs.mapbox.com/help/glossary/sprite/) 
 to use for rendering the icon image of the symbol style annotation. Not set by default. 
 
 To add an image to the map style's sprite, use the `-[MGLStyle setImage:forName:]` method 
 within the [Mapbox Maps SDK for iOS](https://docs.mapbox.com/ios/api/maps/).
 
 This property corresponds to the `icon-image` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-image).
 */
@property (nonatomic, strong) NSString *iconImageName;

/**
 The color to render the icon image of the symbol style annotation. Requires `iconImageName`.
 Defaults to black.
 
 This property corresponds to the `icon-color` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-color).
 */
@property (nonatomic, strong) UIColor *iconColor;

/**
 The placement of the symbol style annotation's icon image relative to its anchor, 
 as specified by `MGLIconAnchor`. Requires `iconImageName`. Defaults to `center`.
 
 This property corresponds to the `icon-anchor` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-anchor).
 */
@property (nonatomic, assign) MGLIconAnchor iconAnchor;

/**
 The offset distance of the symbol style annotation's icon image from its anchor. 
 Positive values indicate right and down, while negative values indicate left and up.
 
 Each component is multiplied by the value of `iconSize` to obtain the final offset in screen points. 
 When combined with `iconRotation`, the offset will be as if the rotated direction was up.
 Requires `iconImageName`. Defaults to a `CGVector` struct set to 0 points rightward and 0
 points downward.
 
 This property corresponds to the `icon-offset` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-offset).
 */
@property (nonatomic, assign) CGVector iconOffset;

/**
 The opacity of the symbol style annotation's icon image. Requires `iconImageName`. Defaults to `1`.
 
 This property corresponds to the `icon-opacity` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-opacity).
 */
@property (nonatomic, assign) CGFloat iconOpacity;

/**
 The counterclockwise rotation angle of the symbol style annotation's icon image, measured in degrees. 
 Requires `iconImageName`. Defaults to `0`.
 
 This property corresponds to the `icon-rotate` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-rotate).
 */
@property (nonatomic, assign) CGFloat iconRotation;

/**
 The value of which to multiply the size of the original symbol style annotation icon size, 
 measured in screen points. 
 
 The new size of the image will be the original size multiplied by 
 the `iconScale` value. `1` is the original size; `3` triples the size of the image.
 Requires `iconImageName`. Defaults to `1`.
 
 This property corresponds to the `icon-size` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-size).
 */
@property (nonatomic, assign) CGFloat iconScale;

/**
 An optional value representing the size of the halo or "outline" around a symbol annotation's icon image,
 measured in screen points. Requires `iconImageName`. Defaults to `0`.
 
 This property corresponds to the `icon-halo-width` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-halo-width).
 */
@property (nonatomic, assign) CGFloat iconHaloWidth;

/**
 An optional value representing the fade out size of the halo or "outline" around a symbol annotation's icon image,
 measured in screen points. Requires `iconImageName`. Defaults to `0`.
 
 This property corresponds to the `icon-halo-blur` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-halo-blur).
 */
@property (nonatomic, assign) CGFloat iconHaloBlur;

/**
 An optional value representing the color of the halo or "outline" around a symbol annotation's icon image.
 Requires `iconImageName`. Defaults to a clear color.
 
 This property corresponds to the `icon-halo-blur` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-halo-color).
 */
@property (nonatomic, strong) UIColor *iconHaloColor;


# pragma mark Text properties

/**
 An optional array of font face names used to display the text of the symbol style annotation. Requires `text`.
 
 Defaults to an array containing the strings `Open Sans Regular` and `Arial Unicode MS Regular`.
 Fonts installed on the device's system are not used. You can register a custom font with your style 
 when designing styles in [Mapbox Studio](https://docs.mapbox.com/studio-manual/reference/styles/#symbol-layer).
 
 This property corresponds to the `text-font` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-font).
 */
@property (nonatomic, strong) NSArray<NSString *> *fontNames;

/**
 The text to display for a symbol style annotation. Defaults to `""`.
 
 This property corresponds to the `text-field` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-field).
 */
@property (nonatomic, strong) NSString *text;

/**
 The color of the text used by the symbol style annotation. Requires `text`. Defaults to black.
 
 This property corresponds to the `text-color` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-color).
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 The font size of the text used by the symbol style annotation, measured in screen points. 
 Requires `text`. Defaults to `16`.
 
 This property corresponds to the `text-size` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-size).
 */
@property (nonatomic, assign) CGFloat textFontSize;

/**
 The opacity of the text used by the symbol style annotation, represented as a range of values 
 between `0` and `1`. Requires `text`. Defaults to `1`.
 
 This property corresponds to the `text-opacity` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-opacity).
 */
@property (nonatomic, assign) CGFloat textOpacity;

/**
 The type of text transformation that should be used by the text of the symbol style annotation,
 as specified by `MGLTextTransform`. Requires `text`. Defaults to `none`.
 
 This property corresponds to the `text-transform` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-transform).
 */
@property (nonatomic, assign) MGLTextTransform textTransform;

/**
 The text justification or "alignment" of the symbol style annotation's text, as 
 specified by `MGLTextJustification`. Requires `text`. Defaults to `center`.
 
 This property corresponds to the `text-justify` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-justify).
 */
@property (nonatomic, assign) MGLTextJustification textJustification;

/**
 The placement of the symbol style annotation's text relative to its anchor, as specified
 by `MGLTextAnchor`. Requires `text`. Defaults to `center`.
 
 This property corresponds to the `text-anchor` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-anchor).
 */
@property (nonatomic, assign) MGLTextAnchor textAnchor;

/**
 The tracking amount of the symbol style annotation's text, measured in [ems](https://en.wikipedia.org/wiki/Em_(typography)).
 Requires `text`. Defaults to `0`.
 
 This property corresponds to the `text-letter-spacing` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-letter-spacing).
 */
@property (nonatomic, assign) CGFloat textLetterSpacing;

/**
 The counterclockwise rotation angle of the symbol style annotation's text, measured in degrees. 
 Requires `text`. Defaults to `0`.
 
 This property corresponds to the `text-rotate` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-rotate).
 */
@property (nonatomic, assign) CGFloat textRotation;

/**
 The distance that the text of the symbol style annotation is moved from its original placement.
 
 Positive values indicate right and down, while negative values indicate left and up. 
 Requires `text`. Defaults to a `CGVector` struct set to 0 points rightward and 0
 points downward.
 
 This property corresponds to the `text-translate` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-translate).
 */
@property (nonatomic, assign) CGVector textTranslation;

/**
 The offset distance of the text belonging to a symbol style annotation from its anchor, measured in [ems](https://en.wikipedia.org/wiki/Em_(typography)). 
 
 Positive values indicate right and down, while negative values indicate left and up. 
 Requires `text`. Defaults to a `CGVector` struct set to 0 points rightward and 0
 points downward. Disabled by `textRadialOffset`.
 This property corresponds to the `text-offset` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-offset).
 */
@property (nonatomic, assign) CGVector textOffset;

/**
 The radial offset of the text belonging to a symbol style annotation in the direction of the 
 symbol's anchor, measured in [ems](https://en.wikipedia.org/wiki/Em_(typography)).
 Requires `text`. Defaults to `0`. Disabled by `textOffset`.
 
 This property corresponds to the `text-offset` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-offset).
 */
@property (nonatomic, assign) CGFloat textRadialOffset;

/**
 An optional value representing the fade out size of the halo or "outline" around a symbol style 
 annotation's text, measured in screen points. Requires `text`. Defaults to `0`.
 
 This property corresponds to the `text-halo-blur` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-halo-blur).
 */
@property (nonatomic, assign) CGFloat textHaloBlur;

/**
 An optional value representing the color of the halo or "outline" around a symbol style 
 annotation's text. Requires `text`. Defaults to a clear color.
 
 This property corresponds to the `text-halo-blur` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-halo-color).
 */
@property (nonatomic, strong) UIColor *textHaloColor;

/**
 An optional value representing the size of the halo or "outline" around a symbol style 
 annotation's text, measured in screen points. Requires `text`. Defaults to `0`.
 
 This property corresponds to the `text-halo-width` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-halo-width).
 */
@property (nonatomic, assign) CGFloat textHaloWidth;


# pragma mark Other symbol properties

/**
 The maximum line width before text wraps to a new line, measured in [ems](https://en.wikipedia.org/wiki/Em_(typography)).
 Requires `text`. Defaults to `10`.
 
 This property corresponds to the `text-max-width` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-max-width).
 */
@property (nonatomic, assign) CGFloat maximumTextWidth;

/**
 An optional value representing the ascending order at which symbol style annotations should be 
 placed. 
 
 Features with a higher sort key will appear above features with a lower sort key when 
 they overlap. Features with a lower sort key will have priority over other features when 
 doing placement.
 
 This property corresponds to the `symbol-sort-key` property in the style [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-sort-key).
 */
@property (nonatomic, assign) NSInteger symbolSortKey;

@end

NS_ASSUME_NONNULL_END
