import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future(
          () async {
            // 初期位置を取得してカメラズーム
            await ref.read(myLocationHostApiProvider).requestLocation();
            final value =
                await ref.read(myFlutterApiDidUpdateLocationsProvider.future);
            await ref.read(myMapHostApiProvider).setMapRegion(
                  latitude: value.latitude,
                  longitude: value.longitude,
                  meters: DistanceRange.large.meters,
                );
          },
        );
        return null;
      },
      [context],
    );

    return const UiKitView(
      viewType: 'my_map_platform_view',
    );
  }
}
