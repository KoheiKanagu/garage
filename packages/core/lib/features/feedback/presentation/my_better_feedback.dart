import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quick_actions/quick_actions.dart';

class MyBetterFeedback extends StatelessWidget {
  const MyBetterFeedback({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      mode: FeedbackMode.navigate,
      localizationsDelegates: [
        CustomFeedbackLocalizationsDelegate(),
      ],
      theme: Platform.isIOS
          ? FeedbackThemeData(
              feedbackSheetColor:
                  CupertinoColors.systemGroupedBackground.resolveFrom(context),
              dragHandleColor: CupertinoColors.systemGrey,
            )
          : null,
      feedbackBuilder: (_, submit, scrollController) {
        if (child is CupertinoApp) {
          final app = child as CupertinoApp;

          return CupertinoApp(
            debugShowCheckedModeBanner: app.debugShowCheckedModeBanner,
            supportedLocales: app.supportedLocales,
            localizationsDelegates: app.localizationsDelegates,
            theme: app.theme,
            home: MyFeedbackSheet(
              submit: submit,
              scrollController: scrollController,
            ),
          );
        }

        if (child is MaterialApp) {
          final app = child as MaterialApp;

          return MaterialApp(
            debugShowCheckedModeBanner: app.debugShowCheckedModeBanner,
            supportedLocales: app.supportedLocales,
            localizationsDelegates: app.localizationsDelegates,
            theme: app.theme,
            darkTheme: app.darkTheme,
            home: MyFeedbackSheet(
              submit: submit,
              scrollController: scrollController,
            ),
          );
        }

        throw UnimplementedError();
      },
      child: _Wrap(
        child: child,
      ),
    );
  }
}

class _Wrap extends HookConsumerWidget {
  const _Wrap({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            const QuickActions().initialize(
              (type) async {
                if (type == kFeedbackShortcut) {
                  await Future<void>.delayed(
                    const Duration(milliseconds: 500),
                  );

                  if (context.mounted) {
                    showMyBetterFeedback(
                      context,
                      ref,
                      from: FeedbackFrom.shortcut,
                    );
                  }
                }
              },
            );
          },
        );
        return null;
      },
      [
        'myBetterFeedback',
      ],
    );

    return child;
  }
}

void showMyBetterFeedback(
  BuildContext context,
  WidgetRef ref, {
  required FeedbackFrom from,
}) {
  BetterFeedback.of(context).show(
    (feedback) async {
      final indicator = showMyProgressIndicator();
      try {
        await ref.watch(
          feedbackSubmitProvider(
            feedback,
            feedbackFrom: from,
          ).future,
        );
      } finally {
        indicator.dismiss();
      }

      if (context.mounted) {
        await showOkAlertDialog(
          context: context,
          message: i18n.feedback.thank_you_for_your_feedback,
        );
      }

      if (context.mounted) {
        BetterFeedback.of(context).hide();
      }
    },
  );
}
