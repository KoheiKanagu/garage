import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locamusic.freezed.dart';
part 'locamusic.g.dart';

@freezed
class Locamusic with _$Locamusic {
  const factory Locamusic({
    @GeoPointConverter() required GeoPoint geoPoint,
    required double distance,
    required String createdBy,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
    @Default(false) bool deleted,
    String? musicId,
    @Default(false) bool allowBuiltInSpeaker,
  }) = _Locamusic;

  factory Locamusic.fromJson(Json json) => _$LocamusicFromJson(json);

  static FromFirestore<Locamusic> get fromFirestore =>
      (snapshot, _) => Locamusic.fromJson(
            snapshot.data() ?? {},
          );

  static ToFirestore<Locamusic> get toFirestore =>
      (data, _) => TimestampConverter.updateServerTimestamp(
            data.toJson(),
          );
}

typedef LocamusicWithDocumentId = ({
  String documentId,
  Locamusic locamusic,
});
