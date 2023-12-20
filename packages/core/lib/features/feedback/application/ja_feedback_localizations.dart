import 'dart:ui';

import 'package:feedback/feedback.dart';

/// https://github.com/ueman/feedback/pull/261 がマージされたら不要
class JaFeedbackLocalizations extends FeedbackLocalizations {
  /// Creates a [JaFeedbackLocalizations].
  const JaFeedbackLocalizations();

  @override
  String get submitButtonText => '送信';

  @override
  String get feedbackDescriptionText => '何がありましたか？';

  @override
  String get draw => '描く';

  @override
  String get navigate => 'ナビゲート';
}

class CustomFeedbackLocalizationsDelegate
    extends GlobalFeedbackLocalizationsDelegate {
  @override
  Map<Locale, FeedbackLocalizations> get supportedLocales => {
        ...super.supportedLocales,
        const Locale('ja'): const JaFeedbackLocalizations(),
      };
}
