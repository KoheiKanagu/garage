import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geomusic.freezed.dart';
part 'geomusic.g.dart';

@freezed
class Geomusic with _$Geomusic {
  const factory Geomusic({
    @GeoPointConverter() required GeoPoint geoPoint,
    required double distance,
    required String musicId,
    required String createdBy,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @Default(false) bool deleted,
  }) = _Geomusic;

  factory Geomusic.fromJson(Json json) => _$GeomusicFromJson(json);

  static FromFirestore<Geomusic> get fromFirestore =>
      (snapshot, _) => Geomusic.fromJson(
            snapshot.data() ?? {},
          );

  static ToFirestore<Geomusic> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(
            data.toJson(),
          );
}
