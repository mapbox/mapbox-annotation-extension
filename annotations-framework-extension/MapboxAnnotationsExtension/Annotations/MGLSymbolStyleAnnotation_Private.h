#import "MGLSymbolStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MGLPropertyIconScale;
FOUNDATION_EXPORT NSString *const MGLPropertyIconImageName;
FOUNDATION_EXPORT NSString *const MGLPropertyIconRotation;
FOUNDATION_EXPORT NSString *const MGLPropertyIconOffset;
FOUNDATION_EXPORT NSString *const MGLPropertyIconAnchor;
FOUNDATION_EXPORT NSString *const MGLPropertyIconOpacity;
FOUNDATION_EXPORT NSString *const MGLPropertyIconColor;
FOUNDATION_EXPORT NSString *const MGLPropertyIconHaloColor;
FOUNDATION_EXPORT NSString *const MGLPropertyIconHaloWidth;
FOUNDATION_EXPORT NSString *const MGLPropertyIconHaloBlur;

FOUNDATION_EXPORT NSString *const MGLPropertyText;
FOUNDATION_EXPORT NSString *const MGLPropertyTextFontNames;
FOUNDATION_EXPORT NSString *const MGLPropertyTextFontSize;
FOUNDATION_EXPORT NSString *const MGLPropertyMaximumTextWidth;
FOUNDATION_EXPORT NSString *const MGLPropertyTextLetterSpacing;
FOUNDATION_EXPORT NSString *const MGLPropertyTextJustification;
FOUNDATION_EXPORT NSString *const MGLPropertyTextRadialOffset;
FOUNDATION_EXPORT NSString *const MGLPropertyTextAnchor;
FOUNDATION_EXPORT NSString *const MGLPropertyTextRotation;
FOUNDATION_EXPORT NSString *const MGLPropertyTextTransform;
FOUNDATION_EXPORT NSString *const MGLPropertyTextOffset;
FOUNDATION_EXPORT NSString *const MGLPropertyTextOpacity;
FOUNDATION_EXPORT NSString *const MGLPropertyTextColor;
FOUNDATION_EXPORT NSString *const MGLPropertyTextHaloColor;
FOUNDATION_EXPORT NSString *const MGLPropertyTextHaloWidth;
FOUNDATION_EXPORT NSString *const MGLPropertyTextHaloBlur;

FOUNDATION_EXPORT NSString *const MGLPropertySymbolSortKey;

@interface MGLSymbolStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END
