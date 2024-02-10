import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/my_app.dart';

Future<void> main() async {
  kTenantId = 'loca-music-l7m49';
  kAppStoreId = '6471416156';

  final container = await initialize();
  if (container != null) {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
  }
}
