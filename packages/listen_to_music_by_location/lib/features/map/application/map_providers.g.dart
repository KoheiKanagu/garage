// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapOnLongPressedHash() => r'b3f20159969ea5a02d335987babeb1c3c2a3acd7';

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

/// See also [mapOnLongPressed].
@ProviderFor(mapOnLongPressed)
const mapOnLongPressedProvider = MapOnLongPressedFamily();

/// See also [mapOnLongPressed].
class MapOnLongPressedFamily extends Family<AsyncValue<void>> {
  /// See also [mapOnLongPressed].
  const MapOnLongPressedFamily();

  /// See also [mapOnLongPressed].
  MapOnLongPressedProvider call({
    required double latitude,
    required double longitude,
  }) {
    return MapOnLongPressedProvider(
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  MapOnLongPressedProvider getProviderOverride(
    covariant MapOnLongPressedProvider provider,
  ) {
    return call(
      latitude: provider.latitude,
      longitude: provider.longitude,
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
  String? get name => r'mapOnLongPressedProvider';
}

/// See also [mapOnLongPressed].
class MapOnLongPressedProvider extends AutoDisposeFutureProvider<void> {
  /// See also [mapOnLongPressed].
  MapOnLongPressedProvider({
    required double latitude,
    required double longitude,
  }) : this._internal(
          (ref) => mapOnLongPressed(
            ref as MapOnLongPressedRef,
            latitude: latitude,
            longitude: longitude,
          ),
          from: mapOnLongPressedProvider,
          name: r'mapOnLongPressedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapOnLongPressedHash,
          dependencies: MapOnLongPressedFamily._dependencies,
          allTransitiveDependencies:
              MapOnLongPressedFamily._allTransitiveDependencies,
          latitude: latitude,
          longitude: longitude,
        );

  MapOnLongPressedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.latitude,
    required this.longitude,
  }) : super.internal();

  final double latitude;
  final double longitude;

  @override
  Override overrideWith(
    FutureOr<void> Function(MapOnLongPressedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapOnLongPressedProvider._internal(
        (ref) => create(ref as MapOnLongPressedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MapOnLongPressedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapOnLongPressedProvider &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, latitude.hashCode);
    hash = _SystemHash.combine(hash, longitude.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapOnLongPressedRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `latitude` of this provider.
  double get latitude;

  /// The parameter `longitude` of this provider.
  double get longitude;
}

class _MapOnLongPressedProviderElement
    extends AutoDisposeFutureProviderElement<void> with MapOnLongPressedRef {
  _MapOnLongPressedProviderElement(super.provider);

  @override
  double get latitude => (origin as MapOnLongPressedProvider).latitude;
  @override
  double get longitude => (origin as MapOnLongPressedProvider).longitude;
}

String _$mapOnTapCircleHash() => r'fc02ab7ae32e453b8bf127887446fd4e0d99903c';

/// See also [mapOnTapCircle].
@ProviderFor(mapOnTapCircle)
const mapOnTapCircleProvider = MapOnTapCircleFamily();

/// See also [mapOnTapCircle].
class MapOnTapCircleFamily extends Family<AsyncValue<void>> {
  /// See also [mapOnTapCircle].
  const MapOnTapCircleFamily();

  /// See also [mapOnTapCircle].
  MapOnTapCircleProvider call({
    required String identifier,
  }) {
    return MapOnTapCircleProvider(
      identifier: identifier,
    );
  }

  @override
  MapOnTapCircleProvider getProviderOverride(
    covariant MapOnTapCircleProvider provider,
  ) {
    return call(
      identifier: provider.identifier,
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
  String? get name => r'mapOnTapCircleProvider';
}

/// See also [mapOnTapCircle].
class MapOnTapCircleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [mapOnTapCircle].
  MapOnTapCircleProvider({
    required String identifier,
  }) : this._internal(
          (ref) => mapOnTapCircle(
            ref as MapOnTapCircleRef,
            identifier: identifier,
          ),
          from: mapOnTapCircleProvider,
          name: r'mapOnTapCircleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mapOnTapCircleHash,
          dependencies: MapOnTapCircleFamily._dependencies,
          allTransitiveDependencies:
              MapOnTapCircleFamily._allTransitiveDependencies,
          identifier: identifier,
        );

  MapOnTapCircleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.identifier,
  }) : super.internal();

  final String identifier;

  @override
  Override overrideWith(
    FutureOr<void> Function(MapOnTapCircleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MapOnTapCircleProvider._internal(
        (ref) => create(ref as MapOnTapCircleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        identifier: identifier,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MapOnTapCircleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapOnTapCircleProvider && other.identifier == identifier;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, identifier.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MapOnTapCircleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `identifier` of this provider.
  String get identifier;
}

class _MapOnTapCircleProviderElement
    extends AutoDisposeFutureProviderElement<void> with MapOnTapCircleRef {
  _MapOnTapCircleProviderElement(super.provider);

  @override
  String get identifier => (origin as MapOnTapCircleProvider).identifier;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
