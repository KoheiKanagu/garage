import 'package:obento/gen/assets.gen.dart';
import 'package:obento/my_app.dart';

import '../../../core/test/core.dart';

void main() {
  featureGraphic(
    appIcon: Assets.images.appIcon.image(),
    base: myThemeBuilder.baseColor,
    baseDark: myThemeBuilder.baseDarkColor,
  );
}
