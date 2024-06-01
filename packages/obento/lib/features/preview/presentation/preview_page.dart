import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/preview/presentation/preview_page_body.dart';
import 'package:obento/gen/strings.g.dart';

class PreviewPage extends HookConsumerWidget {
  const PreviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    switch (themeType) {
      case InheritedThemeType.material:
        return Scaffold(
          appBar: AppBar(
            title: Text(i18n.preview),
          ),
          body: const PreviewPageBody(),
        );
      case InheritedThemeType.cupertino:
        return CupertinoPageScaffold(
          backgroundColor:
              CupertinoColors.systemGroupedBackground.resolveFrom(context),
          navigationBar: CupertinoNavigationBar(
            middle: Text(i18n.preview),
          ),
          child: const PreviewPageBody(),
        );
    }
  }
}
