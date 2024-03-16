import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_attachment.freezed.dart';
part 'feedback_attachment.g.dart';

@freezed
class FeedbackAttachment with _$FeedbackAttachment {
  const factory FeedbackAttachment({
    /// 添付ファイルのcontentType
    required String contentType,

    /// base64でエンコードされたファイル
    required String value,
  }) = _FeedbackAttachment;

  factory FeedbackAttachment.fromJson(Json json) =>
      _$FeedbackAttachmentFromJson(json);
}
