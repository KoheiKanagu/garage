import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/exceptions/locamusic_creation_limit_exception.dart';
import 'package:listen_to_music_by_location/features/map/application/map_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(mapAdjustCameraProvider);
        return null;
      },
      [context],
    );

    ref
      ..listen(
        mapDrawAnnotationsProvider,
        (_, __) {},
      )
      ..listen(
        myFlutterApiOnLongPressedMapProvider.future,
        (_, next) async {
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
                title: i18n.locamusic.create.limit_error,
                message: i18n.locamusic.create.limit_error_message(
                  n: kMaxCreateLocamusicCount,
                ),
              );
            }
          }
        },
      )
      ..listen(
        myFlutterApiOnTapCircleProvider.future,
        (_, next) async {
          final value = await next;

          //TODO
        },
      );

    return const UiKitView(
      viewType: 'my_map_platform_view',
    );
  }
}
