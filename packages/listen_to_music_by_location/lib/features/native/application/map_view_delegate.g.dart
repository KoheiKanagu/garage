// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'map_view_delegate.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapViewDelegateHash() => r'fbb3b471093968720799155e648fc4bd752ee75c';

/// See also [_mapViewDelegate].
@ProviderFor(_mapViewDelegate)
final _mapViewDelegateProvider = AutoDisposeProvider<_MapViewDelegate>.internal(
  _mapViewDelegate,
  name: r'_mapViewDelegateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapViewDelegateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _MapViewDelegateRef = AutoDisposeProviderRef<_MapViewDelegate>;
String _$mapViewOnLongPressedMapHash() =>
    r'058bb77997433852cbc9e5985192afae38bd94da';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [mapViewOnLongPressedMap].
@ProviderFor(mapViewOnLongPressedMap)
const mapViewOnLongPressedMapProvider = MapViewOnLongPressedMapFamily();

/// See also [mapViewOnLongPressedMap].
class MapViewOnLongPressedMapFamily extends Family<
    AsyncValue<({MapViewType viewType, double latitude, double longitude})>> {
  /// See also [mapViewOnLongPressedMap].
  const MapViewOnLongPressedMapFamily();

  /// See also [mapViewOnLongPressedMap].
  MapViewOnLongPressedMapProvider call({
    required MapViewType whereViewType,
  }) {
    return MapViewOnLongPressedMapProvider(
      whereViewType: whereViewType,
    );
  }

  @override
  MapViewOnLongPressedMapProvider getProviderOverride(
    covariant MapViewOnLongPressedMapProvider provider,
  ) {
    return call(
      whereViewType: provider.whereViewType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mapViewOnLongPressedMapProvider';
}

/// See also [mapViewOnLongPressedMap].
class MapViewOnLongPressedMapProvider extends AutoDisposeStreamProvider<
    ({MapViewType viewType, double latitude, double longitude})> {
  /// See also [mapViewOnLongPressedMap].
  MapViewOnLongPressedMapProvider({
    required MapViewType whereViewType,
  }) : this._internal(
          (ref) => mapViewOnLongPressedMap(
            ref as MapViewOnLongPressedMapRef,
            whereViewType: whereViewType,
          ),
          from: mapViewOnLongPressedMapProvider,
          name: r'mapViewOnLongPressedMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapViewOnLongPressedMapHash,
          dependencies: MapViewOnLongPressedMapFamily._dependencies,
          allTransitiveDependencies:
              MapViewOnLongPressedMapFamily._allTransitiveDependencies,
          whereViewType: whereViewType,
        );

  MapViewOnLongPressedMapProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.whereViewType,
  }) : super.internal();

  final MapViewType whereViewType;

  @override
  Override overrideWith(
    Stream<({MapViewType viewType, double latitude, double longitude})>
            Function(MapViewOnLongPressedMapRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapViewOnLongPressedMapProvider._internal(
        (ref) => create(ref as MapViewOnLongPressedMapRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        whereViewType: whereViewType,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<
          ({MapViewType viewType, double latitude, double longitude})>
      createElement() {
    return _MapViewOnLongPressedMapProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapViewOnLongPressedMapProvider &&
        other.whereViewType == whereViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, whereViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapViewOnLongPressedMapRef on AutoDisposeStreamProviderRef<
    ({MapViewType viewType, double latitude, double longitude})> {
  /// The parameter `whereViewType` of this provider.
  MapViewType get whereViewType;
}

class _MapViewOnLongPressedMapProviderElement
    extends AutoDisposeStreamProviderElement<
        ({MapViewType viewType, double latitude, double longitude})>
    with MapViewOnLongPressedMapRef {
  _MapViewOnLongPressedMapProviderElement(super.provider);

  @override
  MapViewType get whereViewType =>
      (origin as MapViewOnLongPressedMapProvider).whereViewType;
}

String _$mapViewOnTapCircleHash() =>
    r'3bbd2423919bb3c517204693b8bd1c7775e6a9b3';

/// See also [mapViewOnTapCircle].
@ProviderFor(mapViewOnTapCircle)
const mapViewOnTapCircleProvider = MapViewOnTapCircleFamily();

/// See also [mapViewOnTapCircle].
class MapViewOnTapCircleFamily
    extends Family<AsyncValue<({MapViewType viewType, String identifier})>> {
  /// See also [mapViewOnTapCircle].
  const MapViewOnTapCircleFamily();

  /// See also [mapViewOnTapCircle].
  MapViewOnTapCircleProvider call({
    required MapViewType whereViewType,
  }) {
    return MapViewOnTapCircleProvider(
      whereViewType: whereViewType,
    );
  }

  @override
  MapViewOnTapCircleProvider getProviderOverride(
    covariant MapViewOnTapCircleProvider provider,
  ) {
    return call(
      whereViewType: provider.whereViewType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mapViewOnTapCircleProvider';
}

/// See also [mapViewOnTapCircle].
class MapViewOnTapCircleProvider extends AutoDisposeStreamProvider<
    ({MapViewType viewType, String identifier})> {
  /// See also [mapViewOnTapCircle].
  MapViewOnTapCircleProvider({
    required MapViewType whereViewType,
  }) : this._internal(
          (ref) => mapViewOnTapCircle(
            ref as MapViewOnTapCircleRef,
            whereViewType: whereViewType,
          ),
          from: mapViewOnTapCircleProvider,
          name: r'mapViewOnTapCircleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapViewOnTapCircleHash,
          dependencies: MapViewOnTapCircleFamily._dependencies,
          allTransitiveDependencies:
              MapViewOnTapCircleFamily._allTransitiveDependencies,
          whereViewType: whereViewType,
        );

  MapViewOnTapCircleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.whereViewType,
  }) : super.internal();

  final MapViewType whereViewType;

  @override
  Override overrideWith(
    Stream<({MapViewType viewType, String identifier})> Function(
            MapViewOnTapCircleRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapViewOnTapCircleProvider._internal(
        (ref) => create(ref as MapViewOnTapCircleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        whereViewType: whereViewType,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<({MapViewType viewType, String identifier})>
      createElement() {
    return _MapViewOnTapCircleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapViewOnTapCircleProvider &&
        other.whereViewType == whereViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, whereViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapViewOnTapCircleRef on AutoDisposeStreamProviderRef<
    ({MapViewType viewType, String identifier})> {
  /// The parameter `whereViewType` of this provider.
  MapViewType get whereViewType;
}

class _MapViewOnTapCircleProviderElement
    extends AutoDisposeStreamProviderElement<
        ({MapViewType viewType, String identifier})>
    with MapViewOnTapCircleRef {
  _MapViewOnTapCircleProviderElement(super.provider);

  @override
  MapViewType get whereViewType =>
      (origin as MapViewOnTapCircleProvider).whereViewType;
}

String _$mapViewDidFinishLoadingMapHash() =>
    r'2d16271604a7524a5e43c0bd358b9045c281e429';

/// MapViewのタイルが読み込まれるたびに呼ばれる
///
/// Providerだと値をキャッシュしてしまうので、RawでStreamを直接使えるようにしている
///
/// Copied from [mapViewDidFinishLoadingMap].
@ProviderFor(mapViewDidFinishLoadingMap)
final mapViewDidFinishLoadingMapProvider =
    AutoDisposeProvider<Raw<Stream<MapViewType>>>.internal(
  mapViewDidFinishLoadingMap,
  name: r'mapViewDidFinishLoadingMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapViewDidFinishLoadingMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MapViewDidFinishLoadingMapRef
    = AutoDisposeProviderRef<Raw<Stream<MapViewType>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
