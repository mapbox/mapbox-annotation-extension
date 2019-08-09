import UIKit
import Mapbox
import MapboxAnnotationsExtension

class ViewController: UIViewController {
    var mapView: MGLMapView!
    var circleAnnotationController: MGLCircleAnnotationController!
    var lineAnnotationController: MGLLineAnnotationController!
    var polygonAnnotationController: MGLPolygonAnnotationController!
    var symbolAnnotationController: MGLSymbolAnnotationController!
    
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
        let circleAnnotation1 = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), radius: 3.0, color: .blue)
        circleAnnotation1.title = "circleAnnotation1";
        
        let circleAnnotation2 = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.30, longitude: 18.05), radius: 4.0, color: .yellow)
        circleAnnotation2.title = "circleAnnotation2";
        
        let circleAnnotation3 = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.29, longitude: 18.04), radius: 5.0, color: .red)
        circleAnnotation3.title = "circleAnnotation3";
        circleAnnotation3.isDraggable = true
        
        let circleAnnotation4 = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.28, longitude: 18.03), radius: 6.0, color: .orange)
        circleAnnotation4.title = "circleAnnotation4";
        
        let circleAnnotation5 = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.27, longitude: 18.02), radius: 7.0, color: .green)
        circleAnnotation5.title = "circleAnnotation5";
        circleAnnotation5.isDraggable = true
        
        circleAnnotationController.addStyleAnnotations([circleAnnotation1, circleAnnotation2, circleAnnotation3, circleAnnotation4, circleAnnotation5])
        circleAnnotationController.circleTranslationAnchor = .map;
        circleAnnotationController.delegate = self
        
        let coordinates = [
            CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06),
            CLLocationCoordinate2D(latitude: 59.30, longitude: 18.05)
        ]
        lineAnnotationController = MGLLineAnnotationController(mapView: mapView)
        lineAnnotationController.lineCap = .round
        let lineAnnotation1 = MGLLineStyleAnnotation(coordinates: coordinates, count: UInt(coordinates.count), color: .purple)
        lineAnnotation1.lineWidth = 5
        lineAnnotation1.isDraggable = true
        lineAnnotationController.addStyleAnnotations([lineAnnotation1])
        
        let attraction = UIImage(named: "attraction")
        
        if let styleImage = attraction {
            self.mapView.style?.setImage(styleImage, forName: "attraction")
        }

        symbolAnnotationController = MGLSymbolAnnotationController(mapView: self.mapView)
        
        let symbolAnnotation1 = MGLSymbolStyleAnnotation(coordinate: CLLocationCoordinate2DMake(59.29, 18.06));
        symbolAnnotation1.iconImageName = "attraction"
        symbolAnnotation1.iconScale = 0.5
        
        symbolAnnotation1.iconHaloColor = UIColor.white.withAlphaComponent(0.8)
        symbolAnnotation1.iconHaloWidth = 1
        
        symbolAnnotation1.text = "Come Here!"
        symbolAnnotation1.textColor = .blue
        symbolAnnotation1.textFontSize = 16
        symbolAnnotation1.textHaloColor = symbolAnnotation1.iconHaloColor
        symbolAnnotation1.textHaloWidth = symbolAnnotation1.iconHaloWidth
        symbolAnnotation1.textJustification = .left
        symbolAnnotation1.textAnchor = .left
        symbolAnnotation1.isDraggable = true
        
        symbolAnnotationController.textTranslation = CGVector(dx: 10, dy: 0)
        symbolAnnotationController.addStyleAnnotation(symbolAnnotation1)
        
        polygonAnnotationController = MGLPolygonAnnotationController(mapView: self.mapView)
        
        let polygonCoordinates = [
            CLLocationCoordinate2DMake(59.35, 18.06),
            CLLocationCoordinate2DMake(59.33, 18.04),
            CLLocationCoordinate2DMake(59.33, 18.09),
            CLLocationCoordinate2DMake(59.35, 18.06)
        ]
        
        let polygonAnnotation = MGLPolygonStyleAnnotation(coordinates: polygonCoordinates, count: UInt(polygonCoordinates.count))
        polygonAnnotation.title = "I'm a triangle!"
        polygonAnnotation.fillOutlineColor = .red
        polygonAnnotation.fillColor = .green
        polygonAnnotation.fillOpacity = 0.5
        polygonAnnotation.isDraggable = true
        
        let innerCoordinates = [
            CLLocationCoordinate2DMake(-5, -5),
            CLLocationCoordinate2DMake(-5, 5),
            CLLocationCoordinate2DMake(5, 5),
            CLLocationCoordinate2DMake(5, -5),
        ]
        let innerPolygon = MGLPolygonFeature(coordinates: innerCoordinates, count: UInt(innerCoordinates.count))
        
        let outerCoordinates = [
            CLLocationCoordinate2DMake(-10, -10),
            CLLocationCoordinate2DMake(-10, 10),
            CLLocationCoordinate2DMake(10, 10),
            CLLocationCoordinate2DMake(10, -10),
        ]
        let polygonAnnotation2 = MGLPolygonStyleAnnotation(coordinates: outerCoordinates, count: UInt(outerCoordinates.count), interiorPolygons: [innerPolygon])
        polygonAnnotation2.fillColor = UIColor.purple
        polygonAnnotation2.isDraggable = true
        
        polygonAnnotationController.addStyleAnnotations([polygonAnnotation, polygonAnnotation2])
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true;
    }
    
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return MGLAnnotationView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    }
    
}

extension ViewController: MGLAnnotationControllerDelegate {
    func annotationController(_ annotationController: MGLAnnotationController, didSelect styleAnnotation: MGLStyleAnnotation) {
        print("Selected:\(styleAnnotation)")
    }
    
    func annotationController(_ annotationController: MGLAnnotationController, didDeselect styleAnnotation: MGLStyleAnnotation) {
        print("Deselected:\(styleAnnotation)")
    }
}
