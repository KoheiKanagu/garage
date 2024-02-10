import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FeedbackType {
  impression,
  bugReport,
  featureRequest,
  other,
  ;

  String get localizedString => switch (this) {
        FeedbackType.impression => i18n.feedback.type.impression,
        FeedbackType.bugReport => i18n.feedback.type.bug_report,
        FeedbackType.featureRequest => i18n.feedback.type.feature_request,
        FeedbackType.other => i18n.feedback.type.other,
      };

  Icon get icon => switch (this) {
        FeedbackType.impression => const Icon(
            Icons.star,
            color: Colors.orange,
          ),
        FeedbackType.bugReport => const Icon(
            Icons.error,
            color: Colors.red,
          ),
        FeedbackType.featureRequest => const Icon(
            Icons.lightbulb,
            color: Colors.blue,
          ),
        FeedbackType.other => const Icon(
            Icons.help,
            color: Colors.grey,
          ),
      };

  Icon get iconCupertino => switch (this) {
        FeedbackType.impression => const Icon(
            CupertinoIcons.star_fill,
            color: Colors.orange,
          ),
        FeedbackType.bugReport => const Icon(
            CupertinoIcons.exclamationmark_circle_fill,
            color: Colors.red,
          ),
        FeedbackType.featureRequest => const Icon(
            CupertinoIcons.lightbulb_fill,
            color: Colors.blue,
          ),
        FeedbackType.other => const Icon(
            CupertinoIcons.question_circle_fill,
            color: Colors.grey,
          ),
      };
}
