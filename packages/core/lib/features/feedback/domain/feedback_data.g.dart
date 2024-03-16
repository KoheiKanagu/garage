// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'feedback_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackDataImpl _$$FeedbackDataImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$FeedbackDataImpl',
      json,
      ($checkedConvert) {
        final val = _$FeedbackDataImpl(
          createdBy: $checkedConvert('createdBy', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          deviceInfo: $checkedConvert('deviceInfo',
              (v) => FeedbackDeviceInfo.fromJson(v as Map<String, dynamic>)),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$FeedbackTypeEnumMap, v)),
          notifyByEmail:
              $checkedConvert('notifyByEmail', (v) => v as bool? ?? true),
          notifyByPush:
              $checkedConvert('notifyByPush', (v) => v as bool? ?? true),
          status: $checkedConvert('status', (v) => v ?? FeedbackStatus.open),
          from: $checkedConvert(
              'from',
              (v) =>
                  $enumDecodeNullable(_$FeedbackFromEnumMap, v) ??
                  FeedbackFrom.unknown),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$FeedbackDataImplToJson(_$FeedbackDataImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'email': instance.email,
      'deviceInfo': instance.deviceInfo.toJson(),
      'type': _$FeedbackTypeEnumMap[instance.type]!,
      'notifyByEmail': instance.notifyByEmail,
      'notifyByPush': instance.notifyByPush,
      'status': instance.status,
      'from': _$FeedbackFromEnumMap[instance.from]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

const _$FeedbackTypeEnumMap = {
  FeedbackType.impression: 'impression',
  FeedbackType.bugReport: 'bugReport',
  FeedbackType.featureRequest: 'featureRequest',
  FeedbackType.other: 'other',
};

const _$FeedbackFromEnumMap = {
  FeedbackFrom.unknown: 'unknown',
  FeedbackFrom.configure: 'configure',
  FeedbackFrom.shortcut: 'shortcut',
};
