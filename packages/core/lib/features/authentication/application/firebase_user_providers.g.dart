// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'firebase_user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseUserHash() => r'c89432ee835eb5fa5addbb18812e9b17c1100f44';

/// [fb_auth.User]を取得する
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
///
/// Copied from [firebaseUser].
@ProviderFor(firebaseUser)
final firebaseUserProvider = AutoDisposeStreamProvider<fb_auth.User?>.internal(
  firebaseUser,
  name: r'firebaseUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserRef = AutoDisposeStreamProviderRef<fb_auth.User?>;
String _$firebaseUserIdTokenResultHash() =>
    r'f89d261388098570dfce95738d6d050c70e394f5';

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

/// [fb_auth.IdTokenResult]を取得する
///
/// サインインしていない場合はnullを返す
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
///
/// Copied from [firebaseUserIdTokenResult].
@ProviderFor(firebaseUserIdTokenResult)
const firebaseUserIdTokenResultProvider = FirebaseUserIdTokenResultFamily();

/// [fb_auth.IdTokenResult]を取得する
///
/// サインインしていない場合はnullを返す
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
///
/// Copied from [firebaseUserIdTokenResult].
class FirebaseUserIdTokenResultFamily
    extends Family<AsyncValue<fb_auth.IdTokenResult?>> {
  /// [fb_auth.IdTokenResult]を取得する
  ///
  /// サインインしていない場合はnullを返す
  ///
  /// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
  /// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
  ///
  /// Copied from [firebaseUserIdTokenResult].
  const FirebaseUserIdTokenResultFamily();

  /// [fb_auth.IdTokenResult]を取得する
  ///
  /// サインインしていない場合はnullを返す
  ///
  /// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
  /// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
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

/// [fb_auth.IdTokenResult]を取得する
///
/// サインインしていない場合はnullを返す
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
///
/// Copied from [firebaseUserIdTokenResult].
class FirebaseUserIdTokenResultProvider
    extends AutoDisposeFutureProvider<fb_auth.IdTokenResult?> {
  /// [fb_auth.IdTokenResult]を取得する
  ///
  /// サインインしていない場合はnullを返す
  ///
  /// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
  /// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
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
    FutureOr<fb_auth.IdTokenResult?> Function(
            FirebaseUserIdTokenResultRef provider)
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
  AutoDisposeFutureProviderElement<fb_auth.IdTokenResult?> createElement() {
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
    on AutoDisposeFutureProviderRef<fb_auth.IdTokenResult?> {
  /// The parameter `forceRefresh` of this provider.
  bool get forceRefresh;
}

class _FirebaseUserIdTokenResultProviderElement
    extends AutoDisposeFutureProviderElement<fb_auth.IdTokenResult?>
    with FirebaseUserIdTokenResultRef {
  _FirebaseUserIdTokenResultProviderElement(super.provider);

  @override
  bool get forceRefresh =>
      (origin as FirebaseUserIdTokenResultProvider).forceRefresh;
}

String _$firebaseUserUidHash() => r'5dae03c34cf6735d038d0611437d5c00926ba610';

/// UIDを取得する
///
/// サインインしていない場合はnullを返す
///
/// Copied from [firebaseUserUid].
@ProviderFor(firebaseUserUid)
final firebaseUserUidProvider = AutoDisposeFutureProvider<String?>.internal(
  firebaseUserUid,
  name: r'firebaseUserUidProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserUidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserUidRef = AutoDisposeFutureProviderRef<String?>;
String _$firebaseUserIsSignedInHash() =>
    r'065e4b5ab985ed02d86954b574b6f19ca1e4203b';

/// サインインしているかどうか
///
/// Copied from [firebaseUserIsSignedIn].
@ProviderFor(firebaseUserIsSignedIn)
final firebaseUserIsSignedInProvider = AutoDisposeFutureProvider<bool>.internal(
  firebaseUserIsSignedIn,
  name: r'firebaseUserIsSignedInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserIsSignedInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserIsSignedInRef = AutoDisposeFutureProviderRef<bool>;
String _$firebaseSignInHash() => r'563ce47b056a34a119df0c7e49f9b9bc6292c4ac';

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
    r'29c1c6f3bd3f411764f6de06f18c8b25b57b4dc4';

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
String _$firebaseUserSignOutHash() =>
    r'a7e5c67c9d66e3fea967abc0e18d7859f45af26f';

/// SharedPreferencesの削除が完了するまで待った後、サインアウトする
///
/// Copied from [firebaseUserSignOut].
@ProviderFor(firebaseUserSignOut)
final firebaseUserSignOutProvider = AutoDisposeFutureProvider<void>.internal(
  firebaseUserSignOut,
  name: r'firebaseUserSignOutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserSignOutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserSignOutRef = AutoDisposeFutureProviderRef<void>;
String _$firebaseUserLinkedProvidersHash() =>
    r'5ffed4bddbd190b0a004376b6ce9f70556c8482a';

/// サインインしているアカウントのプロバイダーを取得する
///
/// Copied from [firebaseUserLinkedProviders].
@ProviderFor(firebaseUserLinkedProviders)
final firebaseUserLinkedProvidersProvider =
    AutoDisposeFutureProvider<List<String>?>.internal(
  firebaseUserLinkedProviders,
  name: r'firebaseUserLinkedProvidersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseUserLinkedProvidersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseUserLinkedProvidersRef
    = AutoDisposeFutureProviderRef<List<String>?>;
String _$firebaseUserUnlinkProviderHash() =>
    r'bb82da4637dda1b34b179f1994144773e371c6e9';

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
