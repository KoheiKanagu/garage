import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/features/hashtag/application/hashtag_search_providers.dart';
import 'package:obento/features/hashtag/presentation/hashtags_edit_mode_list.dart';
import 'package:obento/features/hashtag/presentation/hashtags_list.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_cancel_button.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_menu_button.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_save_button.dart';
import 'package:obento/gen/strings.g.dart';

class HashtagsPageBody extends HookConsumerWidget {
  const HashtagsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);
    final isEditMode = ref.watch(hashtagsEditControllerProvider) != null;

    return switch (themeType) {
      InheritedThemeType.material => isEditMode
          ? Scaffold(
              appBar: AppBar(
                leadingWidth: double.infinity,
                leading: const HashtagsPageCancelButton(),
                actions: const [
                  HashtagsPageSaveButton(),
                ],
              ),
              body: const HashtagsEditModeList(),
            )
          : Scaffold(
              appBar: AppBar(
                leadingWidth: double.infinity,
                actions: const [
                  HashtagsPageMenuButton(),
                ],
                title: const _SearchBar(),
              ),
              body: const SafeArea(
                bottom: false,
                child: HashtagsList(),
              ),
            ),
      InheritedThemeType.cupertino => isEditMode
          ? CupertinoPageScaffold(
              backgroundColor:
                  CupertinoColors.systemGroupedBackground.resolveFrom(context),
              navigationBar: const CupertinoNavigationBar(
                leading: HashtagsPageCancelButton(),
                trailing: HashtagsPageSaveButton(),
              ),
              child: const SafeArea(
                bottom: false,
                child: HashtagsEditModeList(),
              ),
            )
          : CupertinoPageScaffold(
              child: CustomScrollView(
                slivers: [
                  CupertinoSliverNavigationBar(
                    largeTitle: LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          width: constraints.maxWidth - 16,
                          child: const _SearchBar(),
                        );
                      },
                    ),
                    trailing: const HashtagsPageMenuButton(),
                  ),
                  const SliverFillRemaining(
                    child: HashtagsList(),
                  ),
                ],
              ),
            )
    };
  }
}

class _SearchBar extends HookConsumerWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = ref.watch(hashtagsEditControllerProvider) != null;
    if (isEditMode) {
      return const SizedBox.shrink();
    }

    final themeType = InheritedThemeDetector.of(context);

    final searchTextController =
        ref.watch(hashtagSearchTextEditingControllerProvider);
    final hasSearchText =
        ref.watch(hashtagSearchTextProvider)?.isNotEmpty ?? false;

    return switch (themeType) {
      InheritedThemeType.material => SearchBar(
          controller: searchTextController,
          leading: const Icon(Icons.search),
          hintText: i18n.search,
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
          constraints: const BoxConstraints(
            minWidth: 360,
            maxWidth: 800,
            minHeight: 44,
          ),
          trailing: [
            Visibility(
              visible: hasSearchText,
              child: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: searchTextController.clear,
              ),
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoSearchTextField(
          controller: searchTextController,
        ),
    };
  }
}
