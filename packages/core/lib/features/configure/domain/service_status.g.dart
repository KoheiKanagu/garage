// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'service_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceStatusImpl _$$ServiceStatusImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ServiceStatusImpl',
      json,
      ($checkedConvert) {
        final val = _$ServiceStatusImpl(
          status: $checkedConvert('status',
              (v) => $enumDecodeNullable(_$StatusEnumMap, v) ?? Status.down),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ServiceStatusImplToJson(_$ServiceStatusImpl instance) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.up: 'up',
  Status.down: 'down',
};
