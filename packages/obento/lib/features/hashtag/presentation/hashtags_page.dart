import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as core_i18n;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_body.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_cancel_button.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_menu_button.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_save_button.dart';
import 'package:obento/gen/strings.g.dart';

class HashtagsPage extends HookConsumerWidget {
  const HashtagsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    final isEditMode = ref.watch(hashtagsEditControllerProvider) != null;

    Scaffold wrapScaffold({
      required AppBar? appBar,
      required Widget body,
    }) =>
        Scaffold(
          appBar: appBar,
          body: body,
          floatingActionButton: Visibility(
            visible: !isEditMode,
            child: const _FloatingActionButton(),
          ),
          bottomNavigationBar: const SafeArea(
            child: MyAdaptiveBannerAd(),
          ),
          extendBody: true,
        );

    return switch (themeType) {
      InheritedThemeType.material => wrapScaffold(
          appBar: AppBar(
            leadingWidth: double.infinity,
            leading: isEditMode ? const HashtagsPageCancelButton() : null,
            actions: [
              if (isEditMode)
                const HashtagsPageSaveButton()
              else
                const HashtagsPageMenuButton(),
            ],
          ),
          body: const HashtagsPageBody(),
        ),
      InheritedThemeType.cupertino => wrapScaffold(
          appBar: null,
          body: CupertinoPageScaffold(
            backgroundColor:
                CupertinoColors.systemGroupedBackground.resolveFrom(context),
            navigationBar: CupertinoNavigationBar(
              leading: isEditMode ? const HashtagsPageCancelButton() : null,
              trailing: isEditMode
                  ? const HashtagsPageSaveButton()
                  : const HashtagsPageMenuButton(),
            ),
            child: const HashtagsPageBody(),
          ),
        ),
    };
  }
}

class _FloatingActionButton extends HookConsumerWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onPreview() async {
      final value = await ref.watch(hashtagPreviewProvider.future);
      await HapticFeedback.mediumImpact();

      if (context.mounted) {
        if (value.isEmpty) {
          await showOkAlertDialog(
            context: context,
            title: i18n.not_selected,
          );
          return;
        }

        final result = await showOkCancelAlertDialog(
          context: context,
          okLabel: core_i18n.i18n.copy,
          cancelLabel: core_i18n.i18n.close,
          message: value,
        );

        if (result == OkCancelResult.ok) {
          await HapticFeedback.heavyImpact();
          await Clipboard.setData(
            ClipboardData(
              text: value,
            ),
          );

          if (context.mounted) {
            await showOkAlertDialog(
              context: context,
              title: core_i18n.i18n.copied_to_clipboard,
            );
          }
        }
      }
    }

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => FloatingActionButton.extended(
          onPressed: onPreview,
          label: Text(i18n.preview),
        ),
      InheritedThemeType.cupertino => CupertinoButton.filled(
          padding: const EdgeInsets.all(16),
          onPressed: onPreview,
          child: Text(
            i18n.preview,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const CupertinoDynamicColor.withBrightness(
                    color: CupertinoColors.white,
                    darkColor: CupertinoColors.black,
                  ).resolveFrom(context),
                ),
          ),
        ),
    };
  }
}
