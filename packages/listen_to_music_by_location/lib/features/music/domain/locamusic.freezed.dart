// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locamusic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Locamusic _$LocamusicFromJson(Map<String, dynamic> json) {
  return _Locamusic.fromJson(json);
}

/// @nodoc
mixin _$Locamusic {
  @GeoPointConverter()
  GeoPoint get geoPoint => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String? get musicId => throw _privateConstructorUsedError;
  bool get allowBuiltInSpeaker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocamusicCopyWith<Locamusic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocamusicCopyWith<$Res> {
  factory $LocamusicCopyWith(Locamusic value, $Res Function(Locamusic) then) =
      _$LocamusicCopyWithImpl<$Res, Locamusic>;
  @useResult
  $Res call(
      {@GeoPointConverter() GeoPoint geoPoint,
      double distance,
      String createdBy,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      bool deleted,
      String? musicId,
      bool allowBuiltInSpeaker});
}

/// @nodoc
class _$LocamusicCopyWithImpl<$Res, $Val extends Locamusic>
    implements $LocamusicCopyWith<$Res> {
  _$LocamusicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = null,
    Object? distance = null,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? musicId = freezed,
    Object? allowBuiltInSpeaker = null,
  }) {
    return _then(_value.copyWith(
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      musicId: freezed == musicId
          ? _value.musicId
          : musicId // ignore: cast_nullable_to_non_nullable
              as String?,
      allowBuiltInSpeaker: null == allowBuiltInSpeaker
          ? _value.allowBuiltInSpeaker
          : allowBuiltInSpeaker // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocamusicImplCopyWith<$Res>
    implements $LocamusicCopyWith<$Res> {
  factory _$$LocamusicImplCopyWith(
          _$LocamusicImpl value, $Res Function(_$LocamusicImpl) then) =
      __$$LocamusicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@GeoPointConverter() GeoPoint geoPoint,
      double distance,
      String createdBy,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      bool deleted,
      String? musicId,
      bool allowBuiltInSpeaker});
}

/// @nodoc
class __$$LocamusicImplCopyWithImpl<$Res>
    extends _$LocamusicCopyWithImpl<$Res, _$LocamusicImpl>
    implements _$$LocamusicImplCopyWith<$Res> {
  __$$LocamusicImplCopyWithImpl(
      _$LocamusicImpl _value, $Res Function(_$LocamusicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = null,
    Object? distance = null,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
    Object? musicId = freezed,
    Object? allowBuiltInSpeaker = null,
  }) {
    return _then(_$LocamusicImpl(
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      musicId: freezed == musicId
          ? _value.musicId
          : musicId // ignore: cast_nullable_to_non_nullable
              as String?,
      allowBuiltInSpeaker: null == allowBuiltInSpeaker
          ? _value.allowBuiltInSpeaker
          : allowBuiltInSpeaker // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocamusicImpl implements _Locamusic {
  const _$LocamusicImpl(
      {@GeoPointConverter() required this.geoPoint,
      required this.distance,
      required this.createdBy,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.deleted = false,
      this.musicId,
      this.allowBuiltInSpeaker = false});

  factory _$LocamusicImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocamusicImplFromJson(json);

  @override
  @GeoPointConverter()
  final GeoPoint geoPoint;
  @override
  final double distance;
  @override
  final String createdBy;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;
  @override
  @JsonKey()
  final bool deleted;
  @override
  final String? musicId;
  @override
  @JsonKey()
  final bool allowBuiltInSpeaker;

  @override
  String toString() {
    return 'Locamusic(geoPoint: $geoPoint, distance: $distance, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted, musicId: $musicId, allowBuiltInSpeaker: $allowBuiltInSpeaker)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocamusicImpl &&
            (identical(other.geoPoint, geoPoint) ||
                other.geoPoint == geoPoint) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.musicId, musicId) || other.musicId == musicId) &&
            (identical(other.allowBuiltInSpeaker, allowBuiltInSpeaker) ||
                other.allowBuiltInSpeaker == allowBuiltInSpeaker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, geoPoint, distance, createdBy,
      createdAt, updatedAt, deleted, musicId, allowBuiltInSpeaker);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocamusicImplCopyWith<_$LocamusicImpl> get copyWith =>
      __$$LocamusicImplCopyWithImpl<_$LocamusicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocamusicImplToJson(
      this,
    );
  }
}

abstract class _Locamusic implements Locamusic {
  const factory _Locamusic(
      {@GeoPointConverter() required final GeoPoint geoPoint,
      required final double distance,
      required final String createdBy,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt,
      final bool deleted,
      final String? musicId,
      final bool allowBuiltInSpeaker}) = _$LocamusicImpl;

  factory _Locamusic.fromJson(Map<String, dynamic> json) =
      _$LocamusicImpl.fromJson;

  @override
  @GeoPointConverter()
  GeoPoint get geoPoint;
  @override
  double get distance;
  @override
  String get createdBy;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  bool get deleted;
  @override
  String? get musicId;
  @override
  bool get allowBuiltInSpeaker;
  @override
  @JsonKey(ignore: true)
  _$$LocamusicImplCopyWith<_$LocamusicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
