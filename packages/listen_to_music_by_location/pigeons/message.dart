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

@FlutterApi()
abstract class MyFlutterApi {
  void onTapCircle(
    String identifier,
  );

  void onLongPressedMap(
    double latitude,
    double longitude,
  );
}
