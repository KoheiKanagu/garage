import 'package:flutter/material.dart';

MyProgressIndicator showMyProgressIndicator({
  required BuildContext context,
  WidgetBuilder? builder,
}) {
  showAdaptiveDialog<void>(
    context: context,
    builder: builder ??
        (context) => const AlertDialog.adaptive(
              title: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
    barrierDismissible: false,
  );

  return MyProgressIndicator(context);
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
