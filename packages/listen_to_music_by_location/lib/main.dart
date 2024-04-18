import 'package:core/core.dart';
import 'package:listen_to_music_by_location/main_dev.dart' as main_dev;
import 'package:listen_to_music_by_location/main_prod.dart' as main_prod;

Future<void> main() async => switch (appEnv) {
      AppEnv.dev => main_dev.main(),
      AppEnv.prod => main_prod.main(),
    };
