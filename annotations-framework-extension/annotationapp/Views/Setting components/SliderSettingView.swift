import UIKit

class SliderSettingView: UIStackView {
    @objc dynamic var currentValue: Double
    var title: String
    var sliderRange: ClosedRange<Double>
    
    var titleLabel = UILabel()
    var valueLabel = UILabel()
    var sliderView = UISlider()
    
    var delegate: SliderSettingDelegate?
    
    required init(title: String, range: ClosedRange<Double>, initialValue: Double) {
        self.title = title
        self.currentValue = initialValue
        self.sliderRange = range
        
        super.init(frame: CGRect.zero)
        
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .center
        titleLabel = setupLabel(for: title)
        valueLabel = setupValueLabel(initialValue: self.currentValue)
        sliderView = setupSliderWith(range: self.sliderRange, initialValue: self.currentValue)

        setupBackgroundView(with: UIColor.gray.withAlphaComponent(0.1))
        addArrangedSubview(titleLabel)
        addArrangedSubview(sliderView)
        
        NSLayoutConstraint.activate([
            sliderView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
        ])
    }
    
    func setupLabel(for title: String) -> UILabel {
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }
    
    func setupValueLabel(initialValue: Double) -> UILabel {
        valueLabel.text = String(format: "%.2f", currentValue)
        valueLabel.font = UIFont.systemFont(ofSize: 18)
        valueLabel.numberOfLines = 1
        
        return valueLabel
    }
    
    func setupSliderWith(range: ClosedRange<Double>, initialValue: Double) -> UISlider {
        sliderView.minimumValue = Float(range.lowerBound)
        sliderView.maximumValue = Float(range.upperBound)
        sliderView.value = Float(initialValue)
        sliderView.addTarget(self, action: #selector(updateSliderValue), for: .valueChanged)
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        
        return sliderView
    }
    
    @objc func updateSliderValue(_ sender: UISlider) {
        currentValue = Double(sender.value)
        valueLabel.text = String(format: "%.2f", currentValue)
        self.delegate?.didUpdateSliderValue(value: currentValue)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol SliderSettingDelegate {
    func didUpdateSliderValue(value: Double)
}
