#import <UIKit/UIKit.h>
#import "MGLStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGLSymbolStyleAnnotation : MGLStyleAnnotation

@property (nonatomic, assign) CGFloat iconAnchor;
@property (nonatomic, strong) NSString *iconImageName;
@property (nonatomic, assign) CGFloat iconOffset;
@property (nonatomic, assign) CGFloat iconRotation;
@property (nonatomic, assign) CGFloat iconScale;
@property (nonatomic, strong) UIColor *iconColor;
@property (nonatomic, assign) CGFloat iconHaloBlur;
@property (nonatomic, strong) UIColor *iconHaloColor;
@property (nonatomic, assign) CGFloat iconHaloWidth;
@property (nonatomic, assign) CGFloat iconOpacity;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) MGLTextAnchor textAnchor;
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

- (instancetype)init:(CLLocationCoordinate2D)coordinate;
- (instancetype)init:(CLLocationCoordinate2D)coordinate text:(NSString *)text color:(UIColor *)color;
- (instancetype)init:(CLLocationCoordinate2D)coordinate iconImageName:(NSString *)iconImageName;

@end

NS_ASSUME_NONNULL_END
