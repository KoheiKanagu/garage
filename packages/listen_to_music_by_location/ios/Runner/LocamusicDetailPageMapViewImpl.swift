class LocamusicDetailPageMapViewImpl: LocamusicDetailPageMapView {
  let myMapView: MyMapView

  init(myMapView: MyMapView) {
    self.myMapView = myMapView
  }

  func setMapRegion(
    latitude: Double,
    longitude: Double,
    meters: Double
  ) throws {
    myMapView.setMapRegion(
      latitude: latitude,
      longitude: longitude,
      meters: meters
    )
  }

  func addAnnotations(annotations: [CircleAnnotation]) throws {
    myMapView.addAnnotations(
      annotations: annotations
    )
  }

  func addAnnotationOverlays(annotations: [CircleAnnotation]) throws {
    myMapView.addAnnotationOverlays(
      annotations: annotations
    )
  }

  func removeAnnotations(identifiers: [String]) throws {
    myMapView.removeAnnotations(
      identifiers: identifiers
    )
  }

  func removeAnnotationAll() throws {
    myMapView.removeAnnotationAll()
  }

  func removeAnnotationOverlays(identifiers: [String]) throws {
    myMapView.removeAnnotationOverlays(
      identifiers: identifiers
    )
  }

  func getAnnotations() throws -> [String] {
    myMapView.getAnnotations()
  }

  func showAnnotations() throws {
    myMapView.showAnnotations()
  }
}
