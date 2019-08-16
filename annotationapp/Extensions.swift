import UIKit

public extension UIStackView {
    func setupBackgroundView(with color: UIColor) {
        let backgroundView = UIView()
        backgroundView.backgroundColor = color
        backgroundView.layer.cornerRadius = 8.0
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(backgroundView, at: 0)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15.0),
            trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15.0),
            topAnchor.constraint(equalTo: backgroundView.topAnchor),
            bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
    }
}
