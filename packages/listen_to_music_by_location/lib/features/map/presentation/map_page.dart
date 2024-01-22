import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/exceptions/locamusic_creation_limit_exception.dart';
import 'package:listen_to_music_by_location/features/map/application/map_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/native/application/map_view_delegate.dart';
import 'package:listen_to_music_by_location/features/native/presentation/my_map_view.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locamusics = ref.watch(locamusicDocumentsProvider).asData?.value;

    final didFinishMapViewType = ref
        .watch(mapPageMapViewMapViewDidFinishLoadingMapProvider)
        .asData
        ?.value;

    if (didFinishMapViewType == MapViewType.mapPage) {
      // MapViewが読み込まれたらAnnotationを描画
      useEffect(
        () {
          ref.read(
            mapAdjustCameraProvider(
              locamusics: locamusics ?? [],
              mapViewType: MapViewType.mapPage,
            ),
          );
          return null;
        },
        [didFinishMapViewType],
      );
    }

    ref
      ..listen(
        mapPageMapViewOnLongPressedMapProvider.future,
        (_, next) async {
          final indicator = showMyProgressIndicator();

          final value = await next;
          try {
            await ref.read(
              locamusicAddProvider(
                geoPoint: GeoPoint(value.latitude, value.longitude),
                distanceRange: DistanceRange.medium,
              ).future,
            );
          } on LocamusicCreationLimitException catch (_) {
            if (context.mounted) {
              await showOkAlertDialog(
                context: context,
                title: i18n.locamusic.create_limit_error,
                message: i18n.locamusic.create_limit_error_message(
                  n: kMaxCreateLocamusicCount,
                ),
              );
            }
          } finally {
            indicator.dismiss();
          }
        },
      )
      ..listen(
        mapPageMapViewOnTapCircleProvider.future,
        (_, next) async {
          final value = next;

          // TODO(KoheiKanagu): 円をタップした挙動
        },
      );

    return const MyMapView(
      mapViewType: MapViewType.mapPage,
    );
  }
}
