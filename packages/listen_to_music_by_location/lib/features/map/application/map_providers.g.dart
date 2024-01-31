// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapDrawAnnotationsHash() =>
    r'4066b6415fe55e9e29704ce40aac68fb6fe6d612';

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

String _$mapSetAnnotationRegionHash() =>
    r'32d19fd3fea92dace11dff6ec529b4d22c48ff72';

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

String _$mapPageHandlerHash() => r'bb70a02eba2a2994569e0753229f10031d7d734a';

/// [MapPage] のMapViewのハンドリング
///
/// Copied from [mapPageHandler].
@ProviderFor(mapPageHandler)
final mapPageHandlerProvider = AutoDisposeFutureProvider<void>.internal(
  mapPageHandler,
  name: r'mapPageHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapPageHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MapPageHandlerRef = AutoDisposeFutureProviderRef<void>;
String _$mapLocamusicDetailPageHandlerHash() =>
    r'fa1974aab6624005f05b2df60f8a70e0bac5000c';

/// [LocamusicDetailPage] のMapViewのハンドリング
///
/// Copied from [mapLocamusicDetailPageHandler].
@ProviderFor(mapLocamusicDetailPageHandler)
const mapLocamusicDetailPageHandlerProvider =
    MapLocamusicDetailPageHandlerFamily();

/// [LocamusicDetailPage] のMapViewのハンドリング
///
/// Copied from [mapLocamusicDetailPageHandler].
class MapLocamusicDetailPageHandlerFamily extends Family<AsyncValue<void>> {
  /// [LocamusicDetailPage] のMapViewのハンドリング
  ///
  /// Copied from [mapLocamusicDetailPageHandler].
  const MapLocamusicDetailPageHandlerFamily();

  /// [LocamusicDetailPage] のMapViewのハンドリング
  ///
  /// Copied from [mapLocamusicDetailPageHandler].
  MapLocamusicDetailPageHandlerProvider call(
    String documentId,
  ) {
    return MapLocamusicDetailPageHandlerProvider(
      documentId,
    );
  }

  @override
  MapLocamusicDetailPageHandlerProvider getProviderOverride(
    covariant MapLocamusicDetailPageHandlerProvider provider,
  ) {
    return call(
      provider.documentId,
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
  String? get name => r'mapLocamusicDetailPageHandlerProvider';
}

/// [LocamusicDetailPage] のMapViewのハンドリング
///
/// Copied from [mapLocamusicDetailPageHandler].
class MapLocamusicDetailPageHandlerProvider
    extends AutoDisposeFutureProvider<void> {
  /// [LocamusicDetailPage] のMapViewのハンドリング
  ///
  /// Copied from [mapLocamusicDetailPageHandler].
  MapLocamusicDetailPageHandlerProvider(
    String documentId,
  ) : this._internal(
          (ref) => mapLocamusicDetailPageHandler(
            ref as MapLocamusicDetailPageHandlerRef,
            documentId,
          ),
          from: mapLocamusicDetailPageHandlerProvider,
          name: r'mapLocamusicDetailPageHandlerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapLocamusicDetailPageHandlerHash,
          dependencies: MapLocamusicDetailPageHandlerFamily._dependencies,
          allTransitiveDependencies:
              MapLocamusicDetailPageHandlerFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  MapLocamusicDetailPageHandlerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentId,
  }) : super.internal();

  final String documentId;

  @override
  Override overrideWith(
    FutureOr<void> Function(MapLocamusicDetailPageHandlerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapLocamusicDetailPageHandlerProvider._internal(
        (ref) => create(ref as MapLocamusicDetailPageHandlerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        documentId: documentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MapLocamusicDetailPageHandlerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapLocamusicDetailPageHandlerProvider &&
        other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapLocamusicDetailPageHandlerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _MapLocamusicDetailPageHandlerProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with MapLocamusicDetailPageHandlerRef {
  _MapLocamusicDetailPageHandlerProviderElement(super.provider);

  @override
  String get documentId =>
      (origin as MapLocamusicDetailPageHandlerProvider).documentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
