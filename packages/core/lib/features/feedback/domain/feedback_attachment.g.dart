// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'feedback_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackAttachmentImpl _$$FeedbackAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$FeedbackAttachmentImpl',
      json,
      ($checkedConvert) {
        final val = _$FeedbackAttachmentImpl(
          contentType: $checkedConvert('contentType', (v) => v as String),
          value: $checkedConvert('value', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$FeedbackAttachmentImplToJson(
        _$FeedbackAttachmentImpl instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
      'value': instance.value,
    };
