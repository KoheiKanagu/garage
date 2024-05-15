import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';

class HashtagsPageSaveButton extends HookConsumerWidget {
  const HashtagsPageSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => TextButton(
          onPressed: () {
            ref.watch(hashtagsEditControllerProvider.notifier).save();
          },
          child: Text(i18n.save),
        ),
      InheritedThemeType.cupertino => CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(i18n.done),
          onPressed: () {
            ref.watch(hashtagsEditControllerProvider.notifier).save();
          },
        ),
    };
  }
}
