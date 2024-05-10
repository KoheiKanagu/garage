import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_body.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_cancel_button.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_menu_button.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_save_button.dart';

class HashtagsPage extends HookConsumerWidget {
  const HashtagsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => Scaffold(
          appBar: AppBar(
            leadingWidth: double.infinity,
            leading: ref.watch(hashtagsEditControllerProvider)
                ? const HashtagsPageCancelButton()
                : null,
            actions: [
              if (ref.watch(hashtagsEditControllerProvider))
                const HashtagsPageSaveButton()
              else
                const HashtagsPageMenuButton(),
            ],
          ),
          body: const HashtagsPageBody(),
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: ref.watch(hashtagsEditControllerProvider)
                ? const HashtagsPageCancelButton()
                : null,
            trailing: ref.watch(hashtagsEditControllerProvider)
                ? const HashtagsPageSaveButton()
                : const HashtagsPageMenuButton(),
          ),
          child: const HashtagsPageBody(),
        ),
    };
  }
}
