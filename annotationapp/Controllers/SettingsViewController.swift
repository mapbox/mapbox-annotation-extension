import UIKit
import Mapbox
import MapboxAnnotationExtension

class SettingsViewController: UIViewController {

    var styleAnnotation: MGLStyleAnnotation!
    var settingsView: UIStackView!
    var delegate: AnnotationStyleSettingsDelegate?
    
    init(for styleAnnotation: MGLStyleAnnotation) {
        self.styleAnnotation = styleAnnotation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    
        let annotationSettings = self.generateViewsForSettings(with: self.styleAnnotation)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containerView)
        
        let titleLabel = setupSettingsMenuTitle(with: annotationSettings.menuTitle)
        containerView.addSubview(titleLabel)
        
        let scollView = UIScrollView()
        scollView.translatesAutoresizingMaskIntoConstraints = false
        scollView.isScrollEnabled = true
        scollView.bounces = false
        scollView.indicatorStyle = .white
        containerView.addSubview(scollView)
        
        settingsView = annotationSettings.menu
        scollView.addSubview(settingsView)
        
        activateConstraints(for: containerView, titleLabel, scollView, settingsView)
    }

    
    func generateViewsForSettings(with annotation: MGLStyleAnnotation) -> (menuTitle: String, menu: UIStackView) {
        var title: String!
        var settingsView: UIStackView!
        
        if annotation is MGLCircleStyleAnnotation {
            title = "Edit circle"
            settingsView = CircleSettingsView(circleStyleAnnotation: annotation as! MGLCircleStyleAnnotation)
        }
        
        if annotation is MGLSymbolStyleAnnotation {
            title = "Edit symbol"
            settingsView = SymbolSettingsView(symbolStyleAnnotation: annotation as! MGLSymbolStyleAnnotation)
        }
        
        if annotation is MGLLineStyleAnnotation {
            title = "Edit line"
            settingsView = LineSettingsView(lineStyleAnnotation: annotation as! MGLLineStyleAnnotation)
        }
        
        if annotation is MGLPolygonStyleAnnotation {
            title = "Edit polygon"
            settingsView = PolygonSettingsView(polygonStyleAnnotation: annotation as! MGLPolygonStyleAnnotation)
        }
        
        return (menuTitle: title, menu: settingsView)
    }
    
    func setupSettingsMenuTitle(with title: String) -> UILabel { 
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func activateConstraints(for containerView: UIView, _ titleLabel: UILabel, _ scrollView: UIScrollView, _ settingsView: UIStackView) {
        
        // Container holding title and settings views
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0),
            containerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10.0),
            containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10.0)
        ])
        
        // Title constraints
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15.0),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15.0),
        ])
        
        // Scroll view which will hold setting components
        NSLayoutConstraint.activate([
            scrollView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15.0),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
        
        // Setting components vertical stack view
        NSLayoutConstraint.activate([
            settingsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            settingsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            settingsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            settingsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60.0),
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let circleSettings = settingsView as? CircleSettingsView {
            self.delegate?.didUpdateStyleAnnotation(with: circleSettings.circle)
        }
        
        if let symbolSettingssView = settingsView as? SymbolSettingsView {
            self.delegate?.didUpdateStyleAnnotation(with: symbolSettingssView.symbol)
        }
        
        if let lineSettingsView = settingsView as? LineSettingsView  {
            self.delegate?.didUpdateStyleAnnotation(with: lineSettingsView.line)
        }
        
        if let polygonSettingsView = settingsView as? PolygonSettingsView  {
            self.delegate?.didUpdateStyleAnnotation(with: polygonSettingsView.polygon)
        }
    }
}

