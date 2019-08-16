import UIKit

class SwitchControlSettingView: UIStackView {
    @objc dynamic var value: Bool
    var title: String
    
    var titleLabel = UILabel()
    var switchControl = UISwitch()
    
    init(frame: CGRect, title: String , value: Bool) {
        self.title = title
        self.value = value
        
        super.init(frame: frame)
        
        self.axis = .horizontal
        self.distribution = .equalSpacing
        self.alignment = .center
        
        self.titleLabel = self.setupTitleLabel(title: self.title)
        self.switchControl = setupSwitchControlWithBool(false)
        
        setupConstraints()
    }
    
    func setupTitleLabel(title: String) -> UILabel {
        titleLabel.text = self.title.description
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }
    
    func setupSwitchControlWithBool(_ value: Bool) -> UISwitch {
        switchControl.isOn = value
        switchControl.addTarget(self, action: #selector(updateValue), for: .valueChanged)
        
        return switchControl
    }
    
    @objc func updateValue(_ sender: UISwitch) {
        self.value = sender.isOn
    }
    
    func setupConstraints() {        
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(switchControl)
        
        titleLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



