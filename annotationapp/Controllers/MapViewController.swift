import UIKit
import Mapbox
import MapboxAnnotationExtension

class MapViewController: UIViewController, MGLMapViewDelegate, MGLAnnotationControllerDelegate {

    var mapView: MGLMapView!
    
    var circleAnnotationController: MGLCircleAnnotationController!
    var circleAnnotation: MGLCircleStyleAnnotation!
    
    var symbolAnnotationController: MGLSymbolAnnotationController!
    var symbolAnnotation: MGLSymbolStyleAnnotation!
    
    var lineAnnotationController: MGLLineAnnotationController!
    var lineAnnotation: MGLLineStyleAnnotation!
    
    var polygonAnnotationController: MGLPolygonAnnotationController!
    var polygonAnnotation: MGLPolygonStyleAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MGLMapView(frame: view.bounds, styleURL: URL(string: "mapbox://styles/nbb12805/ck0ztjl5h0c8p1co6u1hs9xm9"))
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 25.794945475649673, longitude: -80.1837158203125), zoomLevel: 3, animated: false)
        mapView.delegate = self
        view.addSubview(mapView)
    }

    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
//        let churchImage = UIImage(named: "church-30")!
//        mapView.style?.setImage(churchImage, forName: "church-icon")
//        let symbolController = MGLSymbolAnnotationController(mapView: mapView)
//        let church = MGLSymbolStyleAnnotation(coordinate: CLLocationCoordinate2D(latitude: 43.4474, longitude: -2.7848))
//        church.text = "San Juan de Gaztelugatxe"
//        church.iconImageName = "church-icon"
//        church.textOffset = CGVector(dx: 0.0, dy: -2.5)
//        symbolController.addStyleAnnotation(church)
    }

    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        let bermudaTriangle = [
          CLLocationCoordinate2D(latitude: 32.29932184334422, longitude: -64.78191375732422),
          CLLocationCoordinate2D(latitude: 25.794945475649673, longitude: -80.1837158203125),
          CLLocationCoordinate2D(latitude: 18.47211963599452, longitude: -66.12490653991699),
          CLLocationCoordinate2D(latitude: 32.29932184334422, longitude: -64.78191375732422)
        ]

        polygonAnnotationController = MGLPolygonAnnotationController(mapView: mapView)
        polygonAnnotationController.annotationsInteractionEnabled = true
        let polygon = MGLPolygonStyleAnnotation(coordinates: bermudaTriangle, count: UInt(bermudaTriangle.count))

        polygon.fillColor = UIColor(red: 0.51, green: 0.39, blue: 1.00, alpha: 0.3)
        
        polygon.title = "Bermuda Triangle"
        polygonAnnotationController.addStyleAnnotation(polygon)
        polygonAnnotationController.delegate = self
    }

    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return MGLAnnotationView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    }
}
