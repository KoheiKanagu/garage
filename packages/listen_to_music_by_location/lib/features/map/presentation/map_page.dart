import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/map/application/map_providers.dart';

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

    ref.listen(
      mapDrawAnnotationsProvider,
      (_, __) {},
    );

    return const UiKitView(
      viewType: 'my_map_platform_view',
    );
  }
}
