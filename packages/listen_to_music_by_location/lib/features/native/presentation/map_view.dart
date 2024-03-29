import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';

class MapView extends StatelessWidget {
  const MapView({
    required this.mapViewType,
    super.key,
    this.layoutMarginsBottom = 50,
    this.latitude,
    this.longitude,
    this.meters,
  });

  final MapViewType mapViewType;

  final double layoutMarginsBottom;

  final double? latitude;
  final double? longitude;
  final double? meters;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: mapViewType.name,
      creationParams: {
        'layoutMarginsBottom': layoutMarginsBottom,
        'latitude': latitude,
        'longitude': longitude,
        'meters': meters,
      },
      creationParamsCodec: const StandardMessageCodec(),
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          EagerGestureRecognizer.new,
        ),
      },
    );
  }
}
