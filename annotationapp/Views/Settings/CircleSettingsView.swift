import UIKit
import MapboxAnnotationExtension

class CircleSettingsView: StyleAnnotationSettingsView {
    
    var circle: MGLCircleStyleAnnotation!
    var observations = [NSKeyValueObservation]()
    @objc var radiusSetting: StepperSettingView!
    @objc var colorSetting: ColorSettingView!
    @objc var opacitySetting: SliderSettingView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(circleStyleAnnotation: MGLCircleStyleAnnotation) {
        super.init(frame: CGRect.zero)
        self.circle = circleStyleAnnotation        
        setup()
        observeCircleSettings()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {  
        axis = .vertical
        distribution = .fillEqually
        spacing = 10.0
        translatesAutoresizingMaskIntoConstraints = false

        radiusSetting = StepperSettingView(title: "Radius", range: 0.0...30.0, stepValue: 1.0, initialValue: Double(circle.circleRadius))
        colorSetting = ColorSettingView(title: "Color", initialColor: circle.circleColor)
        opacitySetting = SliderSettingView(title: "Opacity", range: 0.0...1.0, initialValue: Double(circle.circleOpacity))
        opacitySetting.delegate = self
        
        addArrangedSubview(radiusSetting)
        addArrangedSubview(colorSetting)
        addArrangedSubview(opacitySetting)
        
        let stackHeight = CGFloat(arrangedSubviews.count * 80)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: stackHeight)
        ])
    }
    
    func observeCircleSettings() {
        self.observations = [
            observe( \.radiusSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newCircleRadius = change.newValue as? Double {
                    self.circle.circleRadius = CGFloat(newCircleRadius)
                }
            },
            observe( \.colorSetting?.currentValue, options: [.old, .new] ) { object, change in
                 if let newCircleColor = change.newValue as? UIColor {
                    self.circle.circleColor = newCircleColor
                }
            },
            observe( \.opacitySetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newCircleOpacity = change.newValue as? Double {
                    self.circle.circleOpacity = CGFloat(newCircleOpacity)
                }
            }
        ]
    }
}

extension CircleSettingsView: SliderSettingDelegate {
    func didUpdateSliderValue(value: Double) {
        colorSetting.setAlpha(value)
    }
}


