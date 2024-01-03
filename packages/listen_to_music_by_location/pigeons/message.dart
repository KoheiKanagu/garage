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
  @async
  String requestPermission();

  String currentPermissionStatus();

  void play({
    required String id,
  });
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
