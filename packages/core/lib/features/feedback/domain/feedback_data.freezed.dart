// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackData _$FeedbackDataFromJson(Map<String, dynamic> json) {
  return _FeedbackData.fromJson(json);
}

/// @nodoc
mixin _$FeedbackData {
  String? get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  FeedbackDeviceInfo get deviceInfo => throw _privateConstructorUsedError;
  FeedbackType get type => throw _privateConstructorUsedError;
  String get screenshotBase64 => throw _privateConstructorUsedError;
  FeedbackFrom get from => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedbackDataCopyWith<FeedbackData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackDataCopyWith<$Res> {
  factory $FeedbackDataCopyWith(
          FeedbackData value, $Res Function(FeedbackData) then) =
      _$FeedbackDataCopyWithImpl<$Res, FeedbackData>;
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String message,
      FeedbackDeviceInfo deviceInfo,
      FeedbackType type,
      String screenshotBase64,
      FeedbackFrom from,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt});

  $FeedbackDeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class _$FeedbackDataCopyWithImpl<$Res, $Val extends FeedbackData>
    implements $FeedbackDataCopyWith<$Res> {
  _$FeedbackDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? message = null,
    Object? deviceInfo = null,
    Object? type = null,
    Object? screenshotBase64 = null,
    Object? from = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as FeedbackDeviceInfo,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      screenshotBase64: null == screenshotBase64
          ? _value.screenshotBase64
          : screenshotBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as FeedbackFrom,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeedbackDeviceInfoCopyWith<$Res> get deviceInfo {
    return $FeedbackDeviceInfoCopyWith<$Res>(_value.deviceInfo, (value) {
      return _then(_value.copyWith(deviceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedbackDataImplCopyWith<$Res>
    implements $FeedbackDataCopyWith<$Res> {
  factory _$$FeedbackDataImplCopyWith(
          _$FeedbackDataImpl value, $Res Function(_$FeedbackDataImpl) then) =
      __$$FeedbackDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String message,
      FeedbackDeviceInfo deviceInfo,
      FeedbackType type,
      String screenshotBase64,
      FeedbackFrom from,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt});

  @override
  $FeedbackDeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class __$$FeedbackDataImplCopyWithImpl<$Res>
    extends _$FeedbackDataCopyWithImpl<$Res, _$FeedbackDataImpl>
    implements _$$FeedbackDataImplCopyWith<$Res> {
  __$$FeedbackDataImplCopyWithImpl(
      _$FeedbackDataImpl _value, $Res Function(_$FeedbackDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? message = null,
    Object? deviceInfo = null,
    Object? type = null,
    Object? screenshotBase64 = null,
    Object? from = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FeedbackDataImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as FeedbackDeviceInfo,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      screenshotBase64: null == screenshotBase64
          ? _value.screenshotBase64
          : screenshotBase64 // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as FeedbackFrom,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackDataImpl implements _FeedbackData {
  const _$FeedbackDataImpl(
      {required this.uid,
      required this.email,
      required this.message,
      required this.deviceInfo,
      required this.type,
      this.screenshotBase64 = '',
      this.from = FeedbackFrom.unknown,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt});

  factory _$FeedbackDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackDataImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? email;
  @override
  final String message;
  @override
  final FeedbackDeviceInfo deviceInfo;
  @override
  final FeedbackType type;
  @override
  @JsonKey()
  final String screenshotBase64;
  @override
  @JsonKey()
  final FeedbackFrom from;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;

  @override
  String toString() {
    return 'FeedbackData(uid: $uid, email: $email, message: $message, deviceInfo: $deviceInfo, type: $type, screenshotBase64: $screenshotBase64, from: $from, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackDataImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.screenshotBase64, screenshotBase64) ||
                other.screenshotBase64 == screenshotBase64) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, message, deviceInfo,
      type, screenshotBase64, from, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackDataImplCopyWith<_$FeedbackDataImpl> get copyWith =>
      __$$FeedbackDataImplCopyWithImpl<_$FeedbackDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackDataImplToJson(
      this,
    );
  }
}

abstract class _FeedbackData implements FeedbackData {
  const factory _FeedbackData(
      {required final String? uid,
      required final String? email,
      required final String message,
      required final FeedbackDeviceInfo deviceInfo,
      required final FeedbackType type,
      final String screenshotBase64,
      final FeedbackFrom from,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt}) = _$FeedbackDataImpl;

  factory _FeedbackData.fromJson(Map<String, dynamic> json) =
      _$FeedbackDataImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get email;
  @override
  String get message;
  @override
  FeedbackDeviceInfo get deviceInfo;
  @override
  FeedbackType get type;
  @override
  String get screenshotBase64;
  @override
  FeedbackFrom get from;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$FeedbackDataImplCopyWith<_$FeedbackDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
