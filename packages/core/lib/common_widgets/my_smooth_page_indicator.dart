import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MySmoothPageIndicator extends StatelessWidget {
  const MySmoothPageIndicator({
    required this.controller,
    required this.count,
    super.key,
  });

  final PageController controller;

  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      effect: WormEffect(
        type: WormType.thinUnderground,
        dotWidth: 8,
        dotHeight: 8,
        activeDotColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material => Theme.of(context).colorScheme.primary,
          InheritedThemeType.cupertino =>
            CupertinoTheme.of(context).primaryColor,
        },
        dotColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material =>
            Theme.of(context).colorScheme.onSurface,
          InheritedThemeType.cupertino => CupertinoColors.inactiveGray
        },
      ),
    );
  }
}
