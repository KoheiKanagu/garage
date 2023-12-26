import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/onboarding/presentation/onboarding_widgets.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ConfigurePageRoute(
                $extra: [
                  ConfigureItem(
                    text: 'go /',
                    onTap: () {
                      OnboardingPageRoute(
                        $extra: onboardingWidgets,
                      ).go(context);
                    },
                    forDebug: true,
                    leadingIcon: Icons.start_rounded,
                    trailingIcon: Icons.warning_rounded,
                  ),
                ],
              ).push<void>(context);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Center(
        child: Text('center'),
      ),
    );
  }
}
