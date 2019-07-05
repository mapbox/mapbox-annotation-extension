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

@property (nonatomic, assign) BOOL iconAllowsOverlap;
@property (nonatomic, assign) BOOL iconIgnoresPlacement;
@property (nonatomic, assign) BOOL iconOptional;
@property (nonatomic, assign) CGFloat iconPadding;
@property (nonatomic, assign) MGLIconPitchAlignment iconPitchAlignment;
@property (nonatomic, assign) MGLIconRotationAlignment iconRotationAlignment;
@property (nonatomic, assign) MGLIconTextFit iconTextFit;
@property (nonatomic, assign) UIEdgeInsets  iconTextFitPadding;
@property (nonatomic, assign) BOOL keepsIconUpright;
@property (nonatomic, assign) BOOL keepsTextUpright;
@property (nonatomic, assign) CGFloat maximumTextAngle;
@property (nonatomic, assign) BOOL symbolAvoidsEdges;
@property (nonatomic, assign) MGLSymbolPlacement symbolPlacement;
@property (nonatomic, assign) CGFloat symbolSpacing;
@property (nonatomic, assign) MGLSymbolZOrder symbolZOrder;
@property (nonatomic, assign) BOOL textAllowsOverlap;
@property (nonatomic, assign) CGFloat textLineHeight;
@property (nonatomic, assign) BOOL textOptional;
@property (nonatomic, assign) CGFloat textPadding;
@property (nonatomic, assign) MGLTextPitchAlignment textPitchAlignment;
@property (nonatomic, assign) MGLTextRotationAlignment textRotationAlignment;
@property (nonatomic, assign) NSArray<NSString *> *textVariableAnchor;
@property (nonatomic, assign) CGVector iconTranslation;
@property (nonatomic, assign) MGLIconTranslationAnchor iconTranslationAnchor;
@property (nonatomic, assign) CGVector textTranslation;
@property (nonatomic, assign) MGLTextTranslationAnchor textTranslationAnchor;


@end

NS_ASSUME_NONNULL_END
