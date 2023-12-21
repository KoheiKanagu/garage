import 'package:core/features/feedback/application/ja_feedback_localizations.dart';
import 'package:core/features/feedback/presentation/my_feedback_sheet.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';

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
      feedbackBuilder: (_, submit, scrollController) {
        return MyFeedbackSheet(
          onSubmit: (data) {
            submit(
              '',
              extras: {
                'data': data,
              },
            );
          },
          scrollController: scrollController,
        );
      },
      child: child,
    );
  }
}
