import 'package:flutter/cupertino.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:listen_to_music_by_location/gen/assets.gen.dart';

class AppleMusicBadge extends StatelessWidget {
  const AppleMusicBadge({
    required this.onTap,
    this.height = kMinInteractiveDimensionCupertino,
    super.key,
  });

  final VoidCallback onTap;

  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ScalableImageWidget.fromSISource(
        // apple_music_badge.svg のheightが40
        scale: height / 40,
        si: ScalableImageSource.fromSI(
          DefaultAssetBundle.of(context),
          Assets.si.appleMusicBadge,
        ),
      ),
    );
  }
}
