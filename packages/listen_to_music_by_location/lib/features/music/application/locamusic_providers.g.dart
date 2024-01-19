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
String _$locamusicQueryHash() => r'87cf3673e9793531d031df51d870c451de5de007';

/// See also [locamusicQuery].
@ProviderFor(locamusicQuery)
final locamusicQueryProvider =
    AutoDisposeFutureProvider<Query<Locamusic>>.internal(
  locamusicQuery,
  name: r'locamusicQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicQueryRef = AutoDisposeFutureProviderRef<Query<Locamusic>>;
String _$locamusicQuerySnapshotHash() =>
    r'da4695d8b05775bada0b1418604c5515afdf767f';

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
String _$locamusicSnapshotHash() => r'f3c97969f81e893a7944553b1c94472370f7208f';

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

/// See also [locamusicSnapshot].
@ProviderFor(locamusicSnapshot)
const locamusicSnapshotProvider = LocamusicSnapshotFamily();

/// See also [locamusicSnapshot].
class LocamusicSnapshotFamily extends Family<AsyncValue<Locamusic>> {
  /// See also [locamusicSnapshot].
  const LocamusicSnapshotFamily();

  /// See also [locamusicSnapshot].
  LocamusicSnapshotProvider call({
    required String documentId,
  }) {
    return LocamusicSnapshotProvider(
      documentId: documentId,
    );
  }

  @override
  LocamusicSnapshotProvider getProviderOverride(
    covariant LocamusicSnapshotProvider provider,
  ) {
    return call(
      documentId: provider.documentId,
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
  String? get name => r'locamusicSnapshotProvider';
}

/// See also [locamusicSnapshot].
class LocamusicSnapshotProvider extends AutoDisposeStreamProvider<Locamusic> {
  /// See also [locamusicSnapshot].
  LocamusicSnapshotProvider({
    required String documentId,
  }) : this._internal(
          (ref) => locamusicSnapshot(
            ref as LocamusicSnapshotRef,
            documentId: documentId,
          ),
          from: locamusicSnapshotProvider,
          name: r'locamusicSnapshotProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicSnapshotHash,
          dependencies: LocamusicSnapshotFamily._dependencies,
          allTransitiveDependencies:
              LocamusicSnapshotFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  LocamusicSnapshotProvider._internal(
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
    Stream<Locamusic> Function(LocamusicSnapshotRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicSnapshotProvider._internal(
        (ref) => create(ref as LocamusicSnapshotRef),
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
  AutoDisposeStreamProviderElement<Locamusic> createElement() {
    return _LocamusicSnapshotProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicSnapshotProvider && other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicSnapshotRef on AutoDisposeStreamProviderRef<Locamusic> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _LocamusicSnapshotProviderElement
    extends AutoDisposeStreamProviderElement<Locamusic>
    with LocamusicSnapshotRef {
  _LocamusicSnapshotProviderElement(super.provider);

  @override
  String get documentId => (origin as LocamusicSnapshotProvider).documentId;
}

String _$locamusicWithSongDetailsHash() =>
    r'a6223c6fd22f32ab26977cb01f7841d8b5296846';

/// See also [locamusicWithSongDetails].
@ProviderFor(locamusicWithSongDetails)
const locamusicWithSongDetailsProvider = LocamusicWithSongDetailsFamily();

/// See also [locamusicWithSongDetails].
class LocamusicWithSongDetailsFamily extends Family<
    AsyncValue<({Locamusic locamusic, SongDetails? songDetails})>> {
  /// See also [locamusicWithSongDetails].
  const LocamusicWithSongDetailsFamily();

  /// See also [locamusicWithSongDetails].
  LocamusicWithSongDetailsProvider call({
    required String documentId,
  }) {
    return LocamusicWithSongDetailsProvider(
      documentId: documentId,
    );
  }

  @override
  LocamusicWithSongDetailsProvider getProviderOverride(
    covariant LocamusicWithSongDetailsProvider provider,
  ) {
    return call(
      documentId: provider.documentId,
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
  String? get name => r'locamusicWithSongDetailsProvider';
}

/// See also [locamusicWithSongDetails].
class LocamusicWithSongDetailsProvider extends AutoDisposeStreamProvider<
    ({Locamusic locamusic, SongDetails? songDetails})> {
  /// See also [locamusicWithSongDetails].
  LocamusicWithSongDetailsProvider({
    required String documentId,
  }) : this._internal(
          (ref) => locamusicWithSongDetails(
            ref as LocamusicWithSongDetailsRef,
            documentId: documentId,
          ),
          from: locamusicWithSongDetailsProvider,
          name: r'locamusicWithSongDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicWithSongDetailsHash,
          dependencies: LocamusicWithSongDetailsFamily._dependencies,
          allTransitiveDependencies:
              LocamusicWithSongDetailsFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  LocamusicWithSongDetailsProvider._internal(
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
    Stream<({Locamusic locamusic, SongDetails? songDetails})> Function(
            LocamusicWithSongDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicWithSongDetailsProvider._internal(
        (ref) => create(ref as LocamusicWithSongDetailsRef),
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
  AutoDisposeStreamProviderElement<
      ({Locamusic locamusic, SongDetails? songDetails})> createElement() {
    return _LocamusicWithSongDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicWithSongDetailsProvider &&
        other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicWithSongDetailsRef on AutoDisposeStreamProviderRef<
    ({Locamusic locamusic, SongDetails? songDetails})> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _LocamusicWithSongDetailsProviderElement
    extends AutoDisposeStreamProviderElement<
        ({Locamusic locamusic, SongDetails? songDetails})>
    with LocamusicWithSongDetailsRef {
  _LocamusicWithSongDetailsProviderElement(super.provider);

  @override
  String get documentId =>
      (origin as LocamusicWithSongDetailsProvider).documentId;
}

String _$locamusicSongDetailsHash() =>
    r'08bead629d22b03f9f049099a2917bec8bf6148b';

/// See also [locamusicSongDetails].
@ProviderFor(locamusicSongDetails)
const locamusicSongDetailsProvider = LocamusicSongDetailsFamily();

/// See also [locamusicSongDetails].
class LocamusicSongDetailsFamily extends Family<AsyncValue<SongDetails>> {
  /// See also [locamusicSongDetails].
  const LocamusicSongDetailsFamily();

  /// See also [locamusicSongDetails].
  LocamusicSongDetailsProvider call({
    required String musicId,
  }) {
    return LocamusicSongDetailsProvider(
      musicId: musicId,
    );
  }

  @override
  LocamusicSongDetailsProvider getProviderOverride(
    covariant LocamusicSongDetailsProvider provider,
  ) {
    return call(
      musicId: provider.musicId,
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
  String? get name => r'locamusicSongDetailsProvider';
}

/// See also [locamusicSongDetails].
class LocamusicSongDetailsProvider
    extends AutoDisposeFutureProvider<SongDetails> {
  /// See also [locamusicSongDetails].
  LocamusicSongDetailsProvider({
    required String musicId,
  }) : this._internal(
          (ref) => locamusicSongDetails(
            ref as LocamusicSongDetailsRef,
            musicId: musicId,
          ),
          from: locamusicSongDetailsProvider,
          name: r'locamusicSongDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicSongDetailsHash,
          dependencies: LocamusicSongDetailsFamily._dependencies,
          allTransitiveDependencies:
              LocamusicSongDetailsFamily._allTransitiveDependencies,
          musicId: musicId,
        );

  LocamusicSongDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.musicId,
  }) : super.internal();

  final String musicId;

  @override
  Override overrideWith(
    FutureOr<SongDetails> Function(LocamusicSongDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicSongDetailsProvider._internal(
        (ref) => create(ref as LocamusicSongDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        musicId: musicId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SongDetails> createElement() {
    return _LocamusicSongDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicSongDetailsProvider && other.musicId == musicId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, musicId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicSongDetailsRef on AutoDisposeFutureProviderRef<SongDetails> {
  /// The parameter `musicId` of this provider.
  String get musicId;
}

class _LocamusicSongDetailsProviderElement
    extends AutoDisposeFutureProviderElement<SongDetails>
    with LocamusicSongDetailsRef {
  _LocamusicSongDetailsProviderElement(super.provider);

  @override
  String get musicId => (origin as LocamusicSongDetailsProvider).musicId;
}

String _$locamusicsWithSongDetailsHash() =>
    r'a0dc4c20217e6105f79f846359e509788cb9077f';

/// See also [locamusicsWithSongDetails].
@ProviderFor(locamusicsWithSongDetails)
final locamusicsWithSongDetailsProvider = AutoDisposeFutureProvider<
    List<
        ({
          String documentId,
          Locamusic locamusic,
          SongDetails? songDetails
        })>>.internal(
  locamusicsWithSongDetails,
  name: r'locamusicsWithSongDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicsWithSongDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicsWithSongDetailsRef = AutoDisposeFutureProviderRef<
    List<({String documentId, Locamusic locamusic, SongDetails? songDetails})>>;
String _$locamusicAddHash() => r'56f1b0da375d09cc73cdaf3494f3264f898c7977';

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
