import 'package:core/constants/typedefs.dart';
import 'package:core/utils/uri_data_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_attachment.freezed.dart';
part 'feedback_attachment.g.dart';

@freezed
class FeedbackAttachment with _$FeedbackAttachment {
  /// https://nodemailer.com/message/attachments/
  const factory FeedbackAttachment({
    @UriDataConverter() required UriData path,
  }) = _FeedbackAttachment;

  factory FeedbackAttachment.fromJson(Json json) =>
      _$FeedbackAttachmentFromJson(json);
}
