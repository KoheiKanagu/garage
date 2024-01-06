import Flutter
import MapKit

class MyMapView: MKMapView, UIGestureRecognizerDelegate, MKMapViewDelegate, MyMapHostApi {

  var myFlutterApi: MyFlutterApi?

  convenience init(
    args: Any?,
    flutterApi: MyFlutterApi?
  ) {
    self.init(
      frame: CGRect.zero
    )

    delegate = self
    showsUserLocation = true
      
    myFlutterApi = flutterApi

    if let arguments = args as? [String: Any?],
      let latitude = arguments["latitude"] as? Double,
      let longitude = arguments["longitude"] as? Double,
      let meters = arguments["meters"] as? Double
    {
      // 未指定の場合はlocaleからいい感じの場所が設定される？
      try? setMapRegion(
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
        myFlutterApi?.onTapCircle(
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

    myFlutterApi?.onLongPressedMap(
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
  ) throws {
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

  func addAnnotation(
    identifier: String,
    latitude: Double,
    longitude: Double,
    title: String,
    circleDistance: Double
  ) throws {
    // アノテーションを作る
    let annotation = MyMKPointAnnotation()
    annotation.coordinate = CLLocationCoordinate2D(
      latitude: latitude,
      longitude: longitude
    )
    annotation.title = title
    annotation.identifier = identifier
    addAnnotation(annotation)

    // 円を追加
    let circle = MyMKCircle(
      center: annotation.coordinate,
      radius: CLLocationDistance(
        circleDistance
      )
    )
    circle.identifier = identifier
    addOverlay(circle)
  }

  func removeAnnotation(
    identifier: String
  ) throws {

    for case let annotation as MyMKPointAnnotation in annotations {
      if annotation.identifier == identifier {
        removeAnnotation(annotation)
      }
    }

    for case let circle as MyMKCircle in overlays {
      if circle.identifier == identifier {
        removeOverlay(circle)
      }
    }
  }

}

class MyMKCircle: MKCircle {
  var identifier: String!
}

class MyMKPointAnnotation: MKPointAnnotation {
  var identifier: String!
}
