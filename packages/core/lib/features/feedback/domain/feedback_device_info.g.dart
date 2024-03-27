// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'feedback_device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackDeviceInfoImpl _$$FeedbackDeviceInfoImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$FeedbackDeviceInfoImpl',
      json,
      ($checkedConvert) {
        final val = _$FeedbackDeviceInfoImpl(
          osVersion: $checkedConvert('osVersion', (v) => v as String),
          modelName: $checkedConvert('modelName', (v) => v as String),
          locale: $checkedConvert('locale', (v) => v as String),
          appVersion: $checkedConvert('appVersion', (v) => v as String),
          appPackageName: $checkedConvert('appPackageName', (v) => v as String),
          appName: $checkedConvert('appName', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$FeedbackDeviceInfoImplToJson(
        _$FeedbackDeviceInfoImpl instance) =>
    <String, dynamic>{
      'osVersion': instance.osVersion,
      'modelName': instance.modelName,
      'locale': instance.locale,
      'appVersion': instance.appVersion,
      'appPackageName': instance.appPackageName,
      'appName': instance.appName,
    };
