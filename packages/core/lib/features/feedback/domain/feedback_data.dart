import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_data.freezed.dart';
part 'feedback_data.g.dart';

@freezed
class FeedbackData with _$FeedbackData {
  const factory FeedbackData({
    required String? uid,
    required String? email,
    required String message,
    required FeedbackDeviceInfo deviceInfo,
    required FeedbackType type,
    @Default('') String screenshotBase64,
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
