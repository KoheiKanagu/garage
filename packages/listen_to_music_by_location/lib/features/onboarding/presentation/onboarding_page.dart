import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnboardingPageBase(
      children: [
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
      ],
    );
  }
}
