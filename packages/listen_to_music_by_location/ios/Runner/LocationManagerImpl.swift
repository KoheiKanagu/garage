import CoreLocation

class LocationManagerImpl: NSObject, LocationManager, CLLocationManagerDelegate {

  private let locationManager = CLLocationManager()

  let locationManagerDelegate: LocationManagerDelegate

  init(locationManagerDelegate: LocationManagerDelegate) {
    self.locationManagerDelegate = locationManagerDelegate

    super.init()

    locationManager.delegate = self
  }

  func requestAuthorization(always: Bool) throws {
    if always {
      locationManager.requestAlwaysAuthorization()
    } else {
      locationManager.requestWhenInUseAuthorization()
    }
  }

  func locationManagerDidChangeAuthorization(
    _ manager: CLLocationManager
  ) {
    locationManagerDelegate.didChangeAuthorization(
      status: manager.authorizationStatus.authorizationStatus,
      completion: { _ in }
    )
  }

  func currentPermissionStatus() throws -> AuthorizationStatus {
    return locationManager.authorizationStatus.authorizationStatus
  }

  func monitoredRegions() throws -> [Region] {
    return locationManager.monitoredRegions.compactMap {
      $0 as? CLCircularRegion
    }.map { $0.region }
  }

  func startMonitoring(
    region: Region,
    completion: @escaping (
      Result<Void, Error>
    ) -> Void
  ) {
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

  func locationManager(
    _ manager: CLLocationManager,
    didStartMonitoringFor region: CLRegion
  ) {
    guard let e = region as? CLCircularRegion else { return }

    locationManagerDelegate.didStartMonitoring(
      region: e.region,
      error: nil,
      completion: { _ in }
    )
  }

  func locationManager(
    _ manager: CLLocationManager,
    monitoringDidFailFor region: CLRegion?,
    withError error: Error
  ) {
    guard let e = region as? CLCircularRegion else { return }

    locationManagerDelegate.didStartMonitoring(
      region: e.region,
      error: error.localizedDescription,
      completion: { _ in }
    )
  }

  func locationManager(
    _ manager: CLLocationManager,
    didDetermineState state: CLRegionState,
    for region: CLRegion
  ) {
    guard let e = region as? CLCircularRegion else { return }

    locationManagerDelegate.didDetermineState(
      region: e.region,
      state: state.regionState,
      completion: { _ in }
    )
  }

  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    guard let coordinate = locations.last?.coordinate else { return }

    locationManagerDelegate.didUpdateLocations(
      latitude: coordinate.latitude,
      longitude: coordinate.longitude,
      completion: { _ in }
    )
  }

  func locationManager(
    _ manager: CLLocationManager,
    didFailWithError error: Error
  ) {}

  func requestLocation() throws {
    locationManager.requestLocation()
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
