// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'locamusic_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locamusicCollectionReferenceHash() =>
    r'9394fec8ae51fbe84a08c62e1593598af1aa0710';

/// See also [locamusicCollectionReference].
@ProviderFor(locamusicCollectionReference)
final locamusicCollectionReferenceProvider =
    AutoDisposeProvider<CollectionReference<Locamusic>>.internal(
  locamusicCollectionReference,
  name: r'locamusicCollectionReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicCollectionReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicCollectionReferenceRef
    = AutoDisposeProviderRef<CollectionReference<Locamusic>>;
String _$locamusicQuerySnapshotHash() =>
    r'd0d73d038d23a5592f17190f536b2a9ebdfc598a';

/// See also [locamusicQuerySnapshot].
@ProviderFor(locamusicQuerySnapshot)
final locamusicQuerySnapshotProvider =
    AutoDisposeStreamProvider<QuerySnapshot<Locamusic>>.internal(
  locamusicQuerySnapshot,
  name: r'locamusicQuerySnapshotProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicQuerySnapshotHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicQuerySnapshotRef
    = AutoDisposeStreamProviderRef<QuerySnapshot<Locamusic>>;
String _$locamusicWithSongDetailsHash() =>
    r'c5b63cd71dbaced85a4625fbafc40e26fbcc5d2c';

/// See also [locamusicWithSongDetails].
@ProviderFor(locamusicWithSongDetails)
final locamusicWithSongDetailsProvider = AutoDisposeFutureProvider<
    List<
        ({
          String documentId,
          Locamusic locamusic,
          SongDetails? songDetails
        })>>.internal(
  locamusicWithSongDetails,
  name: r'locamusicWithSongDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicWithSongDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicWithSongDetailsRef = AutoDisposeFutureProviderRef<
    List<({String documentId, Locamusic locamusic, SongDetails? songDetails})>>;
String _$locamusicAddHash() => r'c1524cd38ca3fc8a265372d10ff6e2b5b5ec1379';

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

/// See also [locamusicAdd].
@ProviderFor(locamusicAdd)
const locamusicAddProvider = LocamusicAddFamily();

/// See also [locamusicAdd].
class LocamusicAddFamily extends Family<AsyncValue<void>> {
  /// See also [locamusicAdd].
  const LocamusicAddFamily();

  /// See also [locamusicAdd].
  LocamusicAddProvider call({
    required GeoPoint geoPoint,
    required DistanceRange distanceRange,
  }) {
    return LocamusicAddProvider(
      geoPoint: geoPoint,
      distanceRange: distanceRange,
    );
  }

  @override
  LocamusicAddProvider getProviderOverride(
    covariant LocamusicAddProvider provider,
  ) {
    return call(
      geoPoint: provider.geoPoint,
      distanceRange: provider.distanceRange,
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
  String? get name => r'locamusicAddProvider';
}

/// See also [locamusicAdd].
class LocamusicAddProvider extends AutoDisposeFutureProvider<void> {
  /// See also [locamusicAdd].
  LocamusicAddProvider({
    required GeoPoint geoPoint,
    required DistanceRange distanceRange,
  }) : this._internal(
          (ref) => locamusicAdd(
            ref as LocamusicAddRef,
            geoPoint: geoPoint,
            distanceRange: distanceRange,
          ),
          from: locamusicAddProvider,
          name: r'locamusicAddProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicAddHash,
          dependencies: LocamusicAddFamily._dependencies,
          allTransitiveDependencies:
              LocamusicAddFamily._allTransitiveDependencies,
          geoPoint: geoPoint,
          distanceRange: distanceRange,
        );

  LocamusicAddProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.geoPoint,
    required this.distanceRange,
  }) : super.internal();

  final GeoPoint geoPoint;
  final DistanceRange distanceRange;

  @override
  Override overrideWith(
    FutureOr<void> Function(LocamusicAddRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicAddProvider._internal(
        (ref) => create(ref as LocamusicAddRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        geoPoint: geoPoint,
        distanceRange: distanceRange,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LocamusicAddProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicAddProvider &&
        other.geoPoint == geoPoint &&
        other.distanceRange == distanceRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, geoPoint.hashCode);
    hash = _SystemHash.combine(hash, distanceRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicAddRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `geoPoint` of this provider.
  GeoPoint get geoPoint;

  /// The parameter `distanceRange` of this provider.
  DistanceRange get distanceRange;
}

class _LocamusicAddProviderElement
    extends AutoDisposeFutureProviderElement<void> with LocamusicAddRef {
  _LocamusicAddProviderElement(super.provider);

  @override
  GeoPoint get geoPoint => (origin as LocamusicAddProvider).geoPoint;
  @override
  DistanceRange get distanceRange =>
      (origin as LocamusicAddProvider).distanceRange;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
