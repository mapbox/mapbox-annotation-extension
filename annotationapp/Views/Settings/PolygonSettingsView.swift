import UIKit
import MapboxAnnotationExtension

class PolygonSettingsView: StyleAnnotationSettingsView {
    
    var polygon: MGLPolygonStyleAnnotation!
    var observations = [NSKeyValueObservation]()
    @objc var fillColorSetting: ColorSettingView!
    @objc var opacitySetting: SliderSettingView!
    @objc var outlineColorSetting: ColorSettingView!
    @objc var fillPatternSetting: SegmentedControlSettingView!
    
    let fillPatternOptions = [ "Squares", "Dots", "Stripes" ]

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(polygonStyleAnnotation: MGLPolygonStyleAnnotation) {
        super.init(frame: CGRect.zero)
        self.polygon = polygonStyleAnnotation        
        setup()
        observePolygonSettings()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {      
        axis = .vertical
        distribution = .fillEqually
        spacing = 10.0
        translatesAutoresizingMaskIntoConstraints = false
        
        var selectedSegmentIndex: NSNumber?
        
        if let currentFillPatternIndex = fillPatternOptions.firstIndex(of: polygon.fillPattern) {
            selectedSegmentIndex = NSNumber(value: currentFillPatternIndex)
        }
        
        fillColorSetting = ColorSettingView(title: "Fill color", initialColor: polygon.fillColor)
        opacitySetting = SliderSettingView(title: "Opacity", range: 0.0...1.0, initialValue: Double(polygon.fillOpacity))
        opacitySetting.delegate = self
        outlineColorSetting = ColorSettingView(title: "Outline color", initialColor: polygon.fillOutlineColor)
        fillPatternSetting = SegmentedControlSettingView(title: "Pattern", segmentItems: fillPatternOptions, selectedIndex: selectedSegmentIndex)
        
        addArrangedSubview(fillColorSetting)
        addArrangedSubview(opacitySetting)
        addArrangedSubview(outlineColorSetting)
        addArrangedSubview(fillPatternSetting)
        
        let stackHeight = CGFloat(arrangedSubviews.count * 80)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: stackHeight)
        ])
    }
    
    func observePolygonSettings() {
        self.observations = [
            observe( \.fillColorSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newFillColor = change.newValue as? UIColor {
                    self.polygon.fillColor = newFillColor
                }
            },
            observe( \.opacitySetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newFillOpacity = change.newValue as? Double {
                    self.polygon.fillOpacity = CGFloat(newFillOpacity)
                }
            },
            observe( \.outlineColorSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newFillOutlineColor = change.newValue as? UIColor {
                    self.polygon.fillOutlineColor = newFillOutlineColor
                }
            },
            observe( \.fillPatternSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let index = change.newValue as? Int {
                    self.polygon.fillPattern = self.fillPatternOptions[index]
                }
            }
        ]
    }
}

extension PolygonSettingsView: SliderSettingDelegate {
    func didUpdateSliderValue(value: Double) {
        fillColorSetting.setAlpha(value)
    }
}
