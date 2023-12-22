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
          uid: $checkedConvert('uid', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as String),
          deviceInfo: $checkedConvert('deviceInfo',
              (v) => FeedbackDeviceInfo.fromJson(v as Map<String, dynamic>)),
          screenshotBase64:
              $checkedConvert('screenshotBase64', (v) => v as String? ?? ''),
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
      'uid': instance.uid,
      'email': instance.email,
      'message': instance.message,
      'deviceInfo': instance.deviceInfo.toJson(),
      'screenshotBase64': instance.screenshotBase64,
      'from': _$FeedbackFromEnumMap[instance.from]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

const _$FeedbackFromEnumMap = {
  FeedbackFrom.unknown: 'unknown',
  FeedbackFrom.configure: 'configure',
  FeedbackFrom.shortcut: 'shortcut',
};
