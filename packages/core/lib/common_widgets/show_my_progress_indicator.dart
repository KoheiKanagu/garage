import 'package:core/constants/global_keys.dart';
import 'package:flutter/material.dart';

MyProgressIndicator showMyProgressIndicator({
  BuildContext? context,
  WidgetBuilder? builder,
}) {
  final ctx = context ?? rootContext()!;

  showAdaptiveDialog<void>(
    context: ctx,
    builder: builder ??
        (context) => const AlertDialog.adaptive(
              title: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
    barrierDismissible: false,
  );

  return MyProgressIndicator(ctx);
}

class MyProgressIndicator {
  MyProgressIndicator(this.context);

  final BuildContext context;

  void dismiss() {
    if (context.mounted) {
      Navigator.of(
        context,
        rootNavigator: true,
      ).pop();
    }
  }
}
