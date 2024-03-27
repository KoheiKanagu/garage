import 'package:core/features/feedback/domain/feedback_comment.dart';
import 'package:core/features/feedback/domain/feedback_data.dart';

class FeedbackExtras {
  const FeedbackExtras({
    required this.feedbackData,
    required this.feedbackComment,
    required this.attachScreenshot,
  });

  factory FeedbackExtras.fromMap(Map<String, dynamic> map) {
    return FeedbackExtras(
      feedbackData: map['feedbackData'] as FeedbackData,
      feedbackComment: map['feedbackComment'] as FeedbackComment,
      attachScreenshot: map['attachScreenshot'] as bool,
    );
  }

  final FeedbackData feedbackData;

  final FeedbackComment feedbackComment;

  final bool attachScreenshot;

  Map<String, dynamic> toMap() => {
        'feedbackData': feedbackData,
        'feedbackComment': feedbackComment,
        'attachScreenshot': attachScreenshot,
      };
}
