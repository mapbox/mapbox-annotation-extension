#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 An `MGLSymbolStyleAnnotation` is an `MGLSymbolStyleLayer` annotation that
 renders icon and text labels at points or along lines on the map.
 
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
@interface MGLSymbolStyleAnnotation : MGLStyleAnnotation

@property (nonatomic, assign) MGLIconAnchor iconAnchor;
@property (nonatomic, strong) NSString *iconImageName;
@property (nonatomic, assign) CGVector iconOffset;
@property (nonatomic, assign) CGFloat iconRotation;
@property (nonatomic, assign) CGFloat iconScale;
@property (nonatomic, strong) UIColor *iconColor;
@property (nonatomic, assign) CGFloat iconHaloBlur;
@property (nonatomic, strong) UIColor *iconHaloColor;
@property (nonatomic, assign) CGFloat iconHaloWidth;
@property (nonatomic, assign) CGFloat iconOpacity;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) MGLTextAnchor textAnchor;
@property (nonatomic, assign) CGVector textTranslation;
@property (nonatomic, strong) NSArray<NSString *> *fontNames;
@property (nonatomic, assign) CGFloat textFontSize;
@property (nonatomic, assign) MGLTextJustification textJustification;
@property (nonatomic, assign) CGFloat textLetterSpacing;
@property (nonatomic, assign) CGVector textOffset;
@property (nonatomic, assign) CGFloat textRadialOffset;
@property (nonatomic, assign) CGFloat textRotation;
@property (nonatomic, assign) MGLTextTransform textTransform;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) CGFloat textHaloBlur;
@property (nonatomic, strong) UIColor *textHaloColor;
@property (nonatomic, assign) CGFloat textHaloWidth;
@property (nonatomic, assign) CGFloat textOpacity;

@property (nonatomic, assign) CGFloat maximumTextWidth;
@property (nonatomic, assign) NSInteger symbolSortKey;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate text:(NSString *)text color:(UIColor *)color;
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate iconImageName:(NSString *)iconImageName;

@end

NS_ASSUME_NONNULL_END
