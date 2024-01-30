import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackBugReportCheckBox extends HookConsumerWidget {
  const MyFeedbackBugReportCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Container(),
      InheritedThemeType.cupertino => CupertinoFormSection.insetGrouped(
          children: [
            CupertinoFormRow(
              child: CupertinoPicker(
                itemExtent: 32,
                onSelectedItemChanged: (value) {},
                children: const [],
              ),
              // child: Text('不具合を報告します'),
            ),
          ],
        ),
    };
  }
}
