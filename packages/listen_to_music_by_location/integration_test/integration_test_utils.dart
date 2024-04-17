import 'package:listen_to_music_by_location/main.dart' as app_main;
import 'package:patrol/patrol.dart';

Future<void> createApp(PatrolIntegrationTester $) async {
  await app_main.main();
  await $.pumpAndSettle();
}
