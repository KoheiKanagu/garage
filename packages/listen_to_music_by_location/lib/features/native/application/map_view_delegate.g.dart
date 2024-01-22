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
String _$mapPageMapViewOnLongPressedMapHash() =>
    r'fa8bb8443a8c837e2a4cce9f73f6bcd227181864';

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

/// See also [mapPageMapViewOnLongPressedMap].
@ProviderFor(mapPageMapViewOnLongPressedMap)
const mapPageMapViewOnLongPressedMapProvider =
    MapPageMapViewOnLongPressedMapFamily();

/// See also [mapPageMapViewOnLongPressedMap].
class MapPageMapViewOnLongPressedMapFamily extends Family<
    AsyncValue<({MapViewType viewType, double latitude, double longitude})>> {
  /// See also [mapPageMapViewOnLongPressedMap].
  const MapPageMapViewOnLongPressedMapFamily();

  /// See also [mapPageMapViewOnLongPressedMap].
  MapPageMapViewOnLongPressedMapProvider call({
    required MapViewType whereViewType,
  }) {
    return MapPageMapViewOnLongPressedMapProvider(
      whereViewType: whereViewType,
    );
  }

  @override
  MapPageMapViewOnLongPressedMapProvider getProviderOverride(
    covariant MapPageMapViewOnLongPressedMapProvider provider,
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
  String? get name => r'mapPageMapViewOnLongPressedMapProvider';
}

/// See also [mapPageMapViewOnLongPressedMap].
class MapPageMapViewOnLongPressedMapProvider extends AutoDisposeStreamProvider<
    ({MapViewType viewType, double latitude, double longitude})> {
  /// See also [mapPageMapViewOnLongPressedMap].
  MapPageMapViewOnLongPressedMapProvider({
    required MapViewType whereViewType,
  }) : this._internal(
          (ref) => mapPageMapViewOnLongPressedMap(
            ref as MapPageMapViewOnLongPressedMapRef,
            whereViewType: whereViewType,
          ),
          from: mapPageMapViewOnLongPressedMapProvider,
          name: r'mapPageMapViewOnLongPressedMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapPageMapViewOnLongPressedMapHash,
          dependencies: MapPageMapViewOnLongPressedMapFamily._dependencies,
          allTransitiveDependencies:
              MapPageMapViewOnLongPressedMapFamily._allTransitiveDependencies,
          whereViewType: whereViewType,
        );

  MapPageMapViewOnLongPressedMapProvider._internal(
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
            Function(MapPageMapViewOnLongPressedMapRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapPageMapViewOnLongPressedMapProvider._internal(
        (ref) => create(ref as MapPageMapViewOnLongPressedMapRef),
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
    return _MapPageMapViewOnLongPressedMapProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapPageMapViewOnLongPressedMapProvider &&
        other.whereViewType == whereViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, whereViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapPageMapViewOnLongPressedMapRef on AutoDisposeStreamProviderRef<
    ({MapViewType viewType, double latitude, double longitude})> {
  /// The parameter `whereViewType` of this provider.
  MapViewType get whereViewType;
}

class _MapPageMapViewOnLongPressedMapProviderElement
    extends AutoDisposeStreamProviderElement<
        ({MapViewType viewType, double latitude, double longitude})>
    with MapPageMapViewOnLongPressedMapRef {
  _MapPageMapViewOnLongPressedMapProviderElement(super.provider);

  @override
  MapViewType get whereViewType =>
      (origin as MapPageMapViewOnLongPressedMapProvider).whereViewType;
}

String _$mapPageMapViewOnTapCircleHash() =>
    r'2b2087653f6d921046c6f1b0f4648eb207cc0ede';

/// See also [mapPageMapViewOnTapCircle].
@ProviderFor(mapPageMapViewOnTapCircle)
const mapPageMapViewOnTapCircleProvider = MapPageMapViewOnTapCircleFamily();

/// See also [mapPageMapViewOnTapCircle].
class MapPageMapViewOnTapCircleFamily
    extends Family<AsyncValue<({MapViewType viewType, String identifier})>> {
  /// See also [mapPageMapViewOnTapCircle].
  const MapPageMapViewOnTapCircleFamily();

  /// See also [mapPageMapViewOnTapCircle].
  MapPageMapViewOnTapCircleProvider call({
    required MapViewType whereViewType,
  }) {
    return MapPageMapViewOnTapCircleProvider(
      whereViewType: whereViewType,
    );
  }

  @override
  MapPageMapViewOnTapCircleProvider getProviderOverride(
    covariant MapPageMapViewOnTapCircleProvider provider,
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
  String? get name => r'mapPageMapViewOnTapCircleProvider';
}

/// See also [mapPageMapViewOnTapCircle].
class MapPageMapViewOnTapCircleProvider extends AutoDisposeStreamProvider<
    ({MapViewType viewType, String identifier})> {
  /// See also [mapPageMapViewOnTapCircle].
  MapPageMapViewOnTapCircleProvider({
    required MapViewType whereViewType,
  }) : this._internal(
          (ref) => mapPageMapViewOnTapCircle(
            ref as MapPageMapViewOnTapCircleRef,
            whereViewType: whereViewType,
          ),
          from: mapPageMapViewOnTapCircleProvider,
          name: r'mapPageMapViewOnTapCircleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapPageMapViewOnTapCircleHash,
          dependencies: MapPageMapViewOnTapCircleFamily._dependencies,
          allTransitiveDependencies:
              MapPageMapViewOnTapCircleFamily._allTransitiveDependencies,
          whereViewType: whereViewType,
        );

  MapPageMapViewOnTapCircleProvider._internal(
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
            MapPageMapViewOnTapCircleRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapPageMapViewOnTapCircleProvider._internal(
        (ref) => create(ref as MapPageMapViewOnTapCircleRef),
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
    return _MapPageMapViewOnTapCircleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapPageMapViewOnTapCircleProvider &&
        other.whereViewType == whereViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, whereViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapPageMapViewOnTapCircleRef on AutoDisposeStreamProviderRef<
    ({MapViewType viewType, String identifier})> {
  /// The parameter `whereViewType` of this provider.
  MapViewType get whereViewType;
}

class _MapPageMapViewOnTapCircleProviderElement
    extends AutoDisposeStreamProviderElement<
        ({MapViewType viewType, String identifier})>
    with MapPageMapViewOnTapCircleRef {
  _MapPageMapViewOnTapCircleProviderElement(super.provider);

  @override
  MapViewType get whereViewType =>
      (origin as MapPageMapViewOnTapCircleProvider).whereViewType;
}

String _$mapPageMapViewMapViewDidFinishLoadingMapHash() =>
    r'617e514de20338996e1988c9287b4ad5ee77b8ab';

/// See also [mapPageMapViewMapViewDidFinishLoadingMap].
@ProviderFor(mapPageMapViewMapViewDidFinishLoadingMap)
const mapPageMapViewMapViewDidFinishLoadingMapProvider =
    MapPageMapViewMapViewDidFinishLoadingMapFamily();

/// See also [mapPageMapViewMapViewDidFinishLoadingMap].
class MapPageMapViewMapViewDidFinishLoadingMapFamily
    extends Family<AsyncValue<MapViewType>> {
  /// See also [mapPageMapViewMapViewDidFinishLoadingMap].
  const MapPageMapViewMapViewDidFinishLoadingMapFamily();

  /// See also [mapPageMapViewMapViewDidFinishLoadingMap].
  MapPageMapViewMapViewDidFinishLoadingMapProvider call({
    required MapViewType whereViewType,
  }) {
    return MapPageMapViewMapViewDidFinishLoadingMapProvider(
      whereViewType: whereViewType,
    );
  }

  @override
  MapPageMapViewMapViewDidFinishLoadingMapProvider getProviderOverride(
    covariant MapPageMapViewMapViewDidFinishLoadingMapProvider provider,
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
  String? get name => r'mapPageMapViewMapViewDidFinishLoadingMapProvider';
}

/// See also [mapPageMapViewMapViewDidFinishLoadingMap].
class MapPageMapViewMapViewDidFinishLoadingMapProvider
    extends AutoDisposeStreamProvider<MapViewType> {
  /// See also [mapPageMapViewMapViewDidFinishLoadingMap].
  MapPageMapViewMapViewDidFinishLoadingMapProvider({
    required MapViewType whereViewType,
  }) : this._internal(
          (ref) => mapPageMapViewMapViewDidFinishLoadingMap(
            ref as MapPageMapViewMapViewDidFinishLoadingMapRef,
            whereViewType: whereViewType,
          ),
          from: mapPageMapViewMapViewDidFinishLoadingMapProvider,
          name: r'mapPageMapViewMapViewDidFinishLoadingMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapPageMapViewMapViewDidFinishLoadingMapHash,
          dependencies:
              MapPageMapViewMapViewDidFinishLoadingMapFamily._dependencies,
          allTransitiveDependencies:
              MapPageMapViewMapViewDidFinishLoadingMapFamily
                  ._allTransitiveDependencies,
          whereViewType: whereViewType,
        );

  MapPageMapViewMapViewDidFinishLoadingMapProvider._internal(
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
    Stream<MapViewType> Function(
            MapPageMapViewMapViewDidFinishLoadingMapRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapPageMapViewMapViewDidFinishLoadingMapProvider._internal(
        (ref) => create(ref as MapPageMapViewMapViewDidFinishLoadingMapRef),
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
  AutoDisposeStreamProviderElement<MapViewType> createElement() {
    return _MapPageMapViewMapViewDidFinishLoadingMapProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapPageMapViewMapViewDidFinishLoadingMapProvider &&
        other.whereViewType == whereViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, whereViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapPageMapViewMapViewDidFinishLoadingMapRef
    on AutoDisposeStreamProviderRef<MapViewType> {
  /// The parameter `whereViewType` of this provider.
  MapViewType get whereViewType;
}

class _MapPageMapViewMapViewDidFinishLoadingMapProviderElement
    extends AutoDisposeStreamProviderElement<MapViewType>
    with MapPageMapViewMapViewDidFinishLoadingMapRef {
  _MapPageMapViewMapViewDidFinishLoadingMapProviderElement(super.provider);

  @override
  MapViewType get whereViewType =>
      (origin as MapPageMapViewMapViewDidFinishLoadingMapProvider)
          .whereViewType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
