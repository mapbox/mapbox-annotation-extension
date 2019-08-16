import UIKit
import MapboxAnnotationExtension

class SymbolSettingsView: StyleAnnotationSettingsView { 
    
    var symbol: MGLSymbolStyleAnnotation!
    var observations = [NSKeyValueObservation]()
    @objc var fontSizeSetting: SegmentedControlSettingView!
    @objc var fontColorSetting: ColorSettingView!
    @objc var iconImageSetting: SegmentedControlSettingView!
    @objc var iconColorSetting: ColorSettingView!
    @objc var textOffsetXSetting: StepperSettingView!
    @objc var textOffsetYSetting: StepperSettingView!
    @objc var iconRotateSetting: SliderSettingView!
    
    var currentFontSizeIndex: Int!
    var currentIconImageIndex: Int!
    
    let fontSettings = [
        (sizeName: "Small", sizeValue: 18),
        (sizeName: "Medium", sizeValue: 36),
        (sizeName: "Large", sizeValue: 54)
    ]
    
    let iconSettings = [
        (name: "Star", imageName: "star-icon-image"),
        (name: "Camera", imageName: "camera-icon-image"),
        (name: "Flag", imageName: "flag-icon-image")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(symbolStyleAnnotation: MGLSymbolStyleAnnotation) {
        super.init(frame: CGRect.zero)
        self.symbol = symbolStyleAnnotation      
        setup()
        observeSymbolSettings()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 10.0
        translatesAutoresizingMaskIntoConstraints = false
        
        let fontTitles = fontSettings.map { $0.sizeName }
        let fontValues = fontSettings.map { $0.sizeValue }
        currentFontSizeIndex = fontValues.firstIndex(of: Int(symbol.textFontSize))!
        
        let iconTitles = iconSettings.map { $0.name }
        let iconValues = iconSettings.map { $0.imageName }
        currentIconImageIndex = iconValues.firstIndex(of: symbol.iconImageName)!
        
        fontSizeSetting = SegmentedControlSettingView(title: "Font size", segmentItems: fontTitles, selectedIndex: NSNumber(value: currentFontSizeIndex))
        fontColorSetting = ColorSettingView(title: "Text color", initialColor: symbol.textColor)
        iconImageSetting = SegmentedControlSettingView(title: "Icon", segmentItems: iconTitles, selectedIndex: NSNumber(value: currentIconImageIndex))
        iconColorSetting = ColorSettingView(title: "Icon color", initialColor: symbol.iconColor)
        textOffsetXSetting = StepperSettingView(title: "Text offset - dx", range: -5.0...5.0, stepValue: 1.0, initialValue: Double(symbol.textOffset.dx))
        textOffsetYSetting = StepperSettingView(title: "Text offset - dy", range: -5.0...5.0, stepValue: 1.0, initialValue: Double(symbol.textOffset.dy))
        iconRotateSetting = SliderSettingView(title: "Icon rotation", range: 0.0...360.0, initialValue: Double(symbol.iconRotation))

        addArrangedSubview(fontSizeSetting)
        addArrangedSubview(fontColorSetting)
        addArrangedSubview(iconImageSetting)
        addArrangedSubview(iconColorSetting)
        addArrangedSubview(textOffsetXSetting)
        addArrangedSubview(textOffsetYSetting)
        addArrangedSubview(iconRotateSetting)
        
        let stackHeight = CGFloat(arrangedSubviews.count * 80)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: stackHeight)
        ])
    }
    
    func observeSymbolSettings() {
        self.observations = [
            observe( \.fontSizeSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newFontSize = change.newValue as? Int {
                    self.symbol.textFontSize = CGFloat(self.fontSettings[newFontSize].sizeValue)
                }
            },
            observe( \.fontColorSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newFontColor = change.newValue as? UIColor {
                    self.symbol.textColor = newFontColor
                }
            },
            observe( \.iconImageSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let index = change.newValue as? Int {
                    self.symbol.iconImageName = self.iconSettings[index].imageName
                }
            },
            observe( \.iconColorSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newIconColor = change.newValue as? UIColor {
                    self.symbol.iconColor = newIconColor
                }
            },
            observe( \.textOffsetXSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newOffsetX = change.newValue as? Double {
                    self.symbol.textOffset = CGVector(dx: self.symbol.textOffset.dx, dy: CGFloat(newOffsetX))
                }
            },
            observe( \.textOffsetYSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newOffsetY = change.newValue as? Double {
                    self.symbol.textOffset = CGVector(dx: CGFloat(newOffsetY), dy: self.symbol.textOffset.dy)
                }
            },
            observe( \.iconRotateSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newRotationValue = change.newValue as? Double {
                    self.symbol.iconRotation = CGFloat(newRotationValue)
                }
            }
        ]
    }
}

