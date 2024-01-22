import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MySmoothPageIndicator extends StatelessWidget {
  const MySmoothPageIndicator(
    this.controller, {
    super.key,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
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
        activeDotColor: Theme.of(context).colorScheme.primary,
        dotColor: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
