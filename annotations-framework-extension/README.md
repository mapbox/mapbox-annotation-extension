# Mapbox Annotation Framework Extension for iOS

The Mapbox Annotation Framework Extension is lightweight library you can use with the Mapbox Maps SDK to quickly add basic shapes to a map.

⚠️ This product is currently in active alpha development, and is not suitable for production usage. ⚠️

## Installation

### Using CocoaPods

To install using [CocoaPods](https://cocoapods.org/):

1. Create a [Podfile](https://guides.cocoapods.org/syntax/podfile.html) with the following specification:
   ```ruby
   pod 'MapboxAnnotationsExtension', '0.0.1-alpha.1'
   ```

1. Run `pod repo update && pod install` and open the resulting Xcode workspace.

### Using Carthage

Alternatively, to install using [Carthage](https://github.com/Carthage/Carthage/):

1. Create a [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#github-repositories) with the following dependency:
   ```cartfile
   github "mapbox/map-extensions-ios" ~> 0.0.1
   ```

1. Run `carthage update --platform iOS` to build just the iOS dependencies.

1. Follow the rest of [Carthage’s iOS integration instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos). Your application target’s Embedded Frameworks should include `MapboxAnnotationsExtension.framework`.

## Usage

The Mapbox Annotation Framework Extension supports the addition of circles, lines, polygons, and symbols. Each shape type has its own corresponding controller which manages the addition of multiple shape objects of the same type.

Since the map needs to be finished loading before adding shapes to it, all shapes should be added within the [`MGLMapView:didFinishLoadingStyle:`](https://docs.mapbox.com/ios/api/maps/) delegate method.

### Circles (`MGLCircleStyleAnnotation`)
_Circles represent a coordinate point on a map with an associated radius, measured in pixels._

```swift
func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
  let circleAnnotationController = MGLCircleAnnotationController(mapView: self.mapView)
  let circle = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), radius: 3.0, color: .blue)
  circle.opacity = 0.5
  circleAnnotationController.add(circle)
}
```

### Lines (`MGLLineStyleAnnotation`)
_Lines represent a connected series of coordinates._

```swift
func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
  let lineAnnotationController = MGLLineAnnotationController(mapView: self.mapView)
  
  let lineCoordinates = [
      CLLocationCoordinate2D(latitude: 59, longitude: 18),
      CLLocationCoordinate2D(latitude: 60, longitude: 20)
  ]
  
  let line = MGLLineStyleAnnotation(coordinates: lineCoordinates, count: UInt(lineCoordinates.count))
  line.color = .purple
  lineAnnotationController.add(line)
}
```

### Polygons (`MGLPolygonStyleAnnotation`)
_Polygons represent a connected series of coordinates, where the first and last coordinates are equal._

```swift
func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
  let polygonAnnotationController = MGLPolygonAnnotationController(mapView: self.mapView)
  
  let polygonCoordinates = [
    CLLocationCoordinate2DMake(59, 18),
    CLLocationCoordinate2DMake(62, 19),
    CLLocationCoordinate2DMake(54, 20),
    CLLocationCoordinate2DMake(59, 18)
  ]
  
  let polygon = MGLPolygonStyleAnnotation(coordinates: polygonCoordinates, count: UInt(polygonCoordinates.count))
  polygon.fillOutlineColor = .red
  polygonAnnotationController.add(line)
}
```

### Symbols (`MGLSymbolStyleAnnotation`)
_Symbols represent a coordinate point on a map with a label and an associated optional icon image. An image must be supplied to the [map style's sprite](https://docs.mapbox.com/help/glossary/sprite/) before being able to assign it to be the icon image of a symbol._

```swift
func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
  let attraction = UIImage(named: "attraction")
  
  if let styleImage = attraction {
    self.mapView.style?.setImage(styleImage, forName: "attraction")
  }
  
  let symbolAnnotationController = MGLSymbolAnnotationController(mapView: self.mapView)
  
  let symbol = MGLSymbolStyleAnnotation(coordinate: CLLocationCoordinate2DMake(59, 18));
  symbol.iconImageName = "attraction"
  symbol.text = "This is a cool place!"
  symbol.textFontSize = 16
  symbolAnnotationController.add(symbol)
}
```

### Displaying callouts for style annotations

Style annotations support callouts that appear when the annotation is selected. Each callout can display additional information about its annotation.

1. To enable callouts for a style annotation, create a class property with the controller type you are enabling interaction for:

```swift
class ViewController: UIViewController {
    var mapView: MGLMapView!
    var circleAnnotationController: MGLCircleAnnotationController!
}

2. The style annotation must contain a title and must implement two delegate methods using the [Maps SDK for iOS](https://docs.mapbox.com/ios/api/maps/). The first method, `annotationCanShowCallout` should return `true`. The second method, `viewFor annotation:` should return an empty
`MGLAnnotationView` matching the size of the style annotation's shape, as shown below.

```swift
extension ViewController : MGLMapViewDelegate {
    
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
      circleAnnotationController = MGLCircleAnnotationController(mapView: self.mapView)
      let circle = MGLCircleStyleAnnotation(center: CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), radius: 3.0, color: .blue)
      circle.opacity = 0.5
      circle.title = "Title"
      circleAnnotationController.add(circle)
    }

    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true;
    }
    
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return MGLAnnotationView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    }
    
}
```

## Supported properties

Each style annotation class has a specific set of style and layout properties that can be assigned. These properties mirror the same values specified in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/). Below is a list of supported properties on each style annotation class along with its corresponding property within the Mapbox Style Specification.

**MGLCircleStyleAnnotation**
- [`circleTranslation`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-translate)
- [`circleTranslationAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-translate-anchor)
- [`circlePitchAlignment`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-pitch-alignment)
- [`circleScaleAlignment`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-scale-aslignment)

**MGLLineStyleAnnotation**
- [`lineJoin`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-join)
- [`lineBlur`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-blur)
- [`lineColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-color)
- [`lineGapWidth`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-gap-width)
- [`lineOffset`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-offset)
- [`lineOpacity`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-opacity)
- [`linePattern`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-pattern)
- [`lineWidth`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-width)

**MGLPolygonStyleAnnotation**
- [`fillOpacity`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-opacity)
- [`fillColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-color)
- [`fillOutlineColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-outline-color)
- [`fillPattern`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-pattern)

**MGLSymbolStyleAnnotation**

_Icon images_
- [`iconScale`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-size)
- [`iconImageName`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-image)
- [`iconRotation`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-rotate)
- [`iconOffset`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-offset)
- [`iconAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-anchor)
- [`iconOpacity`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-opacity)
- [`iconColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-color)
- [`iconHaloColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-halo-color)
- [`iconHaloWidth`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-halo-width)
- [`iconHaloBlur`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-halo-blur)

_Symbol text_
- [`text`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-field)
- [`fontNames`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-font)
- [`textFontSize`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-size)
- [`maximumTextWidth`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-max-width)
- [`textLetterSpacing`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-letter-spacing)
- [`textJustification`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-justify)
- [`textRadialOffset`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-radial-offset)
- [`textAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-anchor)
- [`textRotation`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-rotate)
- [`textTransform`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-transform)
- [`textOffset`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-offset)
- [`textOpacity`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-opacity)
- [`textColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-color)
- [`textHaloColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-halo-color)
- [`textHaloWidth`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-halo-width)
- [`textHaloBlur`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-halo-blur)

**Icon image & symbol text**
- [`symbolSortKey`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-sort-key)

## Support

Mapbox Framework Extensions are still in active development, and as such APIs are subject to rapid change. If you have questions or feedback, please open a [new issue](https://github.com/mapbox/map-extensions-ios/issues/new) in this repository.

If you'd like to report a bug, please include as much information as possible so that we can quickly reproduce the issue.

For help with using the Mapbox Maps SDK for iOS, check out our [documentation](https://docs.mapbox.com/ios/).