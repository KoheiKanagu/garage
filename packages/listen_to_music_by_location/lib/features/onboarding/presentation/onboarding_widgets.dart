import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

List<Widget> onboardingWidgets = [
  Container(
    color: Colors.red,
  ),
  Container(
    color: Colors.blue,
  ),
  Container(
    color: Colors.green,
  ),
  Container(
    color: Colors.yellow,
  ),
];

class OnboardingWidgets extends HookConsumerWidget {
  const OnboardingWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
