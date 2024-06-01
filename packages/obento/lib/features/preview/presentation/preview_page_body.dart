import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/preview/application/preview_providers.dart';
import 'package:obento/gen/assets.gen.dart';
import 'package:share_plus/share_plus.dart';

class PreviewPageBody extends HookConsumerWidget {
  const PreviewPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(hashtagPreviewProvider).value ?? '';
    final themeType = InheritedThemeDetector.of(context);

    final backgroundColor = switch (themeType) {
      InheritedThemeType.material => Theme.of(context).cardColor,
      InheritedThemeType.cupertino =>
        CupertinoTheme.of(context).scaffoldBackgroundColor,
    };

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: Assets.images.appIcon.provider(),
                    ),
                    const Gap(16),
                    Text(value),
                  ],
                ),
              ),
              const Gap(16),
              const Row(
                children: [
                  Expanded(
                    child: _ShareButton(),
                  ),
                  Gap(12),
                  Expanded(
                    child: _CopyButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CopyButton extends HookConsumerWidget {
  const _CopyButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);
    final value = ref.watch(hashtagPreviewProvider).value ?? '';

    Future<void> copy() async {
      await HapticFeedback.heavyImpact();

      await Clipboard.setData(
        ClipboardData(
          text: value,
        ),
      );

      if (context.mounted) {
        await showOkAlertDialog(
          context: context,
          title: i18n.copied_to_clipboard,
        );
      }
    }

    return switch (themeType) {
      InheritedThemeType.material => FilledButton.icon(
          onPressed: copy,
          label: Text(i18n.copy),
          icon: const Icon(Icons.copy),
        ),
      InheritedThemeType.cupertino => CupertinoButton.filled(
          onPressed: copy,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.doc_on_clipboard_fill),
              const Gap(8),
              Text(i18n.copy),
            ],
          ),
        ),
    };
  }
}

class _ShareButton extends HookConsumerWidget {
  const _ShareButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    Future<void> share() async {
      await HapticFeedback.heavyImpact();

      final value = ref.watch(hashtagPreviewProvider).value ?? '';
      await Share.share(value);
    }

    return switch (themeType) {
      InheritedThemeType.material => FilledButton.icon(
          onPressed: share,
          label: Text(i18n.share),
          icon: const Icon(Icons.share),
        ),
      InheritedThemeType.cupertino => CupertinoButton.filled(
          onPressed: share,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.share),
              const Gap(8),
              Text(i18n.share),
            ],
          ),
        ),
    };
  }
}
