// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackComment _$FeedbackCommentFromJson(Map<String, dynamic> json) {
  return _FeedbackComment.fromJson(json);
}

/// @nodoc
mixin _$FeedbackComment {
  /// だれがコメントしたか
  /// サインアウト後のフィードバックの場合はnull
  /// サポートからのコメントの場合は"support"
  String? get createdBy => throw _privateConstructorUsedError;

  /// メッセージ
  String? get message => throw _privateConstructorUsedError;

  /// [FeedbackData] のDocumentID
  String? get feedbackId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;

  /// 添付ファイル
  @UriDataConverter()
  List<UriData> get attachments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackCommentCopyWith<FeedbackComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCommentCopyWith<$Res> {
  factory $FeedbackCommentCopyWith(
          FeedbackComment value, $Res Function(FeedbackComment) then) =
      _$FeedbackCommentCopyWithImpl<$Res, FeedbackComment>;
  @useResult
  $Res call(
      {String? createdBy,
      String? message,
      String? feedbackId,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @UriDataConverter() List<UriData> attachments});
}

/// @nodoc
class _$FeedbackCommentCopyWithImpl<$Res, $Val extends FeedbackComment>
    implements $FeedbackCommentCopyWith<$Res> {
  _$FeedbackCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? message = freezed,
    Object? feedbackId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? attachments = null,
  }) {
    return _then(_value.copyWith(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackId: freezed == feedbackId
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<UriData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackCommentImplCopyWith<$Res>
    implements $FeedbackCommentCopyWith<$Res> {
  factory _$$FeedbackCommentImplCopyWith(_$FeedbackCommentImpl value,
          $Res Function(_$FeedbackCommentImpl) then) =
      __$$FeedbackCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? createdBy,
      String? message,
      String? feedbackId,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      @UriDataConverter() List<UriData> attachments});
}

/// @nodoc
class __$$FeedbackCommentImplCopyWithImpl<$Res>
    extends _$FeedbackCommentCopyWithImpl<$Res, _$FeedbackCommentImpl>
    implements _$$FeedbackCommentImplCopyWith<$Res> {
  __$$FeedbackCommentImplCopyWithImpl(
      _$FeedbackCommentImpl _value, $Res Function(_$FeedbackCommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? message = freezed,
    Object? feedbackId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? attachments = null,
  }) {
    return _then(_$FeedbackCommentImpl(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackId: freezed == feedbackId
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<UriData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackCommentImpl implements _FeedbackComment {
  const _$FeedbackCommentImpl(
      {required this.createdBy,
      this.message,
      this.feedbackId,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      @UriDataConverter() final List<UriData> attachments = const []})
      : _attachments = attachments;

  factory _$FeedbackCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackCommentImplFromJson(json);

  /// だれがコメントしたか
  /// サインアウト後のフィードバックの場合はnull
  /// サポートからのコメントの場合は"support"
  @override
  final String? createdBy;

  /// メッセージ
  @override
  final String? message;

  /// [FeedbackData] のDocumentID
  @override
  final String? feedbackId;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;

  /// 添付ファイル
  final List<UriData> _attachments;

  /// 添付ファイル
  @override
  @JsonKey()
  @UriDataConverter()
  List<UriData> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'FeedbackComment(createdBy: $createdBy, message: $message, feedbackId: $feedbackId, createdAt: $createdAt, updatedAt: $updatedAt, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackCommentImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.feedbackId, feedbackId) ||
                other.feedbackId == feedbackId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdBy, message, feedbackId,
      createdAt, updatedAt, const DeepCollectionEquality().hash(_attachments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackCommentImplCopyWith<_$FeedbackCommentImpl> get copyWith =>
      __$$FeedbackCommentImplCopyWithImpl<_$FeedbackCommentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackCommentImplToJson(
      this,
    );
  }
}

abstract class _FeedbackComment implements FeedbackComment {
  const factory _FeedbackComment(
          {required final String? createdBy,
          final String? message,
          final String? feedbackId,
          @TimestampConverter() final Timestamp? createdAt,
          @TimestampConverter() final Timestamp? updatedAt,
          @UriDataConverter() final List<UriData> attachments}) =
      _$FeedbackCommentImpl;

  factory _FeedbackComment.fromJson(Map<String, dynamic> json) =
      _$FeedbackCommentImpl.fromJson;

  @override

  /// だれがコメントしたか
  /// サインアウト後のフィードバックの場合はnull
  /// サポートからのコメントの場合は"support"
  String? get createdBy;
  @override

  /// メッセージ
  String? get message;
  @override

  /// [FeedbackData] のDocumentID
  String? get feedbackId;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override

  /// 添付ファイル
  @UriDataConverter()
  List<UriData> get attachments;
  @override
  @JsonKey(ignore: true)
  _$$FeedbackCommentImplCopyWith<_$FeedbackCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
