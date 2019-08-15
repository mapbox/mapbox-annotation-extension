import MapboxAnnotationsExtension

protocol AnnotationStyleSettingsDelegate {
    func didUpdateStyleAnnotation(with updatedAnnotation: MGLStyleAnnotation)
}
