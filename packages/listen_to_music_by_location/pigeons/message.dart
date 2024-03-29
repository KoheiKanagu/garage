// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/gen/message.g.dart',
    swiftOut: 'ios/Runner/Messages.g.swift',
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)
@HostApi()
abstract class MapPageMapView {
  void setMapRegion({
    required double latitude,
    required double longitude,
    required double meters,
  });

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1451889-addannotations
  void addAnnotations(
    List<CircleAnnotation> annotations,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452518-addoverlays
  void addAnnotationOverlays(
    List<CircleAnnotation> annotations,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452130-removeannotations
  void removeAnnotations(
    List<String> identifiers,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452719-removeoverlays
  void removeAnnotationOverlays(
    List<String> identifiers,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452593-annotations
  List<String> getAnnotations();

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452309-showannotations
  void showAnnotations();
}

@HostApi()
abstract class LocamusicDetailPageMapView {
  void setMapRegion({
    required double latitude,
    required double longitude,
    required double meters,
  });

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1451889-addannotations
  void addAnnotations(
    List<CircleAnnotation> annotations,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452518-addoverlays
  void addAnnotationOverlays(
    List<CircleAnnotation> annotations,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452130-removeannotations
  void removeAnnotations(
    List<String> identifiers,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452719-removeoverlays
  void removeAnnotationOverlays(
    List<String> identifiers,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452593-annotations
  List<String> getAnnotations();

  /// https://developer.apple.com/documentation/mapkit/mkmapview/1452309-showannotations
  void showAnnotations();
}

class CircleAnnotation {
  const CircleAnnotation({
    required this.identifier,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.circleDistance,
  });

  final String identifier;
  final double latitude;
  final double longitude;
  final String title;
  final double circleDistance;
}

@HostApi()
abstract class MusicKit {
  /// Status
  /// https://developer.apple.com/documentation/musickit/musicauthorization/status
  @async
  MusicAuthorizationStatus requestPermission();

  /// Status
  /// https://developer.apple.com/documentation/musickit/musicauthorization/status
  MusicAuthorizationStatus currentPermissionStatus();

  void play(
    String id,
  );

  @async
  SongDetails songDetails(
    String id, {
    int artworkSize = 512,
  });

  /// 音の出力先がビルトインスピーカーかどうか判定
  ///
  /// https://developer.apple.com/documentation/avfaudio/avaudiosession/port/1616561-builtinspeaker
  bool audioSessionBuiltInSpeaker();
}

enum MusicAuthorizationStatus {
  notDetermined,
  denied,
  restricted,
  authorized,
  ;
}

class SongDetails {
  const SongDetails({
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
abstract class LocationManager {
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
  void startMonitoring(
    Region region,
  );

  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1423840-stopmonitoring
  void stopMonitoring(
    Region region,
  );
}

/// https://developer.apple.com/documentation/corelocation/clcircularregion
class Region {
  Region({
    required this.identifier,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });

  /// Locamusic documentId
  final String identifier;

  final double latitude;
  final double longitude;

  /// meters
  final double radius;
}

@FlutterApi()
abstract class LocationManagerDelegate {
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

@FlutterApi()
abstract class MapViewDelegate {
  /// on tap MKCircle
  void onTapCircle(
    MapViewType viewType,
    String identifier,
  );

  /// on long pressed MKMapView
  void onLongPressedMap(
    MapViewType viewType,
    double latitude,
    double longitude,
  );

  /// https://developer.apple.com/documentation/mapkit/mkmapviewdelegate/1452291-mapviewdidfinishloadingmap
  void mapViewDidFinishLoadingMap(
    MapViewType viewType,
  );
}

/// どのMapViewから呼ばれたかを判別するために利用する
enum MapViewType {
  // for map_page.dart
  mapPage,
  // for locamusic_detail_page.dart
  locamusicDetailPage,
  ;
}

@HostApi()
abstract class OpenSettings {
  /// https://developer.apple.com/documentation/uikit/uiapplication/1623042-opensettingsurlstring
  void openSettings();
}
