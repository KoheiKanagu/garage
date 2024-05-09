// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hashtag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hashtag _$HashtagFromJson(Map<String, dynamic> json) {
  return _Hashtag.fromJson(json);
}

/// @nodoc
mixin _$Hashtag {
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HashtagCopyWith<Hashtag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HashtagCopyWith<$Res> {
  factory $HashtagCopyWith(Hashtag value, $Res Function(Hashtag) then) =
      _$HashtagCopyWithImpl<$Res, Hashtag>;
  @useResult
  $Res call(
      {@TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      List<String> hashtags});
}

/// @nodoc
class _$HashtagCopyWithImpl<$Res, $Val extends Hashtag>
    implements $HashtagCopyWith<$Res> {
  _$HashtagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? hashtags = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      hashtags: null == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HashtagImplCopyWith<$Res> implements $HashtagCopyWith<$Res> {
  factory _$$HashtagImplCopyWith(
          _$HashtagImpl value, $Res Function(_$HashtagImpl) then) =
      __$$HashtagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      List<String> hashtags});
}

/// @nodoc
class __$$HashtagImplCopyWithImpl<$Res>
    extends _$HashtagCopyWithImpl<$Res, _$HashtagImpl>
    implements _$$HashtagImplCopyWith<$Res> {
  __$$HashtagImplCopyWithImpl(
      _$HashtagImpl _value, $Res Function(_$HashtagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? hashtags = null,
  }) {
    return _then(_$HashtagImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      hashtags: null == hashtags
          ? _value._hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HashtagImpl implements _Hashtag {
  const _$HashtagImpl(
      {@TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      final List<String> hashtags = const <String>[]})
      : _hashtags = hashtags;

  factory _$HashtagImpl.fromJson(Map<String, dynamic> json) =>
      _$$HashtagImplFromJson(json);

  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;
  final List<String> _hashtags;
  @override
  @JsonKey()
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  String toString() {
    return 'Hashtag(createdAt: $createdAt, updatedAt: $updatedAt, hashtags: $hashtags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HashtagImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, updatedAt,
      const DeepCollectionEquality().hash(_hashtags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HashtagImplCopyWith<_$HashtagImpl> get copyWith =>
      __$$HashtagImplCopyWithImpl<_$HashtagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HashtagImplToJson(
      this,
    );
  }
}

abstract class _Hashtag implements Hashtag {
  const factory _Hashtag(
      {@TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt,
      final List<String> hashtags}) = _$HashtagImpl;

  factory _Hashtag.fromJson(Map<String, dynamic> json) = _$HashtagImpl.fromJson;

  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  List<String> get hashtags;
  @override
  @JsonKey(ignore: true)
  _$$HashtagImplCopyWith<_$HashtagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
