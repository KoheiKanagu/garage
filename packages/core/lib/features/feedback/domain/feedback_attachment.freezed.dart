// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackAttachment _$FeedbackAttachmentFromJson(Map<String, dynamic> json) {
  return _FeedbackAttachment.fromJson(json);
}

/// @nodoc
mixin _$FeedbackAttachment {
  @UriDataConverter()
  UriData get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackAttachmentCopyWith<FeedbackAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackAttachmentCopyWith<$Res> {
  factory $FeedbackAttachmentCopyWith(
          FeedbackAttachment value, $Res Function(FeedbackAttachment) then) =
      _$FeedbackAttachmentCopyWithImpl<$Res, FeedbackAttachment>;
  @useResult
  $Res call({@UriDataConverter() UriData path});
}

/// @nodoc
class _$FeedbackAttachmentCopyWithImpl<$Res, $Val extends FeedbackAttachment>
    implements $FeedbackAttachmentCopyWith<$Res> {
  _$FeedbackAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as UriData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackAttachmentImplCopyWith<$Res>
    implements $FeedbackAttachmentCopyWith<$Res> {
  factory _$$FeedbackAttachmentImplCopyWith(_$FeedbackAttachmentImpl value,
          $Res Function(_$FeedbackAttachmentImpl) then) =
      __$$FeedbackAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@UriDataConverter() UriData path});
}

/// @nodoc
class __$$FeedbackAttachmentImplCopyWithImpl<$Res>
    extends _$FeedbackAttachmentCopyWithImpl<$Res, _$FeedbackAttachmentImpl>
    implements _$$FeedbackAttachmentImplCopyWith<$Res> {
  __$$FeedbackAttachmentImplCopyWithImpl(_$FeedbackAttachmentImpl _value,
      $Res Function(_$FeedbackAttachmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$FeedbackAttachmentImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as UriData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackAttachmentImpl implements _FeedbackAttachment {
  const _$FeedbackAttachmentImpl({@UriDataConverter() required this.path});

  factory _$FeedbackAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackAttachmentImplFromJson(json);

  @override
  @UriDataConverter()
  final UriData path;

  @override
  String toString() {
    return 'FeedbackAttachment(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackAttachmentImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackAttachmentImplCopyWith<_$FeedbackAttachmentImpl> get copyWith =>
      __$$FeedbackAttachmentImplCopyWithImpl<_$FeedbackAttachmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackAttachmentImplToJson(
      this,
    );
  }
}

abstract class _FeedbackAttachment implements FeedbackAttachment {
  const factory _FeedbackAttachment(
          {@UriDataConverter() required final UriData path}) =
      _$FeedbackAttachmentImpl;

  factory _FeedbackAttachment.fromJson(Map<String, dynamic> json) =
      _$FeedbackAttachmentImpl.fromJson;

  @override
  @UriDataConverter()
  UriData get path;
  @override
  @JsonKey(ignore: true)
  _$$FeedbackAttachmentImplCopyWith<_$FeedbackAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
