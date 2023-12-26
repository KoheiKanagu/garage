// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'firebase_user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseUserIdTokenResultHash() =>
    r'6b0613aea9fd0d71a0c18d5baea72e2d2e1dffbd';

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

/// [IdTokenResult]を取得する
/// サインインしていないなどで、IdTokenResultが取得できない場合は返さない
///
/// Copied from [firebaseUserIdTokenResult].
@ProviderFor(firebaseUserIdTokenResult)
const firebaseUserIdTokenResultProvider = FirebaseUserIdTokenResultFamily();

/// [IdTokenResult]を取得する
/// サインインしていないなどで、IdTokenResultが取得できない場合は返さない
///
/// Copied from [firebaseUserIdTokenResult].
class FirebaseUserIdTokenResultFamily
    extends Family<AsyncValue<IdTokenResult>> {
  /// [IdTokenResult]を取得する
  /// サインインしていないなどで、IdTokenResultが取得できない場合は返さない
  ///
  /// Copied from [firebaseUserIdTokenResult].
  const FirebaseUserIdTokenResultFamily();

  /// [IdTokenResult]を取得する
  /// サインインしていないなどで、IdTokenResultが取得できない場合は返さない
  ///
  /// Copied from [firebaseUserIdTokenResult].
  FirebaseUserIdTokenResultProvider call({
    bool forceRefresh = false,
  }) {
    return FirebaseUserIdTokenResultProvider(
      forceRefresh: forceRefresh,
    );
  }

  @override
  FirebaseUserIdTokenResultProvider getProviderOverride(
    covariant FirebaseUserIdTokenResultProvider provider,
  ) {
    return call(
      forceRefresh: provider.forceRefresh,
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
  String? get name => r'firebaseUserIdTokenResultProvider';
}

/// [IdTokenResult]を取得する
/// サインインしていないなどで、IdTokenResultが取得できない場合は返さない
///
/// Copied from [firebaseUserIdTokenResult].
class FirebaseUserIdTokenResultProvider
    extends AutoDisposeStreamProvider<IdTokenResult> {
  /// [IdTokenResult]を取得する
  /// サインインしていないなどで、IdTokenResultが取得できない場合は返さない
  ///
  /// Copied from [firebaseUserIdTokenResult].
  FirebaseUserIdTokenResultProvider({
    bool forceRefresh = false,
  }) : this._internal(
          (ref) => firebaseUserIdTokenResult(
            ref as FirebaseUserIdTokenResultRef,
            forceRefresh: forceRefresh,
          ),
          from: firebaseUserIdTokenResultProvider,
          name: r'firebaseUserIdTokenResultProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firebaseUserIdTokenResultHash,
          dependencies: FirebaseUserIdTokenResultFamily._dependencies,
          allTransitiveDependencies:
              FirebaseUserIdTokenResultFamily._allTransitiveDependencies,
          forceRefresh: forceRefresh,
        );

  FirebaseUserIdTokenResultProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.forceRefresh,
  }) : super.internal();

  final bool forceRefresh;

  @override
  Override overrideWith(
    Stream<IdTokenResult> Function(FirebaseUserIdTokenResultRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirebaseUserIdTokenResultProvider._internal(
        (ref) => create(ref as FirebaseUserIdTokenResultRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        forceRefresh: forceRefresh,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<IdTokenResult> createElement() {
    return _FirebaseUserIdTokenResultProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirebaseUserIdTokenResultProvider &&
        other.forceRefresh == forceRefresh;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, forceRefresh.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FirebaseUserIdTokenResultRef
    on AutoDisposeStreamProviderRef<IdTokenResult> {
  /// The parameter `forceRefresh` of this provider.
  bool get forceRefresh;
}

class _FirebaseUserIdTokenResultProviderElement
    extends AutoDisposeStreamProviderElement<IdTokenResult>
    with FirebaseUserIdTokenResultRef {
  _FirebaseUserIdTokenResultProviderElement(super.provider);

  @override
  bool get forceRefresh =>
      (origin as FirebaseUserIdTokenResultProvider).forceRefresh;
}

String _$firebaseUserUidHash() => r'74f0e6baf9aa5183290996fa40f9d096964532b4';

/// UIDを取得する
/// サインインしていないなどで、UIDが取得できない場合は返さない
///
/// Copied from [firebaseUserUid].
@ProviderFor(firebaseUserUid)
final firebaseUserUidProvider = AutoDisposeStreamProvider<String>.internal(
  firebaseUserUid,
  name: r'firebaseUserUidProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserUidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserUidRef = AutoDisposeStreamProviderRef<String>;
String _$firebaseUserIsSignedInHash() =>
    r'824d25c7ce3be53ab933406d8429c9e096f10c53';

/// サインインしているかどうか
///
/// Copied from [firebaseUserIsSignedIn].
@ProviderFor(firebaseUserIsSignedIn)
final firebaseUserIsSignedInProvider = AutoDisposeStreamProvider<bool>.internal(
  firebaseUserIsSignedIn,
  name: r'firebaseUserIsSignedInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserIsSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserIsSignedInRef = AutoDisposeStreamProviderRef<bool>;
String _$firebaseSignInHash() => r'996adc7337ebd2910234759c1c39a84cc77f736b';

/// サインインをした後、Userドキュメントが取得できるまで待つ
///
/// Copied from [firebaseSignIn].
@ProviderFor(firebaseSignIn)
final firebaseSignInProvider = AutoDisposeFutureProvider<void>.internal(
  firebaseSignIn,
  name: r'firebaseSignInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseSignInRef = AutoDisposeFutureProviderRef<void>;
String _$firebaseUserDeleteHash() =>
    r'674fc0fd983c6b8b22de82bff0417a7684d2877f';

/// SharedPreferencesとUser Documentの削除が完了するまで待った後、サインアウトする
///
/// Copied from [firebaseUserDelete].
@ProviderFor(firebaseUserDelete)
final firebaseUserDeleteProvider = AutoDisposeFutureProvider<void>.internal(
  firebaseUserDelete,
  name: r'firebaseUserDeleteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserDeleteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserDeleteRef = AutoDisposeFutureProviderRef<void>;
String _$firebaseUserLinkedProvidersHash() =>
    r'572fbf59bb81e36ea230c490ecf25184b524a208';

/// サインインしているアカウントのプロバイダーを取得する
///
/// Copied from [firebaseUserLinkedProviders].
@ProviderFor(firebaseUserLinkedProviders)
final firebaseUserLinkedProvidersProvider =
    AutoDisposeStreamProvider<List<String>>.internal(
  firebaseUserLinkedProviders,
  name: r'firebaseUserLinkedProvidersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserLinkedProvidersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserLinkedProvidersRef
    = AutoDisposeStreamProviderRef<List<String>>;
String _$firebaseUserUnlinkProviderHash() =>
    r'd9dc17bdc503b9495b826c2df8bea2b47c80a94e';

/// リンクしているプロバイダーを解除する
///
/// Copied from [firebaseUserUnlinkProvider].
@ProviderFor(firebaseUserUnlinkProvider)
const firebaseUserUnlinkProviderProvider = FirebaseUserUnlinkProviderFamily();

/// リンクしているプロバイダーを解除する
///
/// Copied from [firebaseUserUnlinkProvider].
class FirebaseUserUnlinkProviderFamily extends Family<AsyncValue<void>> {
  /// リンクしているプロバイダーを解除する
  ///
  /// Copied from [firebaseUserUnlinkProvider].
  const FirebaseUserUnlinkProviderFamily();

  /// リンクしているプロバイダーを解除する
  ///
  /// Copied from [firebaseUserUnlinkProvider].
  FirebaseUserUnlinkProviderProvider call(
    String providerId,
  ) {
    return FirebaseUserUnlinkProviderProvider(
      providerId,
    );
  }

  @override
  FirebaseUserUnlinkProviderProvider getProviderOverride(
    covariant FirebaseUserUnlinkProviderProvider provider,
  ) {
    return call(
      provider.providerId,
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
  String? get name => r'firebaseUserUnlinkProviderProvider';
}

/// リンクしているプロバイダーを解除する
///
/// Copied from [firebaseUserUnlinkProvider].
class FirebaseUserUnlinkProviderProvider
    extends AutoDisposeFutureProvider<void> {
  /// リンクしているプロバイダーを解除する
  ///
  /// Copied from [firebaseUserUnlinkProvider].
  FirebaseUserUnlinkProviderProvider(
    String providerId,
  ) : this._internal(
          (ref) => firebaseUserUnlinkProvider(
            ref as FirebaseUserUnlinkProviderRef,
            providerId,
          ),
          from: firebaseUserUnlinkProviderProvider,
          name: r'firebaseUserUnlinkProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firebaseUserUnlinkProviderHash,
          dependencies: FirebaseUserUnlinkProviderFamily._dependencies,
          allTransitiveDependencies:
              FirebaseUserUnlinkProviderFamily._allTransitiveDependencies,
          providerId: providerId,
        );

  FirebaseUserUnlinkProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.providerId,
  }) : super.internal();

  final String providerId;

  @override
  Override overrideWith(
    FutureOr<void> Function(FirebaseUserUnlinkProviderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirebaseUserUnlinkProviderProvider._internal(
        (ref) => create(ref as FirebaseUserUnlinkProviderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        providerId: providerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FirebaseUserUnlinkProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirebaseUserUnlinkProviderProvider &&
        other.providerId == providerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, providerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FirebaseUserUnlinkProviderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `providerId` of this provider.
  String get providerId;
}

class _FirebaseUserUnlinkProviderProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with FirebaseUserUnlinkProviderRef {
  _FirebaseUserUnlinkProviderProviderElement(super.provider);

  @override
  String get providerId =>
      (origin as FirebaseUserUnlinkProviderProvider).providerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
