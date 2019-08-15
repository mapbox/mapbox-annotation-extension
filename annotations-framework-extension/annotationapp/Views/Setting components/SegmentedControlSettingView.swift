import UIKit

class SegmentedControlSettingView: UIStackView {
    @objc dynamic var currentValue: NSNumber?
    var title: String
    var segmentItems = [String]()
    
    var titleLabel = UILabel()
    var segmentedControl = UISegmentedControl()
    
    required init(title: String, segmentItems: [String], selectedIndex: NSNumber?) {
        self.title = title
        self.segmentItems = segmentItems
        self.currentValue = selectedIndex
        
        super.init(frame: CGRect.zero)
        
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .center
        
        titleLabel = setupLabel(for: title)
        segmentedControl = setupSegmentedControlWith(items: segmentItems, initialIndex: selectedIndex)
        
        setupBackgroundView(with: UIColor.gray.withAlphaComponent(0.1))
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6)
        ])
    }
    
    func setupLabel(for title: String) -> UILabel {
        titleLabel.text = self.title.description
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }
    
    func setupSegmentedControlWith(items: [String], initialIndex: NSNumber?) -> UISegmentedControl {
        segmentedControl = UISegmentedControl(items: items)
        
        if let selectedIndex = initialIndex {
            segmentedControl.selectedSegmentIndex = selectedIndex.intValue
        }
        
        segmentedControl.addTarget(self, action: #selector(updateValue), for: .valueChanged)
        
        return segmentedControl
    }
    
    @objc func updateValue(_ sender: UISegmentedControl) {
        currentValue = NSNumber(value: sender.selectedSegmentIndex)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


