import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:core/features/feedback/domain/feedback_attachment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_comment.freezed.dart';
part 'feedback_comment.g.dart';

@freezed
class FeedbackComment with _$FeedbackComment {
  const factory FeedbackComment({
    /// だれがコメントしたか
    /// サインアウト後のフィードバックの場合はnull
    /// サポートからのコメントの場合は"support"
    required String? createdBy,

    /// メッセージ
    required String message,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,

    /// 添付ファイル
    @Default([]) List<FeedbackAttachment> attachments,
  }) = _FeedbackComment;

  factory FeedbackComment.fromJson(Json json) =>
      _$FeedbackCommentFromJson(json);

  static FromFirestore<FeedbackComment> get fromFirestore =>
      (snapshot, _) => FeedbackComment.fromJson(
            snapshot.data() ?? {},
          );

  static ToFirestore<FeedbackComment> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(
            data.toJson(),
          );
}
