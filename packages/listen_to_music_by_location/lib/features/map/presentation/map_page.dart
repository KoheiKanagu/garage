import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/map/application/map_providers.dart';
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

    ref.listen(
      mapDrawAnnotationsProvider,
      (_, __) {},
    );

    // ref.listen(
    //   locamusicWithSongDetailsProvider.future,
    //   (_, next) async {

    //     final values = await next;

    //     final annotations = values
    //         .map(
    //           (e) => CircleAnnotation(
    //             identifier: e.documentId,
    //             latitude: e.locamusic.geoPoint.latitude,
    //             longitude: e.locamusic.geoPoint.longitude,
    //             title: e.songDetails?.title ?? i18n.unset,
    //             circleDistance: e.locamusic.distance,
    //           ),
    //         )
    //         .toList();
    //     await ref.read(myMapHostApiProvider).addAnnotations(annotations);
    //   },
    // );

    return const UiKitView(
      viewType: 'my_map_platform_view',
    );
  }
}
