// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'geomusic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeomusicImpl _$$GeomusicImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GeomusicImpl',
      json,
      ($checkedConvert) {
        final val = _$GeomusicImpl(
          geoPoint: $checkedConvert(
              'geoPoint', (v) => const GeoPointConverter().fromJson(v)),
          distance: $checkedConvert('distance', (v) => (v as num).toDouble()),
          musicId: $checkedConvert('musicId', (v) => v as String),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          deleted: $checkedConvert('deleted', (v) => v as bool? ?? false),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GeomusicImplToJson(_$GeomusicImpl instance) =>
    <String, dynamic>{
      'geoPoint': const GeoPointConverter().toJson(instance.geoPoint),
      'distance': instance.distance,
      'musicId': instance.musicId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'deleted': instance.deleted,
    };
