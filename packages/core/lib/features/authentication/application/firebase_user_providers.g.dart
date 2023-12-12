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
String _$firebaseSignInHash() => r'0e67905407c8c0e0002e6a9e00580b206a78bb2c';

/// サインインをした後、User Documentが取得できるまで待つ
///
/// Copied from [firebaseSignIn].
@ProviderFor(firebaseSignIn)
const firebaseSignInProvider = FirebaseSignInFamily();

/// サインインをした後、User Documentが取得できるまで待つ
///
/// Copied from [firebaseSignIn].
class FirebaseSignInFamily extends Family<AsyncValue<void>> {
  /// サインインをした後、User Documentが取得できるまで待つ
  ///
  /// Copied from [firebaseSignIn].
  const FirebaseSignInFamily();

  /// サインインをした後、User Documentが取得できるまで待つ
  ///
  /// Copied from [firebaseSignIn].
  FirebaseSignInProvider call({
    required CollectionReference<dynamic> userCollectionReference,
  }) {
    return FirebaseSignInProvider(
      userCollectionReference: userCollectionReference,
    );
  }

  @override
  FirebaseSignInProvider getProviderOverride(
    covariant FirebaseSignInProvider provider,
  ) {
    return call(
      userCollectionReference: provider.userCollectionReference,
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
  String? get name => r'firebaseSignInProvider';
}

/// サインインをした後、User Documentが取得できるまで待つ
///
/// Copied from [firebaseSignIn].
class FirebaseSignInProvider extends AutoDisposeFutureProvider<void> {
  /// サインインをした後、User Documentが取得できるまで待つ
  ///
  /// Copied from [firebaseSignIn].
  FirebaseSignInProvider({
    required CollectionReference<dynamic> userCollectionReference,
  }) : this._internal(
          (ref) => firebaseSignIn(
            ref as FirebaseSignInRef,
            userCollectionReference: userCollectionReference,
          ),
          from: firebaseSignInProvider,
          name: r'firebaseSignInProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firebaseSignInHash,
          dependencies: FirebaseSignInFamily._dependencies,
          allTransitiveDependencies:
              FirebaseSignInFamily._allTransitiveDependencies,
          userCollectionReference: userCollectionReference,
        );

  FirebaseSignInProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userCollectionReference,
  }) : super.internal();

  final CollectionReference<dynamic> userCollectionReference;

  @override
  Override overrideWith(
    FutureOr<void> Function(FirebaseSignInRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirebaseSignInProvider._internal(
        (ref) => create(ref as FirebaseSignInRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userCollectionReference: userCollectionReference,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FirebaseSignInProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirebaseSignInProvider &&
        other.userCollectionReference == userCollectionReference;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userCollectionReference.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FirebaseSignInRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userCollectionReference` of this provider.
  CollectionReference<dynamic> get userCollectionReference;
}

class _FirebaseSignInProviderElement
    extends AutoDisposeFutureProviderElement<void> with FirebaseSignInRef {
  _FirebaseSignInProviderElement(super.provider);

  @override
  CollectionReference<dynamic> get userCollectionReference =>
      (origin as FirebaseSignInProvider).userCollectionReference;
}

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
