import MapboxAnnotationExtension

protocol AnnotationStyleSettingsDelegate {
    func didUpdateStyleAnnotation(with updatedAnnotation: MGLStyleAnnotation)
}
