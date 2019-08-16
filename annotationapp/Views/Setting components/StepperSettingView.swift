import UIKit

class StepperSettingView: UIStackView {
    @objc dynamic var currentValue: Double
    var title: String
    var rangeValue: ClosedRange<Double>
    var stepValue: Double
    
    var titleLabel = UILabel()
    var valueLabel = UILabel()
    var stepperView = UIStepper()
    
    required init(title: String, range: ClosedRange<Double>, stepValue: Double, initialValue: Double) {
        
        self.title = title
        self.rangeValue = range
        self.stepValue = stepValue
        self.currentValue = initialValue
        
        super.init(frame: CGRect.zero)
        
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .center
        titleLabel = setupLabel(for: title)
        valueLabel = setupValueLabel(value: self.currentValue)
        stepperView = setupStepperWith(range: self.rangeValue, stepValue: self.stepValue, initialValue: self.currentValue)
        
        setupBackgroundView(with: UIColor.gray.withAlphaComponent(0.1))
        addArrangedSubview(titleLabel)
        addArrangedSubview(valueLabel)
        addArrangedSubview(stepperView)
    }
    
    func setupLabel(for title: String) -> UILabel {
        titleLabel.text = title.description
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.numberOfLines = 1
        
        return titleLabel
    }
    
    func setupValueLabel(value: Double) -> UILabel {
        valueLabel.text = value.description
        valueLabel.font = UIFont.systemFont(ofSize: 18)
        valueLabel.numberOfLines = 1
        valueLabel.text = self.currentValue.description
        
        return valueLabel
    }
    
    func setupStepperWith(range: ClosedRange<Double>, stepValue: Double, initialValue: Double) -> UIStepper {
        stepperView.minimumValue = rangeValue.lowerBound
        stepperView.maximumValue = rangeValue.upperBound
        stepperView.stepValue = stepValue
        stepperView.value = currentValue
        stepperView.addTarget(self, action: #selector(updateStepperValue), for: .valueChanged)
        stepperView.translatesAutoresizingMaskIntoConstraints = false
        
        return stepperView
    }
    
    @objc func updateStepperValue(_ sender: UIStepper) {
        currentValue = sender.value
        valueLabel.text = currentValue.description
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

