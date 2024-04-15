// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_go_router_listenable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyGoRouterListenable {
  bool get signedIn => throw _privateConstructorUsedError;
  bool get requiredUpdate => throw _privateConstructorUsedError;
  bool get releasedNewVersion => throw _privateConstructorUsedError;
  ServiceStatus get serviceStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyGoRouterListenableCopyWith<MyGoRouterListenable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyGoRouterListenableCopyWith<$Res> {
  factory $MyGoRouterListenableCopyWith(MyGoRouterListenable value,
          $Res Function(MyGoRouterListenable) then) =
      _$MyGoRouterListenableCopyWithImpl<$Res, MyGoRouterListenable>;
  @useResult
  $Res call(
      {bool signedIn,
      bool requiredUpdate,
      bool releasedNewVersion,
      ServiceStatus serviceStatus});

  $ServiceStatusCopyWith<$Res> get serviceStatus;
}

/// @nodoc
class _$MyGoRouterListenableCopyWithImpl<$Res,
        $Val extends MyGoRouterListenable>
    implements $MyGoRouterListenableCopyWith<$Res> {
  _$MyGoRouterListenableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
    Object? requiredUpdate = null,
    Object? releasedNewVersion = null,
    Object? serviceStatus = null,
  }) {
    return _then(_value.copyWith(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      requiredUpdate: null == requiredUpdate
          ? _value.requiredUpdate
          : requiredUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      releasedNewVersion: null == releasedNewVersion
          ? _value.releasedNewVersion
          : releasedNewVersion // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceStatus: null == serviceStatus
          ? _value.serviceStatus
          : serviceStatus // ignore: cast_nullable_to_non_nullable
              as ServiceStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceStatusCopyWith<$Res> get serviceStatus {
    return $ServiceStatusCopyWith<$Res>(_value.serviceStatus, (value) {
      return _then(_value.copyWith(serviceStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyGoRouterListenableImplCopyWith<$Res>
    implements $MyGoRouterListenableCopyWith<$Res> {
  factory _$$MyGoRouterListenableImplCopyWith(_$MyGoRouterListenableImpl value,
          $Res Function(_$MyGoRouterListenableImpl) then) =
      __$$MyGoRouterListenableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool signedIn,
      bool requiredUpdate,
      bool releasedNewVersion,
      ServiceStatus serviceStatus});

  @override
  $ServiceStatusCopyWith<$Res> get serviceStatus;
}

/// @nodoc
class __$$MyGoRouterListenableImplCopyWithImpl<$Res>
    extends _$MyGoRouterListenableCopyWithImpl<$Res, _$MyGoRouterListenableImpl>
    implements _$$MyGoRouterListenableImplCopyWith<$Res> {
  __$$MyGoRouterListenableImplCopyWithImpl(_$MyGoRouterListenableImpl _value,
      $Res Function(_$MyGoRouterListenableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
    Object? requiredUpdate = null,
    Object? releasedNewVersion = null,
    Object? serviceStatus = null,
  }) {
    return _then(_$MyGoRouterListenableImpl(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      requiredUpdate: null == requiredUpdate
          ? _value.requiredUpdate
          : requiredUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      releasedNewVersion: null == releasedNewVersion
          ? _value.releasedNewVersion
          : releasedNewVersion // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceStatus: null == serviceStatus
          ? _value.serviceStatus
          : serviceStatus // ignore: cast_nullable_to_non_nullable
              as ServiceStatus,
    ));
  }
}

/// @nodoc

class _$MyGoRouterListenableImpl implements _MyGoRouterListenable {
  const _$MyGoRouterListenableImpl(
      {this.signedIn = false,
      this.requiredUpdate = false,
      this.releasedNewVersion = false,
      this.serviceStatus = ServiceStatus.down});

  @override
  @JsonKey()
  final bool signedIn;
  @override
  @JsonKey()
  final bool requiredUpdate;
  @override
  @JsonKey()
  final bool releasedNewVersion;
  @override
  @JsonKey()
  final ServiceStatus serviceStatus;

  @override
  String toString() {
    return 'MyGoRouterListenable(signedIn: $signedIn, requiredUpdate: $requiredUpdate, releasedNewVersion: $releasedNewVersion, serviceStatus: $serviceStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyGoRouterListenableImpl &&
            (identical(other.signedIn, signedIn) ||
                other.signedIn == signedIn) &&
            (identical(other.requiredUpdate, requiredUpdate) ||
                other.requiredUpdate == requiredUpdate) &&
            (identical(other.releasedNewVersion, releasedNewVersion) ||
                other.releasedNewVersion == releasedNewVersion) &&
            (identical(other.serviceStatus, serviceStatus) ||
                other.serviceStatus == serviceStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, signedIn, requiredUpdate, releasedNewVersion, serviceStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyGoRouterListenableImplCopyWith<_$MyGoRouterListenableImpl>
      get copyWith =>
          __$$MyGoRouterListenableImplCopyWithImpl<_$MyGoRouterListenableImpl>(
              this, _$identity);
}

abstract class _MyGoRouterListenable implements MyGoRouterListenable {
  const factory _MyGoRouterListenable(
      {final bool signedIn,
      final bool requiredUpdate,
      final bool releasedNewVersion,
      final ServiceStatus serviceStatus}) = _$MyGoRouterListenableImpl;

  @override
  bool get signedIn;
  @override
  bool get requiredUpdate;
  @override
  bool get releasedNewVersion;
  @override
  ServiceStatus get serviceStatus;
  @override
  @JsonKey(ignore: true)
  _$$MyGoRouterListenableImplCopyWith<_$MyGoRouterListenableImpl>
      get copyWith => throw _privateConstructorUsedError;
}
