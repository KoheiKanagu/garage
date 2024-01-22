import Flutter
import MapKit

class MyMapView: MKMapView, UIGestureRecognizerDelegate, MKMapViewDelegate {

  var mapViewType: MapViewType?

  var mapViewDelegate: MapViewDelegate?

  convenience init(
    args: Any?,
    mapViewType: MapViewType?,
    mapViewDelegate: MapViewDelegate?
  ) {
    self.init(
      frame: CGRect.zero
    )

    delegate = self
    showsUserLocation = true

    self.mapViewType = mapViewType
    self.mapViewDelegate = mapViewDelegate

    // Map上のAppleロゴの場所を移動
    if let arguments = args as? [String: Any?],
      let bottom = arguments["layoutMarginsBottom"] as? CGFloat
    {
      layoutMargins.bottom += bottom
    }

    if let arguments = args as? [String: Any?],
      let latitude = arguments["latitude"] as? Double,
      let longitude = arguments["longitude"] as? Double,
      let meters = arguments["meters"] as? Double
    {
      // 未指定の場合はlocaleからいい感じの場所が設定される？
      setMapRegion(
        latitude: latitude,
        longitude: longitude,
        meters: meters
      )
    }

    addGestureRecognizer(
      UITapGestureRecognizer(
        target: self,
        action: #selector(
          onTap(_:)
        )
      )
    )

    addGestureRecognizer(
      UILongPressGestureRecognizer(
        target: self,
        action: #selector(
          onLongPress(_:)
        )
      )
    )
  }

  func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
    guard let e = mapViewType else { return }
    mapViewDelegate?.mapViewDidFinishLoadingMap(
      viewType: e,
      completion: { _ in }
    )
  }

  @objc func onTap(
    _ sender: UITapGestureRecognizer
  ) {
    if sender.state != .ended {
      return
    }

    let coordinate = convert(
      sender.location(in: self),
      toCoordinateFrom: self
    )

    for case let circle as MyMKCircle in overlays {
      let renderer = MKCircleRenderer(
        circle: circle
      )
      let point = renderer.point(
        for: MKMapPoint(coordinate)
      )

      if renderer.path.contains(point) {
        guard let e = mapViewType else { return }
        mapViewDelegate?.onTapCircle(
          viewType: e,
          identifier: circle.identifier,
          completion: { _ in }
        )
      }
    }
  }

  @objc func onLongPress(
    _ sender: UILongPressGestureRecognizer
  ) {
    if sender.state != .began {
      return
    }

    let point = sender.location(in: self)

    let coordinate = convert(
      point,
      toCoordinateFrom: self
    )

    guard let e = mapViewType else { return }
    mapViewDelegate?.onLongPressedMap(
      viewType: e,
      latitude: coordinate.latitude,
      longitude: coordinate.longitude,
      completion: { _ in }
    )
  }

  func mapView(
    _ mapView: MKMapView,
    rendererFor overlay: MKOverlay
  ) -> MKOverlayRenderer {
    // 円のスタイル
    if let circle = overlay as? MyMKCircle {
      let renderer = MKCircleRenderer(
        circle: circle
      )
      renderer.strokeColor = .blue
      renderer.fillColor = .blue.withAlphaComponent(0.3)
      renderer.lineWidth = 4
      return renderer
    }

    return MKOverlayRenderer()
  }

  func setMapRegion(
    latitude: Double,
    longitude: Double,
    meters: Double
  ) {
    // カメラの位置
    setRegion(
      MKCoordinateRegion(
        center: CLLocationCoordinate2D(
          latitude: latitude,
          longitude: longitude
        ),
        latitudinalMeters: meters,
        longitudinalMeters: meters
      ),
      animated: true
    )
  }

  func addAnnotations(
    annotations: [CircleAnnotation]
  ) {
    // ピンを立てる
    addAnnotations(
      annotations.map { e in
        let annotation = MyMKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(
          latitude: e.latitude,
          longitude: e.longitude
        )
        annotation.title = e.title
        annotation.identifier = e.identifier
        return annotation
      }
    )
  }

  func addAnnotationOverlays(
    annotations: [CircleAnnotation]
  ) {
    // 円を描く
    addOverlays(
      annotations.map { e in
        let circle = MyMKCircle(
          center: CLLocationCoordinate2D(
            latitude: e.latitude,
            longitude: e.longitude
          ),
          radius: CLLocationDistance(e.circleDistance)
        )
        circle.identifier = e.identifier
        return circle
      }
    )
  }

  func removeAnnotations(
    identifiers: [String]
  ) {
    // ピンを削除
    removeAnnotations(
      annotations.compactMap { $0 as? MyMKPointAnnotation }
        .filter { identifiers.contains($0.identifier) }
    )
  }

  func removeAnnotationOverlays(
    identifiers: [String]
  ) {
    // 円を削除
    removeOverlays(
      overlays.compactMap { $0 as? MyMKCircle }
        .filter { identifiers.contains($0.identifier) }
    )
  }

  func getAnnotations() -> [String] {
    return annotations.compactMap { $0 as? MyMKPointAnnotation }
      .map { $0.identifier }
  }

  func showAnnotations() {
    showAnnotations(
      annotations,
      animated: true
    )
  }

}

class MyMKCircle: MKCircle {
  var identifier: String!
}

class MyMKPointAnnotation: MKPointAnnotation {
  var identifier: String!
}
