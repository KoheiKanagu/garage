import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_data.freezed.dart';
part 'feedback_data.g.dart';

@freezed
class FeedbackData with _$FeedbackData {
  const factory FeedbackData({
    /// だれがフィードバックしたか
    /// サインアウト後にフィードバックした場合はnull
    required String? createdBy,

    /// ユーザのメールアドレス
    required String? email,

    /// デバイス情報
    required FeedbackDeviceInfo deviceInfo,

    /// フィードバックの種類
    required FeedbackType type,

    /// メールで通知するか
    @Default(true) bool notifyByEmail,

    /// プッシュ通知で通知するか
    @Default(true) bool notifyByPush,

    /// フィードバックのステータス
    @Default(FeedbackStatus.open) FeedbackStatus status,

    /// どこからのフィードバックか
    @Default(FeedbackFrom.unknown) FeedbackFrom from,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
  }) = _FeedbackData;

  factory FeedbackData.fromJson(Json json) => _$FeedbackDataFromJson(json);

  static FromFirestore<FeedbackData> get fromFirestore =>
      (snapshot, _) => FeedbackData.fromJson(
            snapshot.data() ?? {},
          );

  static ToFirestore<FeedbackData> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(
            data.toJson(),
          );
}
