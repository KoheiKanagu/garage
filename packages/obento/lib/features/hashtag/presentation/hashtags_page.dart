import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    void onPreview() {}

    return switch (themeType) {
      InheritedThemeType.material => Scaffold(
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
          floatingActionButton: FloatingActionButton.extended(
            onPressed: onPreview,
            label: Text(i18n.preview),
          ),
        ),
      InheritedThemeType.cupertino => Scaffold(
          floatingActionButton: CupertinoButton.filled(
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
