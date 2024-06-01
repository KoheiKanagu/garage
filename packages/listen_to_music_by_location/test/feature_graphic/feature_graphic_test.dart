import 'package:listen_to_music_by_location/gen/assets.gen.dart';
import 'package:listen_to_music_by_location/my_app.dart';

import '../../../core/test/core.dart';

void main() {
  featureGraphic(
    appIcon: Assets.images.appIcon.image(),
    base: MyApp.color,
    baseDark: MyApp.darkColor,
  );
}
