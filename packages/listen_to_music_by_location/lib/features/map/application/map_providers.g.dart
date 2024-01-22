// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapDrawAnnotationsHash() =>
    r'6c1094c920ec45feba813c3049a01f776d2a30d1';

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

/// See also [mapDrawAnnotations].
@ProviderFor(mapDrawAnnotations)
const mapDrawAnnotationsProvider = MapDrawAnnotationsFamily();

/// See also [mapDrawAnnotations].
class MapDrawAnnotationsFamily extends Family<AsyncValue<void>> {
  /// See also [mapDrawAnnotations].
  const MapDrawAnnotationsFamily();

  /// See also [mapDrawAnnotations].
  MapDrawAnnotationsProvider call({
    required List<({String documentId, Locamusic locamusic})> locamusics,
    required MapViewType mapViewType,
  }) {
    return MapDrawAnnotationsProvider(
      locamusics: locamusics,
      mapViewType: mapViewType,
    );
  }

  @override
  MapDrawAnnotationsProvider getProviderOverride(
    covariant MapDrawAnnotationsProvider provider,
  ) {
    return call(
      locamusics: provider.locamusics,
      mapViewType: provider.mapViewType,
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
  String? get name => r'mapDrawAnnotationsProvider';
}

/// See also [mapDrawAnnotations].
class MapDrawAnnotationsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [mapDrawAnnotations].
  MapDrawAnnotationsProvider({
    required List<({String documentId, Locamusic locamusic})> locamusics,
    required MapViewType mapViewType,
  }) : this._internal(
          (ref) => mapDrawAnnotations(
            ref as MapDrawAnnotationsRef,
            locamusics: locamusics,
            mapViewType: mapViewType,
          ),
          from: mapDrawAnnotationsProvider,
          name: r'mapDrawAnnotationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapDrawAnnotationsHash,
          dependencies: MapDrawAnnotationsFamily._dependencies,
          allTransitiveDependencies:
              MapDrawAnnotationsFamily._allTransitiveDependencies,
          locamusics: locamusics,
          mapViewType: mapViewType,
        );

  MapDrawAnnotationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locamusics,
    required this.mapViewType,
  }) : super.internal();

  final List<({String documentId, Locamusic locamusic})> locamusics;
  final MapViewType mapViewType;

  @override
  Override overrideWith(
    FutureOr<void> Function(MapDrawAnnotationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapDrawAnnotationsProvider._internal(
        (ref) => create(ref as MapDrawAnnotationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locamusics: locamusics,
        mapViewType: mapViewType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MapDrawAnnotationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapDrawAnnotationsProvider &&
        other.locamusics == locamusics &&
        other.mapViewType == mapViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locamusics.hashCode);
    hash = _SystemHash.combine(hash, mapViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapDrawAnnotationsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `locamusics` of this provider.
  List<({String documentId, Locamusic locamusic})> get locamusics;

  /// The parameter `mapViewType` of this provider.
  MapViewType get mapViewType;
}

class _MapDrawAnnotationsProviderElement
    extends AutoDisposeFutureProviderElement<void> with MapDrawAnnotationsRef {
  _MapDrawAnnotationsProviderElement(super.provider);

  @override
  List<({String documentId, Locamusic locamusic})> get locamusics =>
      (origin as MapDrawAnnotationsProvider).locamusics;
  @override
  MapViewType get mapViewType =>
      (origin as MapDrawAnnotationsProvider).mapViewType;
}

String _$mapAdjustCameraHash() => r'56ce2f8389be208bdb5b76cccb304a1663f65609';

/// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
/// Annotationが存在しないなら現在地にズームする
///
/// Copied from [mapAdjustCamera].
@ProviderFor(mapAdjustCamera)
const mapAdjustCameraProvider = MapAdjustCameraFamily();

/// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
/// Annotationが存在しないなら現在地にズームする
///
/// Copied from [mapAdjustCamera].
class MapAdjustCameraFamily extends Family<AsyncValue<void>> {
  /// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
  /// Annotationが存在しないなら現在地にズームする
  ///
  /// Copied from [mapAdjustCamera].
  const MapAdjustCameraFamily();

  /// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
  /// Annotationが存在しないなら現在地にズームする
  ///
  /// Copied from [mapAdjustCamera].
  MapAdjustCameraProvider call({
    required List<({String documentId, Locamusic locamusic})> locamusics,
    required MapViewType mapViewType,
  }) {
    return MapAdjustCameraProvider(
      locamusics: locamusics,
      mapViewType: mapViewType,
    );
  }

  @override
  MapAdjustCameraProvider getProviderOverride(
    covariant MapAdjustCameraProvider provider,
  ) {
    return call(
      locamusics: provider.locamusics,
      mapViewType: provider.mapViewType,
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
  String? get name => r'mapAdjustCameraProvider';
}

/// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
/// Annotationが存在しないなら現在地にズームする
///
/// Copied from [mapAdjustCamera].
class MapAdjustCameraProvider extends AutoDisposeFutureProvider<void> {
  /// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
  /// Annotationが存在しないなら現在地にズームする
  ///
  /// Copied from [mapAdjustCamera].
  MapAdjustCameraProvider({
    required List<({String documentId, Locamusic locamusic})> locamusics,
    required MapViewType mapViewType,
  }) : this._internal(
          (ref) => mapAdjustCamera(
            ref as MapAdjustCameraRef,
            locamusics: locamusics,
            mapViewType: mapViewType,
          ),
          from: mapAdjustCameraProvider,
          name: r'mapAdjustCameraProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapAdjustCameraHash,
          dependencies: MapAdjustCameraFamily._dependencies,
          allTransitiveDependencies:
              MapAdjustCameraFamily._allTransitiveDependencies,
          locamusics: locamusics,
          mapViewType: mapViewType,
        );

  MapAdjustCameraProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locamusics,
    required this.mapViewType,
  }) : super.internal();

  final List<({String documentId, Locamusic locamusic})> locamusics;
  final MapViewType mapViewType;

  @override
  Override overrideWith(
    FutureOr<void> Function(MapAdjustCameraRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapAdjustCameraProvider._internal(
        (ref) => create(ref as MapAdjustCameraRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locamusics: locamusics,
        mapViewType: mapViewType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MapAdjustCameraProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapAdjustCameraProvider &&
        other.locamusics == locamusics &&
        other.mapViewType == mapViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locamusics.hashCode);
    hash = _SystemHash.combine(hash, mapViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapAdjustCameraRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `locamusics` of this provider.
  List<({String documentId, Locamusic locamusic})> get locamusics;

  /// The parameter `mapViewType` of this provider.
  MapViewType get mapViewType;
}

class _MapAdjustCameraProviderElement
    extends AutoDisposeFutureProviderElement<void> with MapAdjustCameraRef {
  _MapAdjustCameraProviderElement(super.provider);

  @override
  List<({String documentId, Locamusic locamusic})> get locamusics =>
      (origin as MapAdjustCameraProvider).locamusics;
  @override
  MapViewType get mapViewType =>
      (origin as MapAdjustCameraProvider).mapViewType;
}

String _$mapSetAnnotationRegionHash() =>
    r'00036b77d74b61691049245a2ec4c137abf57956';

/// Annotationを描画してカメラをズームする
///
/// Copied from [mapSetAnnotationRegion].
@ProviderFor(mapSetAnnotationRegion)
const mapSetAnnotationRegionProvider = MapSetAnnotationRegionFamily();

/// Annotationを描画してカメラをズームする
///
/// Copied from [mapSetAnnotationRegion].
class MapSetAnnotationRegionFamily extends Family<AsyncValue<void>> {
  /// Annotationを描画してカメラをズームする
  ///
  /// Copied from [mapSetAnnotationRegion].
  const MapSetAnnotationRegionFamily();

  /// Annotationを描画してカメラをズームする
  ///
  /// Copied from [mapSetAnnotationRegion].
  MapSetAnnotationRegionProvider call({
    required ({String documentId, Locamusic locamusic}) locamusic,
    required MapViewType mapViewType,
  }) {
    return MapSetAnnotationRegionProvider(
      locamusic: locamusic,
      mapViewType: mapViewType,
    );
  }

  @override
  MapSetAnnotationRegionProvider getProviderOverride(
    covariant MapSetAnnotationRegionProvider provider,
  ) {
    return call(
      locamusic: provider.locamusic,
      mapViewType: provider.mapViewType,
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
  String? get name => r'mapSetAnnotationRegionProvider';
}

/// Annotationを描画してカメラをズームする
///
/// Copied from [mapSetAnnotationRegion].
class MapSetAnnotationRegionProvider extends AutoDisposeFutureProvider<void> {
  /// Annotationを描画してカメラをズームする
  ///
  /// Copied from [mapSetAnnotationRegion].
  MapSetAnnotationRegionProvider({
    required ({String documentId, Locamusic locamusic}) locamusic,
    required MapViewType mapViewType,
  }) : this._internal(
          (ref) => mapSetAnnotationRegion(
            ref as MapSetAnnotationRegionRef,
            locamusic: locamusic,
            mapViewType: mapViewType,
          ),
          from: mapSetAnnotationRegionProvider,
          name: r'mapSetAnnotationRegionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapSetAnnotationRegionHash,
          dependencies: MapSetAnnotationRegionFamily._dependencies,
          allTransitiveDependencies:
              MapSetAnnotationRegionFamily._allTransitiveDependencies,
          locamusic: locamusic,
          mapViewType: mapViewType,
        );

  MapSetAnnotationRegionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locamusic,
    required this.mapViewType,
  }) : super.internal();

  final ({String documentId, Locamusic locamusic}) locamusic;
  final MapViewType mapViewType;

  @override
  Override overrideWith(
    FutureOr<void> Function(MapSetAnnotationRegionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapSetAnnotationRegionProvider._internal(
        (ref) => create(ref as MapSetAnnotationRegionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locamusic: locamusic,
        mapViewType: mapViewType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MapSetAnnotationRegionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapSetAnnotationRegionProvider &&
        other.locamusic == locamusic &&
        other.mapViewType == mapViewType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locamusic.hashCode);
    hash = _SystemHash.combine(hash, mapViewType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapSetAnnotationRegionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `locamusic` of this provider.
  ({String documentId, Locamusic locamusic}) get locamusic;

  /// The parameter `mapViewType` of this provider.
  MapViewType get mapViewType;
}

class _MapSetAnnotationRegionProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with MapSetAnnotationRegionRef {
  _MapSetAnnotationRegionProviderElement(super.provider);

  @override
  ({String documentId, Locamusic locamusic}) get locamusic =>
      (origin as MapSetAnnotationRegionProvider).locamusic;
  @override
  MapViewType get mapViewType =>
      (origin as MapSetAnnotationRegionProvider).mapViewType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
