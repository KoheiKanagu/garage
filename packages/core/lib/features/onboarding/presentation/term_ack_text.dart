import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
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
    return Text.rich(
      i18n.onboarding.ack_term(
        termOfService: (text) => TextSpan(
          text: text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
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
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
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
    );
  }
}
