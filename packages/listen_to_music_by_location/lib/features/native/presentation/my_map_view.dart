import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';

class MyMapView extends StatelessWidget {
  const MyMapView({
    required this.myMapViewType,
    super.key,
    this.layoutMarginsBottom = 50,
    this.latitude,
    this.longitude,
    this.meters,
  });

  final MyMapViewType myMapViewType;

  final double layoutMarginsBottom;

  final double? latitude;
  final double? longitude;
  final double? meters;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: myMapViewType.name,
      creationParams: {
        'layoutMarginsBottom': layoutMarginsBottom,
        'latitude': latitude,
        'longitude': longitude,
        'meters': meters,
      },
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
