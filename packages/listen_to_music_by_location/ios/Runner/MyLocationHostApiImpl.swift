import CoreLocation

class MyLocationHostApiImpl: NSObject, MyLocationHostApi, CLLocationManagerDelegate {

  private let locationManager = CLLocationManager()

  let myFlutterApi: MyFlutterApi

  init(myFlutterApi: MyFlutterApi) {
    self.myFlutterApi = myFlutterApi

    super.init()

    locationManager.delegate = self
  }

  func requestPermission() throws {
    locationManager.requestAlwaysAuthorization()
  }

  func currentPermissionStatus() throws -> AuthorizationStatus {
    return locationManager.authorizationStatus.authorizationStatus
  }

  func monitoredRegions() throws -> [Region] {
    return locationManager.monitoredRegions.compactMap {
      $0 as? CLCircularRegion
    }.map {
      $0.region
    }
  }

  func startMonitoring(region: Region) throws {
    let reg = region.cLCircularRegion
    reg.notifyOnEntry = true
    reg.notifyOnExit = true

    locationManager.startMonitoring(for: reg)
  }

  func stopMonitoring(region: Region) throws {
    locationManager.stopMonitoring(
      for: region.cLCircularRegion
    )
  }

  func locationManagerDidChangeAuthorization(
    _ manager: CLLocationManager
  ) {
    myFlutterApi.didChangeAuthorization(
      status: manager.authorizationStatus.authorizationStatus,
      completion: { _ in }
    )
  }

  func locationManager(
    _ manager: CLLocationManager,
    didDetermineState state: CLRegionState,
    for region: CLRegion
  ) {
    if let e = region as? CLCircularRegion {
      myFlutterApi.didDetermineState(
        region: e.region,
        state: state.regionState,
        completion: { _ in }
      )
    }
  }
}

extension Region {
  var cLCircularRegion: CLCircularRegion {
    CLCircularRegion(
      center: .init(
        latitude: self.latitude,
        longitude: self.longitude
      ),
      radius: self.radius,
      identifier: self.identifier
    )
  }
}

extension CLAuthorizationStatus {
  var authorizationStatus: AuthorizationStatus {
    switch self {
    case .authorizedAlways:
      return .authorizedAlways
    case .authorizedWhenInUse:
      return .authorizedWhenInUse
    case .denied:
      return .denied
    case .notDetermined:
      return .notDetermined
    case .restricted:
      return .restricted
    @unknown default:
      return .notDetermined
    }
  }
}

extension CLCircularRegion {
  var region: Region {
    Region(
      identifier: self.identifier,
      latitude: self.center.latitude,
      longitude: self.center.longitude,
      radius: self.radius
    )
  }
}

extension CLRegionState {
  var regionState: RegionState {
    switch self {
    case .inside:
      return .inside
    case .outside:
      return .outside
    case .unknown:
      return .unknown
    }
  }
}
