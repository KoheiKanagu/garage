// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'locamusic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocamusicImpl _$$LocamusicImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LocamusicImpl',
      json,
      ($checkedConvert) {
        final val = _$LocamusicImpl(
          geoPoint: $checkedConvert(
              'geoPoint', (v) => const GeoPointConverter().fromJson(v)),
          distance: $checkedConvert('distance', (v) => (v as num).toDouble()),
          createdBy: $checkedConvert('createdBy', (v) => v as String),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          deleted: $checkedConvert('deleted', (v) => v as bool? ?? false),
          musicId: $checkedConvert('musicId', (v) => v as String?),
          allowBuiltInSpeaker: $checkedConvert(
              'allowBuiltInSpeaker', (v) => v as bool? ?? false),
        );
        return val;
      },
    );

Map<String, dynamic> _$$LocamusicImplToJson(_$LocamusicImpl instance) =>
    <String, dynamic>{
      'geoPoint': const GeoPointConverter().toJson(instance.geoPoint),
      'distance': instance.distance,
      'createdBy': instance.createdBy,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deleted': instance.deleted,
      'musicId': instance.musicId,
      'allowBuiltInSpeaker': instance.allowBuiltInSpeaker,
    };
