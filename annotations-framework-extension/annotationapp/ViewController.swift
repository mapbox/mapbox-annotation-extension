import UIKit
import Mapbox
import MapboxAnnotationsExtension

class ViewController: UIViewController {
    var mapView: MGLMapView!
    var circleAnnotationController: MGLCircleAnnotationController!
    
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
        circleAnnotationController = MGLCircleAnnotationController(mapView: self.mapView)
        let circleAnnotation1 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), radius: 3.0, color: .blue)
        circleAnnotation1.title = "circleAnnotation1";
        
        let circleAnnotation2 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.30, longitude: 18.05), radius: 4.0, color: .yellow)
        circleAnnotation2.title = "circleAnnotation2";
        
        let circleAnnotation3 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.29, longitude: 18.04), radius: 5.0, color: .red)
        circleAnnotation3.title = "circleAnnotation3";
        
        let circleAnnotation4 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.28, longitude: 18.03), radius: 6.0, color: .orange)
        circleAnnotation4.title = "circleAnnotation4";
        
        let circleAnnotation5 = MGLCircleStyleAnnotation(CLLocationCoordinate2D(latitude: 59.27, longitude: 18.02), radius: 7.0, color: .green)
        circleAnnotation5.title = "circleAnnotation5";
        
        circleAnnotationController.add([circleAnnotation1, circleAnnotation2, circleAnnotation3, circleAnnotation4, circleAnnotation5])
        circleAnnotationController.circleTranslationAnchor = .map;
        
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true;
    }
    
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return MGLAnnotationView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    }
    
}

