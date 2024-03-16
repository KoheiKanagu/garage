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
  /// だれがフィードバックしたか
  /// サインアウト後にフィードバックした場合はnull
  String? get createdBy => throw _privateConstructorUsedError;

  /// ユーザのメールアドレス
  String? get email => throw _privateConstructorUsedError;

  /// デバイス情報
  FeedbackDeviceInfo get deviceInfo => throw _privateConstructorUsedError;

  /// フィードバックの種類
  FeedbackType get type => throw _privateConstructorUsedError;

  /// メールで通知するか
  bool get notifyByEmail => throw _privateConstructorUsedError;

  /// プッシュ通知で通知するか
  bool get notifyByPush => throw _privateConstructorUsedError;

  /// フィードバックのステータス
  dynamic get status => throw _privateConstructorUsedError;

  /// どこからのフィードバックか
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
      {String? createdBy,
      String? email,
      FeedbackDeviceInfo deviceInfo,
      FeedbackType type,
      bool notifyByEmail,
      bool notifyByPush,
      dynamic status,
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
    Object? createdBy = freezed,
    Object? email = freezed,
    Object? deviceInfo = null,
    Object? type = null,
    Object? notifyByEmail = null,
    Object? notifyByPush = null,
    Object? status = freezed,
    Object? from = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as FeedbackDeviceInfo,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      notifyByEmail: null == notifyByEmail
          ? _value.notifyByEmail
          : notifyByEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyByPush: null == notifyByPush
          ? _value.notifyByPush
          : notifyByPush // ignore: cast_nullable_to_non_nullable
              as bool,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      {String? createdBy,
      String? email,
      FeedbackDeviceInfo deviceInfo,
      FeedbackType type,
      bool notifyByEmail,
      bool notifyByPush,
      dynamic status,
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
    Object? createdBy = freezed,
    Object? email = freezed,
    Object? deviceInfo = null,
    Object? type = null,
    Object? notifyByEmail = null,
    Object? notifyByPush = null,
    Object? status = freezed,
    Object? from = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FeedbackDataImpl(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as FeedbackDeviceInfo,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      notifyByEmail: null == notifyByEmail
          ? _value.notifyByEmail
          : notifyByEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyByPush: null == notifyByPush
          ? _value.notifyByPush
          : notifyByPush // ignore: cast_nullable_to_non_nullable
              as bool,
      status: freezed == status ? _value.status! : status,
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
      {required this.createdBy,
      required this.email,
      required this.deviceInfo,
      required this.type,
      this.notifyByEmail = true,
      this.notifyByPush = true,
      this.status = FeedbackStatus.open,
      this.from = FeedbackFrom.unknown,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt});

  factory _$FeedbackDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackDataImplFromJson(json);

  /// だれがフィードバックしたか
  /// サインアウト後にフィードバックした場合はnull
  @override
  final String? createdBy;

  /// ユーザのメールアドレス
  @override
  final String? email;

  /// デバイス情報
  @override
  final FeedbackDeviceInfo deviceInfo;

  /// フィードバックの種類
  @override
  final FeedbackType type;

  /// メールで通知するか
  @override
  @JsonKey()
  final bool notifyByEmail;

  /// プッシュ通知で通知するか
  @override
  @JsonKey()
  final bool notifyByPush;

  /// フィードバックのステータス
  @override
  @JsonKey()
  final dynamic status;

  /// どこからのフィードバックか
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
    return 'FeedbackData(createdBy: $createdBy, email: $email, deviceInfo: $deviceInfo, type: $type, notifyByEmail: $notifyByEmail, notifyByPush: $notifyByPush, status: $status, from: $from, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackDataImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.notifyByEmail, notifyByEmail) ||
                other.notifyByEmail == notifyByEmail) &&
            (identical(other.notifyByPush, notifyByPush) ||
                other.notifyByPush == notifyByPush) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdBy,
      email,
      deviceInfo,
      type,
      notifyByEmail,
      notifyByPush,
      const DeepCollectionEquality().hash(status),
      from,
      createdAt,
      updatedAt);

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
      {required final String? createdBy,
      required final String? email,
      required final FeedbackDeviceInfo deviceInfo,
      required final FeedbackType type,
      final bool notifyByEmail,
      final bool notifyByPush,
      final dynamic status,
      final FeedbackFrom from,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt}) = _$FeedbackDataImpl;

  factory _FeedbackData.fromJson(Map<String, dynamic> json) =
      _$FeedbackDataImpl.fromJson;

  @override

  /// だれがフィードバックしたか
  /// サインアウト後にフィードバックした場合はnull
  String? get createdBy;
  @override

  /// ユーザのメールアドレス
  String? get email;
  @override

  /// デバイス情報
  FeedbackDeviceInfo get deviceInfo;
  @override

  /// フィードバックの種類
  FeedbackType get type;
  @override

  /// メールで通知するか
  bool get notifyByEmail;
  @override

  /// プッシュ通知で通知するか
  bool get notifyByPush;
  @override

  /// フィードバックのステータス
  dynamic get status;
  @override

  /// どこからのフィードバックか
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
