# Mapbox Annotation Extension for iOS

---

⚠️ **This project is currently experimental, is not intended for production usage.** ⚠️

---

The Mapbox Annotation Extension is a lightweight library you can use with the Mapbox Maps SDK for iOS to quickly add basic shapes, icons, and other annotations to a map.

This extension leverages the power of runtime styling with an object oriented approach to simplify the creation and styling of annotations.

## Installation

Before following any of the below installation instructions, you will need to configure your machine to download Mapbox Maps SDK for iOS, which is a dependency of this project. Go to your Mapbox account dashboard and create an access token that has the `DOWNLOADS:READ` scope. 

PLEASE NOTE: This is not the same as your production Mapbox API token. Make sure to keep it private and do not insert it into any `Info.plist file`. 

Then, create a file named `.netrc` in your home directory if it doesn’t already exist, then add the following lines to the end of the file:

```
machine api.mapbox.com 
  login mapbox
  password PRIVATE_MAPBOX_API_TOKEN
```

where _PRIVATE_MAPBOX_API_TOKEN_ is your Mapbox API token with the `DOWNLOADS:READ` scope. You can now continue the installation process with CocoaPods or manually.

### Using CocoaPods
To install the Mapbox Annotation Extension using CocoaPods:

Create a Podfile with the following specification:

```
pod 'MapboxAnnotationExtension', '0.0.1-beta.2'
```

Run `pod repo update && pod install` and open the resulting Xcode workspace.

### Manual Installation

Download and unzip the latest [release](https://github.com/mapbox/mapbox-annotation-extension/releases).

Drag **MapboxAnnotationExtension.framework** into your project's Embedded Binaries section in the project editor. In the sheet that appears, make sure "Copy items if needed" is checked, then select Finish.


### Carthage & Swift Package Manager

Carthage and Swift Package Manager ("SPM") are currently not supported (see [#64](https://github.com/mapbox/mapbox-annotation-extension/issues/64)).

## Demo application

You can find a sample application within this project by running the `annotationapp` target.

## Usage

The Mapbox Annotation Extension supports the addition of circles, lines, polygons, and symbols. Each shape type has its own corresponding controller which manages the addition of multiple shape objects of the same type.

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

1) To enable callouts for a style annotation, create a class property with the controller type you are enabling interaction for:

```swift
class ViewController: UIViewController {
    var mapView: MGLMapView!
    var circleAnnotationController: MGLCircleAnnotationController!
}
```

2) The style annotation must contain a title and must implement two delegate methods using the [Maps SDK for iOS](https://docs.mapbox.com/ios/api/maps/). The first method, `annotationCanShowCallout` should return `true`. The second method, `viewFor annotation:` should return an empty
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

Each `MGLStyleAnnotation` class can be assigned a specific set of properties to configure its layout and style. Additionally, `MGLAnnotationController`s also have properties that can assign a specific layout property to all of its child `MGLStyleAnnotation`s. 

All of these properties mirror the same values specified in the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/). Below is a list of supported properties on each class along with its corresponding property within the Mapbox Style Specification.

**MGLCircleStyleAnnotation**
- [`circleRadius`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-radius)
- [`circleColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-color)
- [`circleOpacity`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-opacity)
- [`circleStrokeWidth`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-stroke-width)
- [`circleStrokeColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-stroke-color)
- [`circleStrokeOpacity`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-circle-circle-translate)

**MGLCircleAnnotationController**
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

**MGLLineAnnotationController**
- [`lineCap`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-cap)
- [`lineMiterLimit`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-miter-limit)
- [`lineRoundLimit`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-round-limit)
- [`lineDashPattern`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-dash-pattern)
- [`lineTranslation`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-translation)
- [`lineTranslationAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-line-line-translation-anchor)

**MGLPolygonStyleAnnotation**
- [`fillOpacity`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-opacity)
- [`fillColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-color)
- [`fillOutlineColor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-outline-color)
- [`fillPattern`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-pattern)

**MGLPolygonAnnotationController**
- [`fillAntialiased`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-antialias)
- [`fillTranslation`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-translate)
- [`fillTranslationAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-translate-anchor)

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

_Icon image & symbol text_
- [`symbolSortKey`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-sort-key)

**MGLSymbolAnnotationController**

_Icon images_

- [`iconAllowsOverlap`](https://www.mapbox.com/mapbox-gl-style-spec/#layout-symbol-icon-allow-overlap)
- [`iconIgnoresPlacement`](https://www.mapbox.com/mapbox-gl-style-spec/#layout-symbol-icon-ignore-placement)
- [`iconOptional`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-optional)
- [`iconPadding`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-padding)
- [`iconPitchAlignment`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-pitch-alignment)
- [`iconRotationAlignment`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-rotation-alignment)
- [`iconTextFit`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-text-fit)
- [`iconTranslation`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-translate)
- [`iconTranslationAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-icon-translate-anchor)
- [`keepsIconUpright`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-keep-upright)

_Symbol text_

- [`textAllowsOverlap`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-allow-overlap)
- [`textLineHeight`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-line-height)
- [`textOptional`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-optional)
- [`textPadding`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-padding)
- [`textPitchAlignment`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-pitch-alignment)
- [`textRotationAlignment`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-rotation-alignment)
- [`textVariableAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-variable-anchor)
- [`textTranslation`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-translate)
- [`textTranslationAnchor`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#paint-symbol-text-translate-anchor)
- [`keepsTextUpRight`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-keep-upright)
- [`maximumTextAngle`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-max-angle)

_Icon image & symbol text_

- [`symbolAvoidsEdges`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-avoid-edges)
- [`symbolPlacement`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-placement)
- [`symbolSpacing`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-spacing)
- [`symbolZOrder`](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-symbol-z-order)


## Support

Please note that this is an experimental project and is subject to change.

If you have questions or feedback, please open a [new issue](https://github.com/mapbox/map-extensions-ios/issues/new) in this repository.

If you'd like to report a bug, please include as much information as possible so that we can quickly reproduce the issue.

For help with using the Mapbox Maps SDK for iOS, check out our [documentation](https://docs.mapbox.com/ios/).