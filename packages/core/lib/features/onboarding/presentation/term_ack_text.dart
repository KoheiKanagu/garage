import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class TermAckText extends HookConsumerWidget {
  const TermAckText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    final textStyle = switch (themeType) {
      InheritedThemeType.material => Theme.of(context).textTheme.bodyMedium,
      InheritedThemeType.cupertino =>
        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            ),
    };

    final linkTextStyle = switch (themeType) {
      InheritedThemeType.material => textStyle?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      InheritedThemeType.cupertino => textStyle?.copyWith(
          color: CupertinoColors.activeBlue,
          fontWeight: FontWeight.bold,
        ),
    };

    return Text.rich(
      i18n.onboarding.ack_term(
        termOfService: (text) => TextSpan(
          text: text,
          style: linkTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final uri =
                  await ref.read(configureTermsOfServiceUriProvider.future);
              if (uri != null) {
                await launchUrl(uri);
              }
            },
        ),
        privacyPolicy: (text) => TextSpan(
          text: text,
          style: linkTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final uri =
                  await ref.read(configurePrivacyPolicyUriProvider.future);
              if (uri != null) {
                await launchUrl(uri);
              }
            },
        ),
      ),
      style: textStyle,
    );
  }
}
