import Flutter
import MapKit

class MyMapView: MKMapView, UIGestureRecognizerDelegate, MKMapViewDelegate {
  var arguments: [String: Any?] = [:]

  convenience init(
    args: Any?
  ) {
    self.init(
      frame: CGRect.zero
    )
    delegate = self
    arguments = args as? [String: Any?] ?? [:]

    let latitude = arguments["latitude"] as? Double ?? 0.0
    let longitude = arguments["longitude"] as? Double ?? 0.0
    let meters = arguments["meters"] as? Double ?? 0.0

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

    for case let circle as MKCircle in overlays {
      let renderer = MKCircleRenderer(
        circle: circle
      )
      let point = renderer.point(
        for: MKMapPoint(coordinate)
      )

      if renderer.path.contains(point) {
        print("contains")
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

    // アノテーションを作る
    let annotation = MyMKPointAnnotation()
    annotation.coordinate = coordinate
    annotation.title = "You long pressed here"
    annotation.identifier = "asdf"
    addAnnotation(annotation)

    // 円を追加
    let circle = MKCircle(
      center: coordinate,
      radius: CLLocationDistance(500)
    )
    addOverlay(circle)
  }

  func mapView(
    _ mapView: MKMapView,
    rendererFor overlay: MKOverlay
  ) -> MKOverlayRenderer {

    // 円のスタイル
    if let circle = overlay as? MKCircle {
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

}

class MyMKPointAnnotation: MKPointAnnotation {
  var identifier: String!
}
