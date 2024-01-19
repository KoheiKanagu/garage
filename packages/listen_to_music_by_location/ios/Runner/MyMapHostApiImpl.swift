class MyMapHostApiImpl: MyMapHostApi {
  let myMapView: MyMapView

  init(myMapView: MyMapView) {
    self.myMapView = myMapView
  }

  func setMapRegion(
    latitude: Double,
    longitude: Double,
    meters: Double
  ) throws {
    try myMapView.setMapRegion(
      latitude: latitude,
      longitude: longitude,
      meters: meters
    )
  }

  func addAnnotations(annotations: [CircleAnnotation]) throws {
    try myMapView.addAnnotations(
      annotations: annotations
    )
  }

  func removeAnnotations(identifiers: [String]) throws {
    try myMapView.removeAnnotations(
      identifiers: identifiers
    )
  }

  func getAnnotations() throws -> [String] {
    try myMapView.getAnnotations()
  }

  func showAnnotations() throws {
    try myMapView.showAnnotations()
  }
}
