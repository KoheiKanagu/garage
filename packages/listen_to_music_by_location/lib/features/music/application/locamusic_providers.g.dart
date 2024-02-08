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
    r'aa0e6569dca856f586eec735d3f49bcc2815672a';

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

String _$locamusicAddHash() => r'52e3066430e404a04e16662bbb0dce7bb94ea32c';

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

String _$locamusicRegionHandlerHash() =>
    r'ded1665fbcb459fcb8a247e7cc50b4f11afc164c';

/// Locamusicのドキュメントの変更を監視し、Regionを登録する
///
/// Copied from [locamusicRegionHandler].
@ProviderFor(locamusicRegionHandler)
final locamusicRegionHandlerProvider = AutoDisposeFutureProvider<void>.internal(
  locamusicRegionHandler,
  name: r'locamusicRegionHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locamusicRegionHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocamusicRegionHandlerRef = AutoDisposeFutureProviderRef<void>;
String _$locamusicHandlerHash() => r'39404730c76ebb3ab70c0c00ca88bfe416dfa4a4';

/// ジオフェンスの状態を監視し、曲の再生を制御する
///
/// Providerには、アプリがバックグラウンドにある場合は動作しない問題がある。
/// そのためProviderを利用しない方法で実装する。
///
/// https://github.com/rrousselGit/riverpod/issues/2671
/// この問題が解決すればProviderを利用する実装に変更予定
///
/// Copied from [locamusicHandler].
@ProviderFor(locamusicHandler)
const locamusicHandlerProvider = LocamusicHandlerFamily();

/// ジオフェンスの状態を監視し、曲の再生を制御する
///
/// Providerには、アプリがバックグラウンドにある場合は動作しない問題がある。
/// そのためProviderを利用しない方法で実装する。
///
/// https://github.com/rrousselGit/riverpod/issues/2671
/// この問題が解決すればProviderを利用する実装に変更予定
///
/// Copied from [locamusicHandler].
class LocamusicHandlerFamily extends Family<AsyncValue<void>> {
  /// ジオフェンスの状態を監視し、曲の再生を制御する
  ///
  /// Providerには、アプリがバックグラウンドにある場合は動作しない問題がある。
  /// そのためProviderを利用しない方法で実装する。
  ///
  /// https://github.com/rrousselGit/riverpod/issues/2671
  /// この問題が解決すればProviderを利用する実装に変更予定
  ///
  /// Copied from [locamusicHandler].
  const LocamusicHandlerFamily();

  /// ジオフェンスの状態を監視し、曲の再生を制御する
  ///
  /// Providerには、アプリがバックグラウンドにある場合は動作しない問題がある。
  /// そのためProviderを利用しない方法で実装する。
  ///
  /// https://github.com/rrousselGit/riverpod/issues/2671
  /// この問題が解決すればProviderを利用する実装に変更予定
  ///
  /// Copied from [locamusicHandler].
  LocamusicHandlerProvider call({
    required Stream<({Region region, RegionState state})>
        didDetermineStateStream,
    required CollectionReference<Locamusic> collectionReference,
    required MusicKit musicKit,
    required AnalyticsController analyticsController,
  }) {
    return LocamusicHandlerProvider(
      didDetermineStateStream: didDetermineStateStream,
      collectionReference: collectionReference,
      musicKit: musicKit,
      analyticsController: analyticsController,
    );
  }

  @override
  LocamusicHandlerProvider getProviderOverride(
    covariant LocamusicHandlerProvider provider,
  ) {
    return call(
      didDetermineStateStream: provider.didDetermineStateStream,
      collectionReference: provider.collectionReference,
      musicKit: provider.musicKit,
      analyticsController: provider.analyticsController,
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
  String? get name => r'locamusicHandlerProvider';
}

/// ジオフェンスの状態を監視し、曲の再生を制御する
///
/// Providerには、アプリがバックグラウンドにある場合は動作しない問題がある。
/// そのためProviderを利用しない方法で実装する。
///
/// https://github.com/rrousselGit/riverpod/issues/2671
/// この問題が解決すればProviderを利用する実装に変更予定
///
/// Copied from [locamusicHandler].
class LocamusicHandlerProvider extends AutoDisposeFutureProvider<void> {
  /// ジオフェンスの状態を監視し、曲の再生を制御する
  ///
  /// Providerには、アプリがバックグラウンドにある場合は動作しない問題がある。
  /// そのためProviderを利用しない方法で実装する。
  ///
  /// https://github.com/rrousselGit/riverpod/issues/2671
  /// この問題が解決すればProviderを利用する実装に変更予定
  ///
  /// Copied from [locamusicHandler].
  LocamusicHandlerProvider({
    required Stream<({Region region, RegionState state})>
        didDetermineStateStream,
    required CollectionReference<Locamusic> collectionReference,
    required MusicKit musicKit,
    required AnalyticsController analyticsController,
  }) : this._internal(
          (ref) => locamusicHandler(
            ref as LocamusicHandlerRef,
            didDetermineStateStream: didDetermineStateStream,
            collectionReference: collectionReference,
            musicKit: musicKit,
            analyticsController: analyticsController,
          ),
          from: locamusicHandlerProvider,
          name: r'locamusicHandlerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locamusicHandlerHash,
          dependencies: LocamusicHandlerFamily._dependencies,
          allTransitiveDependencies:
              LocamusicHandlerFamily._allTransitiveDependencies,
          didDetermineStateStream: didDetermineStateStream,
          collectionReference: collectionReference,
          musicKit: musicKit,
          analyticsController: analyticsController,
        );

  LocamusicHandlerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.didDetermineStateStream,
    required this.collectionReference,
    required this.musicKit,
    required this.analyticsController,
  }) : super.internal();

  final Stream<({Region region, RegionState state})> didDetermineStateStream;
  final CollectionReference<Locamusic> collectionReference;
  final MusicKit musicKit;
  final AnalyticsController analyticsController;

  @override
  Override overrideWith(
    FutureOr<void> Function(LocamusicHandlerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocamusicHandlerProvider._internal(
        (ref) => create(ref as LocamusicHandlerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        didDetermineStateStream: didDetermineStateStream,
        collectionReference: collectionReference,
        musicKit: musicKit,
        analyticsController: analyticsController,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LocamusicHandlerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocamusicHandlerProvider &&
        other.didDetermineStateStream == didDetermineStateStream &&
        other.collectionReference == collectionReference &&
        other.musicKit == musicKit &&
        other.analyticsController == analyticsController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, didDetermineStateStream.hashCode);
    hash = _SystemHash.combine(hash, collectionReference.hashCode);
    hash = _SystemHash.combine(hash, musicKit.hashCode);
    hash = _SystemHash.combine(hash, analyticsController.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocamusicHandlerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `didDetermineStateStream` of this provider.
  Stream<({Region region, RegionState state})> get didDetermineStateStream;

  /// The parameter `collectionReference` of this provider.
  CollectionReference<Locamusic> get collectionReference;

  /// The parameter `musicKit` of this provider.
  MusicKit get musicKit;

  /// The parameter `analyticsController` of this provider.
  AnalyticsController get analyticsController;
}

class _LocamusicHandlerProviderElement
    extends AutoDisposeFutureProviderElement<void> with LocamusicHandlerRef {
  _LocamusicHandlerProviderElement(super.provider);

  @override
  Stream<({Region region, RegionState state})> get didDetermineStateStream =>
      (origin as LocamusicHandlerProvider).didDetermineStateStream;
  @override
  CollectionReference<Locamusic> get collectionReference =>
      (origin as LocamusicHandlerProvider).collectionReference;
  @override
  MusicKit get musicKit => (origin as LocamusicHandlerProvider).musicKit;
  @override
  AnalyticsController get analyticsController =>
      (origin as LocamusicHandlerProvider).analyticsController;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
