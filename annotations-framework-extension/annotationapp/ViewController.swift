import UIKit
import Mapbox
import MapboxAnnotationsExtension

class ViewController: UIViewController {
    var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.streetsStyleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        mapView.delegate = self
        
        view.addSubview(mapView)
    }

}

extension ViewController : MGLMapViewDelegate {
    
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        let circleAnnotationController = MGLCircleAnnotationController(mapView: mapView)
        let circleAnnotation = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), radius: 3.0, color: .blue)
        let circleAnnotation2 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.30, longitude: 18.05), radius: 4.0, color: .yellow)
        let circleAnnotation3 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.29, longitude: 18.04), radius: 5.0, color: .red)
        let circleAnnotation4 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.28, longitude: 18.03), radius: 6.0, color: .orange)
        let circleAnnotation5 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.27, longitude: 18.02), radius: 7.0, color: .green)
        circleAnnotationController.add([circleAnnotation, circleAnnotation2, circleAnnotation3, circleAnnotation4, circleAnnotation5])
        circleAnnotationController.circleTranslationAnchor = .map;
        
    }
    
}

