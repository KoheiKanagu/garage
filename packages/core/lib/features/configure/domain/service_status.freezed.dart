// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceStatus _$ServiceStatusFromJson(Map<String, dynamic> json) {
  return _ServiceStatus.fromJson(json);
}

/// @nodoc
mixin _$ServiceStatus {
  Status get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceStatusCopyWith<ServiceStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceStatusCopyWith<$Res> {
  factory $ServiceStatusCopyWith(
          ServiceStatus value, $Res Function(ServiceStatus) then) =
      _$ServiceStatusCopyWithImpl<$Res, ServiceStatus>;
  @useResult
  $Res call({Status status});
}

/// @nodoc
class _$ServiceStatusCopyWithImpl<$Res, $Val extends ServiceStatus>
    implements $ServiceStatusCopyWith<$Res> {
  _$ServiceStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceStatusImplCopyWith<$Res>
    implements $ServiceStatusCopyWith<$Res> {
  factory _$$ServiceStatusImplCopyWith(
          _$ServiceStatusImpl value, $Res Function(_$ServiceStatusImpl) then) =
      __$$ServiceStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status});
}

/// @nodoc
class __$$ServiceStatusImplCopyWithImpl<$Res>
    extends _$ServiceStatusCopyWithImpl<$Res, _$ServiceStatusImpl>
    implements _$$ServiceStatusImplCopyWith<$Res> {
  __$$ServiceStatusImplCopyWithImpl(
      _$ServiceStatusImpl _value, $Res Function(_$ServiceStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$ServiceStatusImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceStatusImpl implements _ServiceStatus {
  const _$ServiceStatusImpl({this.status = Status.down});

  factory _$ServiceStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceStatusImplFromJson(json);

  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'ServiceStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceStatusImplCopyWith<_$ServiceStatusImpl> get copyWith =>
      __$$ServiceStatusImplCopyWithImpl<_$ServiceStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceStatusImplToJson(
      this,
    );
  }
}

abstract class _ServiceStatus implements ServiceStatus {
  const factory _ServiceStatus({final Status status}) = _$ServiceStatusImpl;

  factory _ServiceStatus.fromJson(Map<String, dynamic> json) =
      _$ServiceStatusImpl.fromJson;

  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$ServiceStatusImplCopyWith<_$ServiceStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
