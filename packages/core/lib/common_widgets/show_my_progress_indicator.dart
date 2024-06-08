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
  MyProgressIndicator(
    BuildContext context,
  ) : state = Navigator.of(
          context,
          rootNavigator: true,
        );

  final NavigatorState state;

  void dismiss() {
    state.pop();
  }
}
