import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:listen_to_music_by_location/gen/assets.gen.dart';

class AppleMusicBadge extends StatelessWidget {
  const AppleMusicBadge({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ScalableImageWidget.fromSISource(
        si: ScalableImageSource.fromSI(
          DefaultAssetBundle.of(context),
          Assets.si.appleMusicBadge,
        ),
      ),
    );
  }
}
