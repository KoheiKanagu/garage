// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geomusic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Geomusic _$GeomusicFromJson(Map<String, dynamic> json) {
  return _Geomusic.fromJson(json);
}

/// @nodoc
mixin _$Geomusic {
  @GeoPointConverter()
  GeoPoint get geoPoint => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String get musicId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeomusicCopyWith<Geomusic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeomusicCopyWith<$Res> {
  factory $GeomusicCopyWith(Geomusic value, $Res Function(Geomusic) then) =
      _$GeomusicCopyWithImpl<$Res, Geomusic>;
  @useResult
  $Res call(
      {@GeoPointConverter() GeoPoint geoPoint,
      double distance,
      String musicId,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      bool deleted});
}

/// @nodoc
class _$GeomusicCopyWithImpl<$Res, $Val extends Geomusic>
    implements $GeomusicCopyWith<$Res> {
  _$GeomusicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = null,
    Object? distance = null,
    Object? musicId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
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
      musicId: null == musicId
          ? _value.musicId
          : musicId // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeomusicImplCopyWith<$Res>
    implements $GeomusicCopyWith<$Res> {
  factory _$$GeomusicImplCopyWith(
          _$GeomusicImpl value, $Res Function(_$GeomusicImpl) then) =
      __$$GeomusicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@GeoPointConverter() GeoPoint geoPoint,
      double distance,
      String musicId,
      @TimestampConverter() Timestamp? createdAt,
      @TimestampConverter() Timestamp? updatedAt,
      bool deleted});
}

/// @nodoc
class __$$GeomusicImplCopyWithImpl<$Res>
    extends _$GeomusicCopyWithImpl<$Res, _$GeomusicImpl>
    implements _$$GeomusicImplCopyWith<$Res> {
  __$$GeomusicImplCopyWithImpl(
      _$GeomusicImpl _value, $Res Function(_$GeomusicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = null,
    Object? distance = null,
    Object? musicId = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deleted = null,
  }) {
    return _then(_$GeomusicImpl(
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      musicId: null == musicId
          ? _value.musicId
          : musicId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeomusicImpl implements _Geomusic {
  const _$GeomusicImpl(
      {@GeoPointConverter() required this.geoPoint,
      required this.distance,
      required this.musicId,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.deleted = false});

  factory _$GeomusicImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeomusicImplFromJson(json);

  @override
  @GeoPointConverter()
  final GeoPoint geoPoint;
  @override
  final double distance;
  @override
  final String musicId;
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
  String toString() {
    return 'Geomusic(geoPoint: $geoPoint, distance: $distance, musicId: $musicId, createdAt: $createdAt, updatedAt: $updatedAt, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeomusicImpl &&
            (identical(other.geoPoint, geoPoint) ||
                other.geoPoint == geoPoint) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.musicId, musicId) || other.musicId == musicId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, geoPoint, distance, musicId, createdAt, updatedAt, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeomusicImplCopyWith<_$GeomusicImpl> get copyWith =>
      __$$GeomusicImplCopyWithImpl<_$GeomusicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeomusicImplToJson(
      this,
    );
  }
}

abstract class _Geomusic implements Geomusic {
  const factory _Geomusic(
      {@GeoPointConverter() required final GeoPoint geoPoint,
      required final double distance,
      required final String musicId,
      @TimestampConverter() final Timestamp? createdAt,
      @TimestampConverter() final Timestamp? updatedAt,
      final bool deleted}) = _$GeomusicImpl;

  factory _Geomusic.fromJson(Map<String, dynamic> json) =
      _$GeomusicImpl.fromJson;

  @override
  @GeoPointConverter()
  GeoPoint get geoPoint;
  @override
  double get distance;
  @override
  String get musicId;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$GeomusicImplCopyWith<_$GeomusicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
