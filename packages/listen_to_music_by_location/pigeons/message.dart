import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/gen/message.g.dart',
    swiftOut: 'ios/Runner/Messages.g.swift',
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)
@HostApi()
abstract class MyHostApi {
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
