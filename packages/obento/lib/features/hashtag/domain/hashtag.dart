import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hashtag.freezed.dart';
part 'hashtag.g.dart';

@freezed
class Hashtag with _$Hashtag {
  const factory Hashtag({
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @Default(<String>[]) List<String> hashtags,
  }) = _Hashtag;

  factory Hashtag.fromJson(Json json) => _$HashtagFromJson(json);

  static FromFirestore<Hashtag> get fromFirestore =>
      (snapshot, _) => Hashtag.fromJson(
            snapshot.data() ?? {},
          );

  static ToFirestore<Hashtag> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(
            data.toJson(),
          );
}
