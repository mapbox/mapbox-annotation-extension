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
        let circleAnnotation = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 37.792300, longitude: -122.407374), radius: 2.0, color: UIColor.blue)
        circleAnnotationController.add(circleAnnotation)
        
    }
    
}

