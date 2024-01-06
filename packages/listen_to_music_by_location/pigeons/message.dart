import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/gen/message.g.dart',
    swiftOut: 'ios/Runner/Messages.g.swift',
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)
@HostApi()
abstract class MyMapHostApi {
  void setMapRegion({
    required double latitude,
    required double longitude,
    required double meters,
  });

  void addAnnotation({
    required String identifier,
    required double latitude,
    required double longitude,
    required String title,
    required double circleDistance,
  });

  void removeAnnotation({
    required String identifier,
  });
}

@HostApi()
abstract class MyMusicHostApi {
  /// Status
  /// https://developer.apple.com/documentation/musickit/musicauthorization/status
  @async
  String requestPermission();

  /// Status
  /// https://developer.apple.com/documentation/musickit/musicauthorization/status
  String currentPermissionStatus();

  void play({
    required String id,
  });

  @async
  SongDetails songDetails({
    required String id,
    int artworkSize = 512,
  });
}

class SongDetails {
  SongDetails({
    required this.id,
    required this.title,
    required this.artistName,
    required this.artworkUrl,
    required this.songUrl,
  });

  final String id;
  final String title;
  final String artistName;
  final String? artworkUrl;
  final String? songUrl;
}

@HostApi()
abstract class MyLocationHostApi {
  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1620562-requestwheninuseauthorization
  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1620551-requestalwaysauthorization
  void requestAuthorization({
    required bool always,
  });

  /// Status
  /// https://developer.apple.com/documentation/corelocation/clauthorizationstatus
  AuthorizationStatus currentPermissionStatus();

  /// CLRegion.identifier
  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1423790-monitoredregions
  List<Region> monitoredRegions();

  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1423656-startmonitoring
  @async
  void startMonitoring({
    required Region region,
  });

  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1423840-stopmonitoring
  void stopMonitoring({
    required Region region,
  });
}

/// https://developer.apple.com/documentation/corelocation/clcircularregion
class Region {
  Region({
    required this.identifier,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });

  final String identifier;
  final double latitude;
  final double longitude;

  /// meters
  final double radius;
}

@FlutterApi()
abstract class MyFlutterApi {
  /// on tap MKCircle
  void onTapCircle(
    String identifier,
  );

  /// on long pressed MKMapView
  void onLongPressedMap(
    double latitude,
    double longitude,
  );

  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423570-locationmanager
  void didDetermineState(
    Region region,
    RegionState state,
  );

  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/3563956-locationmanagerdidchangeauthoriz
  void didChangeAuthorization(
    AuthorizationStatus status,
  );

  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423842-locationmanager
  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423720-locationmanager
  void didStartMonitoring(
    Region region,
    String? error,
  );
}

enum RegionState {
  unknown,
  inside,
  outside,
}

enum AuthorizationStatus {
  notDetermined,
  restricted,
  denied,
  authorizedAlways,
  authorizedWhenInUse,
  ;
}
