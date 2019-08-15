import UIKit

class ColorSettingView: UIStackView {
    @objc dynamic var currentValue: UIColor
    var title: String
    
    var titleLabel = UILabel()
    var colorView = UIView()
    
    required init(title: String, initialColor: UIColor?) {
        self.title = title
        
        if let initialColor = initialColor {
            self.currentValue = initialColor
        } else {
            self.currentValue = UIColor.clear
        }
        
        super.init(frame: CGRect.zero)
        
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .center
        titleLabel = setupLabel(for: title)
        colorView = setupColorView(color: currentValue)
        
        setupBackgroundView(with: UIColor.gray.withAlphaComponent(0.1))
        addArrangedSubview(titleLabel)
        addArrangedSubview(colorView)
        
        NSLayoutConstraint.activate([
            colorView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            colorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6)
        ])
    }
    
    func setupLabel(for title: String) -> UILabel {
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }
    
    func setupColorView(color: UIColor) -> UIView {
        colorView.layer.cornerRadius = 5.0
        colorView.backgroundColor = color
        
        if color == UIColor.clear {
            colorView.layer.borderWidth = 1.0
            colorView.layer.borderColor = UIColor.black.cgColor
        }
        
        if title.contains("Outline") {
            colorView.backgroundColor = UIColor.clear
            colorView.layer.borderWidth = 5.0
            colorView.layer.borderColor = color.cgColor
        }
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(updateColorPicker))
        colorView.addGestureRecognizer(singleTap)
        
        return colorView
    }
    
    func setAlpha(_ alpha: Double) {
        colorView.alpha = CGFloat(alpha)
    }
    
    @objc func updateColorPicker(_ sender: UIView) {
        let randomColor = getRandomColor()
        self.colorView.backgroundColor = randomColor
        self.currentValue = colorView.backgroundColor ?? UIColor.clear
        
        if currentValue != UIColor.clear {
            colorView.layer.borderWidth = 0.0
        }
        
        if title.contains("Outline") {
            colorView.backgroundColor = UIColor.clear
            colorView.layer.borderWidth = 5.0
            colorView.layer.borderColor = randomColor.cgColor
        }
    }
    
    func getRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let green:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blue:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
