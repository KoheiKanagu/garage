// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackDeviceInfo _$FeedbackDeviceInfoFromJson(Map<String, dynamic> json) {
  return _FeedbackDeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$FeedbackDeviceInfo {
  String get osVersion => throw _privateConstructorUsedError;
  String get modelName => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  String get appPackageName => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;

  /// Serializes this FeedbackDeviceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackDeviceInfoCopyWith<FeedbackDeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackDeviceInfoCopyWith<$Res> {
  factory $FeedbackDeviceInfoCopyWith(
          FeedbackDeviceInfo value, $Res Function(FeedbackDeviceInfo) then) =
      _$FeedbackDeviceInfoCopyWithImpl<$Res, FeedbackDeviceInfo>;
  @useResult
  $Res call(
      {String osVersion,
      String modelName,
      String locale,
      String appVersion,
      String appPackageName,
      String appName});
}

/// @nodoc
class _$FeedbackDeviceInfoCopyWithImpl<$Res, $Val extends FeedbackDeviceInfo>
    implements $FeedbackDeviceInfoCopyWith<$Res> {
  _$FeedbackDeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? osVersion = null,
    Object? modelName = null,
    Object? locale = null,
    Object? appVersion = null,
    Object? appPackageName = null,
    Object? appName = null,
  }) {
    return _then(_value.copyWith(
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: null == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appPackageName: null == appPackageName
          ? _value.appPackageName
          : appPackageName // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackDeviceInfoImplCopyWith<$Res>
    implements $FeedbackDeviceInfoCopyWith<$Res> {
  factory _$$FeedbackDeviceInfoImplCopyWith(_$FeedbackDeviceInfoImpl value,
          $Res Function(_$FeedbackDeviceInfoImpl) then) =
      __$$FeedbackDeviceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String osVersion,
      String modelName,
      String locale,
      String appVersion,
      String appPackageName,
      String appName});
}

/// @nodoc
class __$$FeedbackDeviceInfoImplCopyWithImpl<$Res>
    extends _$FeedbackDeviceInfoCopyWithImpl<$Res, _$FeedbackDeviceInfoImpl>
    implements _$$FeedbackDeviceInfoImplCopyWith<$Res> {
  __$$FeedbackDeviceInfoImplCopyWithImpl(_$FeedbackDeviceInfoImpl _value,
      $Res Function(_$FeedbackDeviceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? osVersion = null,
    Object? modelName = null,
    Object? locale = null,
    Object? appVersion = null,
    Object? appPackageName = null,
    Object? appName = null,
  }) {
    return _then(_$FeedbackDeviceInfoImpl(
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: null == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appPackageName: null == appPackageName
          ? _value.appPackageName
          : appPackageName // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackDeviceInfoImpl implements _FeedbackDeviceInfo {
  const _$FeedbackDeviceInfoImpl(
      {required this.osVersion,
      required this.modelName,
      required this.locale,
      required this.appVersion,
      required this.appPackageName,
      required this.appName});

  factory _$FeedbackDeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackDeviceInfoImplFromJson(json);

  @override
  final String osVersion;
  @override
  final String modelName;
  @override
  final String locale;
  @override
  final String appVersion;
  @override
  final String appPackageName;
  @override
  final String appName;

  @override
  String toString() {
    return 'FeedbackDeviceInfo(osVersion: $osVersion, modelName: $modelName, locale: $locale, appVersion: $appVersion, appPackageName: $appPackageName, appName: $appName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackDeviceInfoImpl &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.modelName, modelName) ||
                other.modelName == modelName) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.appPackageName, appPackageName) ||
                other.appPackageName == appPackageName) &&
            (identical(other.appName, appName) || other.appName == appName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, osVersion, modelName, locale,
      appVersion, appPackageName, appName);

  /// Create a copy of FeedbackDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackDeviceInfoImplCopyWith<_$FeedbackDeviceInfoImpl> get copyWith =>
      __$$FeedbackDeviceInfoImplCopyWithImpl<_$FeedbackDeviceInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackDeviceInfoImplToJson(
      this,
    );
  }
}

abstract class _FeedbackDeviceInfo implements FeedbackDeviceInfo {
  const factory _FeedbackDeviceInfo(
      {required final String osVersion,
      required final String modelName,
      required final String locale,
      required final String appVersion,
      required final String appPackageName,
      required final String appName}) = _$FeedbackDeviceInfoImpl;

  factory _FeedbackDeviceInfo.fromJson(Map<String, dynamic> json) =
      _$FeedbackDeviceInfoImpl.fromJson;

  @override
  String get osVersion;
  @override
  String get modelName;
  @override
  String get locale;
  @override
  String get appVersion;
  @override
  String get appPackageName;
  @override
  String get appName;

  /// Create a copy of FeedbackDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackDeviceInfoImplCopyWith<_$FeedbackDeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
