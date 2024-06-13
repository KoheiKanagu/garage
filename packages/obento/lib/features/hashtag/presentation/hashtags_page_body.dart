import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
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

    final searchTextController = useTextEditingController(
      text: ref.watch(hashtagSearchTextControllerProvider),
      keys: [context],
    );

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
                title: _SearchBar(
                  searchTextController,
                ),
              ),
              body: const HashtagsList(),
            ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          backgroundColor:
              CupertinoColors.systemGroupedBackground.resolveFrom(context),
          child: isEditMode
              ? CupertinoPageScaffold(
                  backgroundColor:
                      CupertinoColors.systemBackground.resolveFrom(context),
                  navigationBar: const CupertinoNavigationBar(
                    leading: HashtagsPageCancelButton(),
                    trailing: HashtagsPageSaveButton(),
                  ),
                  child: const HashtagsEditModeList(),
                )
              : NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    CupertinoSliverNavigationBar(
                      largeTitle: LayoutBuilder(
                        builder: (context, constrained) => SizedBox(
                          width: constrained.maxWidth - 16,
                          child: _SearchBar(
                            searchTextController,
                          ),
                        ),
                      ),
                      trailing: const HashtagsPageMenuButton(),
                    ),
                  ],
                  body: const HashtagsList(),
                ),
        ),
    };
  }
}

class _SearchBar extends HookConsumerWidget {
  const _SearchBar(
    this.searchTextController,
  );

  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = ref.watch(hashtagsEditControllerProvider) != null;
    if (isEditMode) {
      return const SizedBox.shrink();
    }

    final themeType = InheritedThemeDetector.of(context);

    final hasSearchText = useState(false);

    useEffect(
      () {
        searchTextController.addListener(
          () {
            hasSearchText.value = searchTextController.text.isNotEmpty;
          },
        );
        return null;
      },
      [context],
    );

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
              visible: hasSearchText.value,
              child: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: searchTextController.clear,
              ),
            ),
          ],
          onChanged:
              ref.watch(hashtagSearchTextControllerProvider.notifier).onChanged,
        ),
      InheritedThemeType.cupertino => CupertinoSearchTextField(
          controller: searchTextController,
          onChanged:
              ref.watch(hashtagSearchTextControllerProvider.notifier).onChanged,
        ),
    };
  }
}
