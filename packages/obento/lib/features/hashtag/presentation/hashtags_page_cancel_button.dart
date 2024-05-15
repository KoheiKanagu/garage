import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';

class HashtagsPageCancelButton extends HookConsumerWidget {
  const HashtagsPageCancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => FittedBox(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              ref.watch(hashtagsEditControllerProvider.notifier).cancel();
            },
            child: Text(i18n.cancel),
          ),
        ),
      InheritedThemeType.cupertino => CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            ref.watch(hashtagsEditControllerProvider.notifier).cancel();
          },
          child: Text(i18n.cancel),
        ),
    };
  }
}
