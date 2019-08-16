import UIKit
import MapboxAnnotationExtension

class LineSettingsView: StyleAnnotationSettingsView {   
    
    var line: MGLLineStyleAnnotation!
    var observations = [NSKeyValueObservation]()
    @objc var colorSetting: ColorSettingView!
    @objc var widthSetting: StepperSettingView!
    @objc var opacitySetting: SliderSettingView!
    @objc var lineJoinSetting: SegmentedControlSettingView!
    @objc var lineGapWidthSetting: StepperSettingView!
    
    let lineJoinSettings = [
        (name: "Bevel", value: MGLLineJoin.bevel),
        (name: "Round", value: MGLLineJoin.round),
        (name: "Miter", value: MGLLineJoin.miter)
    ]
    
    var currentLineJoinIndex: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(lineStyleAnnotation: MGLLineStyleAnnotation) {
        super.init(frame: CGRect.zero)
        self.line = lineStyleAnnotation        
        setup()
        observeLineSettings()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {        
        axis = .vertical
        distribution = .fillEqually
        spacing = 10.0
        translatesAutoresizingMaskIntoConstraints = false
        
        let lineJoinTypes = lineJoinSettings.map { $0.name }
        let lineJoinValues = lineJoinSettings.map { $0.value }
        currentLineJoinIndex = lineJoinValues.firstIndex(of: line.lineJoin)!
        
        colorSetting = ColorSettingView(title: "Line color", initialColor: line.lineColor)
        widthSetting = StepperSettingView(title: "Line width", range: 1.0...10.0, stepValue: 0.5, initialValue: Double(line.lineWidth))
        opacitySetting = SliderSettingView(title: "Line opacity", range: 0.0...1.00, initialValue: Double(line.lineOpacity))
        opacitySetting.delegate = self        
        lineJoinSetting = SegmentedControlSettingView(title: "Line join", segmentItems: lineJoinTypes, selectedIndex: NSNumber(value: currentLineJoinIndex))
        lineGapWidthSetting = StepperSettingView(title: "Line gap width", range: 0.0...10.0, stepValue: 0.5, initialValue: Double(line.lineGapWidth))
        
        addArrangedSubview(colorSetting)
        addArrangedSubview(widthSetting)
        addArrangedSubview(opacitySetting)
        addArrangedSubview(lineJoinSetting)
        addArrangedSubview(lineGapWidthSetting)
        
        let stackHeight = CGFloat(arrangedSubviews.count * 80)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: stackHeight)
        ])
    }
    
    func observeLineSettings() {
        self.observations = [
            observe( \.colorSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newLineColor = change.newValue as? UIColor {
                    self.line.lineColor = newLineColor
                }
            },
            observe( \.widthSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newLineWidth = change.newValue as? Double {
                    self.line.lineWidth = CGFloat(newLineWidth)
                }
            },
            observe( \.opacitySetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newLineOpacity = change.newValue as? Double {
                    self.line.lineOpacity = CGFloat(newLineOpacity)
                }
            },
            observe( \.lineJoinSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let index = change.newValue as? Int {
                    self.line.lineJoin = self.lineJoinSettings[index].value
                }
            },
            observe( \.lineGapWidthSetting?.currentValue, options: [.old, .new] ) { object, change in
                if let newLineGap = change.newValue as? Double {
                    self.line.lineGapWidth = CGFloat(newLineGap)
                }
            },
        ]
    }
}

extension LineSettingsView: SliderSettingDelegate {
    func didUpdateSliderValue(value: Double) {
        colorSetting.setAlpha(value)
    }
}

