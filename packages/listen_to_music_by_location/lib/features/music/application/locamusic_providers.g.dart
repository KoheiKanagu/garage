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
String _$locamusicDocumentsHash() =>
    r'b3bf4e2c5dd7cbe58e38a4d8db1bc545baa1f53f';

/// See also [locamusicDocuments].
@ProviderFor(locamusicDocuments)
final locamusicDocumentsProvider =
    AutoDisposeStreamProvider<List<LocamusicWithDocumentId>>.internal(
  locamusicDocuments,
  name: r'locamusicDocumentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicDocumentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicDocumentsRef
    = AutoDisposeStreamProviderRef<List<LocamusicWithDocumentId>>;
String _$locamusicDocumentHash() => r'fc10d220acc2f18ca750bd948dec3b85af32e65e';

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

/// See also [locamusicDocument].
@ProviderFor(locamusicDocument)
const locamusicDocumentProvider = LocamusicDocumentFamily();

/// See also [locamusicDocument].
class LocamusicDocumentFamily extends Family<AsyncValue<Locamusic>> {
  /// See also [locamusicDocument].
  const LocamusicDocumentFamily();

  /// See also [locamusicDocument].
  LocamusicDocumentProvider call(
    String documentId,
  ) {
    return LocamusicDocumentProvider(
      documentId,
    );
  }

  @override
  LocamusicDocumentProvider getProviderOverride(
    covariant LocamusicDocumentProvider provider,
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
  String? get name => r'locamusicDocumentProvider';
}

/// See also [locamusicDocument].
class LocamusicDocumentProvider extends AutoDisposeStreamProvider<Locamusic> {
  /// See also [locamusicDocument].
  LocamusicDocumentProvider(
    String documentId,
  ) : this._internal(
          (ref) => locamusicDocument(
            ref as LocamusicDocumentRef,
            documentId,
          ),
          from: locamusicDocumentProvider,
          name: r'locamusicDocumentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicDocumentHash,
          dependencies: LocamusicDocumentFamily._dependencies,
          allTransitiveDependencies:
              LocamusicDocumentFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  LocamusicDocumentProvider._internal(
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
    Stream<Locamusic> Function(LocamusicDocumentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicDocumentProvider._internal(
        (ref) => create(ref as LocamusicDocumentRef),
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
    return _LocamusicDocumentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicDocumentProvider && other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicDocumentRef on AutoDisposeStreamProviderRef<Locamusic> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _LocamusicDocumentProviderElement
    extends AutoDisposeStreamProviderElement<Locamusic>
    with LocamusicDocumentRef {
  _LocamusicDocumentProviderElement(super.provider);

  @override
  String get documentId => (origin as LocamusicDocumentProvider).documentId;
}

String _$locamusicSongDetailsHash() =>
    r'a3bed751b1964eb2c06754e3913d2f47d9ecb1ef';

/// See also [locamusicSongDetails].
@ProviderFor(locamusicSongDetails)
const locamusicSongDetailsProvider = LocamusicSongDetailsFamily();

/// See also [locamusicSongDetails].
class LocamusicSongDetailsFamily extends Family<AsyncValue<SongDetails>> {
  /// See also [locamusicSongDetails].
  const LocamusicSongDetailsFamily();

  /// See also [locamusicSongDetails].
  LocamusicSongDetailsProvider call(
    String musicId,
  ) {
    return LocamusicSongDetailsProvider(
      musicId,
    );
  }

  @override
  LocamusicSongDetailsProvider getProviderOverride(
    covariant LocamusicSongDetailsProvider provider,
  ) {
    return call(
      provider.musicId,
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
  LocamusicSongDetailsProvider(
    String musicId,
  ) : this._internal(
          (ref) => locamusicSongDetails(
            ref as LocamusicSongDetailsRef,
            musicId,
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

String _$locamusicAddHash() => r'aeb6142296497d3de168292871dce3beac6558a4';

/// [CollectionPath.kLocamusics]に[Locamusic]を追加する
///
/// 追加に成功した場合はDocumentIdを返す
///
/// Copied from [locamusicAdd].
@ProviderFor(locamusicAdd)
const locamusicAddProvider = LocamusicAddFamily();

/// [CollectionPath.kLocamusics]に[Locamusic]を追加する
///
/// 追加に成功した場合はDocumentIdを返す
///
/// Copied from [locamusicAdd].
class LocamusicAddFamily extends Family<AsyncValue<String>> {
  /// [CollectionPath.kLocamusics]に[Locamusic]を追加する
  ///
  /// 追加に成功した場合はDocumentIdを返す
  ///
  /// Copied from [locamusicAdd].
  const LocamusicAddFamily();

  /// [CollectionPath.kLocamusics]に[Locamusic]を追加する
  ///
  /// 追加に成功した場合はDocumentIdを返す
  ///
  /// Copied from [locamusicAdd].
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

/// [CollectionPath.kLocamusics]に[Locamusic]を追加する
///
/// 追加に成功した場合はDocumentIdを返す
///
/// Copied from [locamusicAdd].
class LocamusicAddProvider extends AutoDisposeFutureProvider<String> {
  /// [CollectionPath.kLocamusics]に[Locamusic]を追加する
  ///
  /// 追加に成功した場合はDocumentIdを返す
  ///
  /// Copied from [locamusicAdd].
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
    FutureOr<String> Function(LocamusicAddRef provider) create,
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
  AutoDisposeFutureProviderElement<String> createElement() {
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

mixin LocamusicAddRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `geoPoint` of this provider.
  GeoPoint get geoPoint;

  /// The parameter `distanceRange` of this provider.
  DistanceRange get distanceRange;
}

class _LocamusicAddProviderElement
    extends AutoDisposeFutureProviderElement<String> with LocamusicAddRef {
  _LocamusicAddProviderElement(super.provider);

  @override
  GeoPoint get geoPoint => (origin as LocamusicAddProvider).geoPoint;
  @override
  DistanceRange get distanceRange =>
      (origin as LocamusicAddProvider).distanceRange;
}

String _$locamusicUpdateHash() => r'ce95eead374e572da1a832e498b208649229acea';

/// See also [locamusicUpdate].
@ProviderFor(locamusicUpdate)
const locamusicUpdateProvider = LocamusicUpdateFamily();

/// See also [locamusicUpdate].
class LocamusicUpdateFamily extends Family<AsyncValue<void>> {
  /// See also [locamusicUpdate].
  const LocamusicUpdateFamily();

  /// See also [locamusicUpdate].
  LocamusicUpdateProvider call(
    String documentId, {
    required Locamusic locamusic,
  }) {
    return LocamusicUpdateProvider(
      documentId,
      locamusic: locamusic,
    );
  }

  @override
  LocamusicUpdateProvider getProviderOverride(
    covariant LocamusicUpdateProvider provider,
  ) {
    return call(
      provider.documentId,
      locamusic: provider.locamusic,
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
  String? get name => r'locamusicUpdateProvider';
}

/// See also [locamusicUpdate].
class LocamusicUpdateProvider extends AutoDisposeFutureProvider<void> {
  /// See also [locamusicUpdate].
  LocamusicUpdateProvider(
    String documentId, {
    required Locamusic locamusic,
  }) : this._internal(
          (ref) => locamusicUpdate(
            ref as LocamusicUpdateRef,
            documentId,
            locamusic: locamusic,
          ),
          from: locamusicUpdateProvider,
          name: r'locamusicUpdateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicUpdateHash,
          dependencies: LocamusicUpdateFamily._dependencies,
          allTransitiveDependencies:
              LocamusicUpdateFamily._allTransitiveDependencies,
          documentId: documentId,
          locamusic: locamusic,
        );

  LocamusicUpdateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentId,
    required this.locamusic,
  }) : super.internal();

  final String documentId;
  final Locamusic locamusic;

  @override
  Override overrideWith(
    FutureOr<void> Function(LocamusicUpdateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicUpdateProvider._internal(
        (ref) => create(ref as LocamusicUpdateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        documentId: documentId,
        locamusic: locamusic,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LocamusicUpdateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicUpdateProvider &&
        other.documentId == documentId &&
        other.locamusic == locamusic;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);
    hash = _SystemHash.combine(hash, locamusic.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicUpdateRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `documentId` of this provider.
  String get documentId;

  /// The parameter `locamusic` of this provider.
  Locamusic get locamusic;
}

class _LocamusicUpdateProviderElement
    extends AutoDisposeFutureProviderElement<void> with LocamusicUpdateRef {
  _LocamusicUpdateProviderElement(super.provider);

  @override
  String get documentId => (origin as LocamusicUpdateProvider).documentId;
  @override
  Locamusic get locamusic => (origin as LocamusicUpdateProvider).locamusic;
}

String _$locamusicDeleteHash() => r'ebdfb317284033ebd0c9e899f1055a2b513fcaeb';

/// See also [locamusicDelete].
@ProviderFor(locamusicDelete)
const locamusicDeleteProvider = LocamusicDeleteFamily();

/// See also [locamusicDelete].
class LocamusicDeleteFamily extends Family<AsyncValue<void>> {
  /// See also [locamusicDelete].
  const LocamusicDeleteFamily();

  /// See also [locamusicDelete].
  LocamusicDeleteProvider call(
    String documentId,
  ) {
    return LocamusicDeleteProvider(
      documentId,
    );
  }

  @override
  LocamusicDeleteProvider getProviderOverride(
    covariant LocamusicDeleteProvider provider,
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
  String? get name => r'locamusicDeleteProvider';
}

/// See also [locamusicDelete].
class LocamusicDeleteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [locamusicDelete].
  LocamusicDeleteProvider(
    String documentId,
  ) : this._internal(
          (ref) => locamusicDelete(
            ref as LocamusicDeleteRef,
            documentId,
          ),
          from: locamusicDeleteProvider,
          name: r'locamusicDeleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicDeleteHash,
          dependencies: LocamusicDeleteFamily._dependencies,
          allTransitiveDependencies:
              LocamusicDeleteFamily._allTransitiveDependencies,
          documentId: documentId,
        );

  LocamusicDeleteProvider._internal(
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
    FutureOr<void> Function(LocamusicDeleteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicDeleteProvider._internal(
        (ref) => create(ref as LocamusicDeleteRef),
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
    return _LocamusicDeleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicDeleteProvider && other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicDeleteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _LocamusicDeleteProviderElement
    extends AutoDisposeFutureProviderElement<void> with LocamusicDeleteRef {
  _LocamusicDeleteProviderElement(super.provider);

  @override
  String get documentId => (origin as LocamusicDeleteProvider).documentId;
}

String _$locamusicRegionRegisterHash() =>
    r'26755e6ba8f5e1e9476faa4f161a3670f055eb7e';

/// Locamusicのドキュメントの変更を監視し、Regionを登録する
///
/// Copied from [locamusicRegionRegister].
@ProviderFor(locamusicRegionRegister)
final locamusicRegionRegisterProvider =
    AutoDisposeFutureProvider<void>.internal(
  locamusicRegionRegister,
  name: r'locamusicRegionRegisterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicRegionRegisterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicRegionRegisterRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
