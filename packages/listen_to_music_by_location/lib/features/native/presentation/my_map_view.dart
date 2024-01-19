import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMapView extends StatelessWidget {
  const MyMapView({
    super.key,
    this.interactive = true,
    this.layoutMarginsBottom = 50,
    this.latitude,
    this.longitude,
    this.meters,
  });

  final bool interactive;

  final double layoutMarginsBottom;

  final double? latitude;
  final double? longitude;
  final double? meters;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: interactive
          ? 'my_map_platform_view'
          : 'my_non_interactive_map_platform_view',
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
