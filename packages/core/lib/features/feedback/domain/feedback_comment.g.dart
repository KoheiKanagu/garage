// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'feedback_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackCommentImpl _$$FeedbackCommentImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$FeedbackCommentImpl',
      json,
      ($checkedConvert) {
        final val = _$FeedbackCommentImpl(
          createdBy: $checkedConvert('createdBy', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as String?),
          feedbackId: $checkedConvert('feedbackId', (v) => v as String?),
          createdAt: $checkedConvert(
              'createdAt', (v) => const TimestampConverter().fromJson(v)),
          updatedAt: $checkedConvert(
              'updatedAt', (v) => const TimestampConverter().fromJson(v)),
          attachments: $checkedConvert(
              'attachments',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => const UriDataConverter().fromJson(e as String))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$$FeedbackCommentImplToJson(
        _$FeedbackCommentImpl instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'message': instance.message,
      'feedbackId': instance.feedbackId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'attachments':
          instance.attachments.map(const UriDataConverter().toJson).toList(),
    };
