// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'my_auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myAuthHash() => r'03a568429448fa91b8c8d0de207669d5125b7f67';

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

/// See also [myAuth].
@ProviderFor(myAuth)
const myAuthProvider = MyAuthFamily();

/// See also [myAuth].
class MyAuthFamily extends Family<AuthProvider> {
  /// See also [myAuth].
  const MyAuthFamily();

  /// See also [myAuth].
  MyAuthProvider call(
    MyAuthProviderType type,
  ) {
    return MyAuthProvider(
      type,
    );
  }

  @override
  MyAuthProvider getProviderOverride(
    covariant MyAuthProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'myAuthProvider';
}

/// See also [myAuth].
class MyAuthProvider extends AutoDisposeProvider<AuthProvider> {
  /// See also [myAuth].
  MyAuthProvider(
    MyAuthProviderType type,
  ) : this._internal(
          (ref) => myAuth(
            ref as MyAuthRef,
            type,
          ),
          from: myAuthProvider,
          name: r'myAuthProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myAuthHash,
          dependencies: MyAuthFamily._dependencies,
          allTransitiveDependencies: MyAuthFamily._allTransitiveDependencies,
          type: type,
        );

  MyAuthProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final MyAuthProviderType type;

  @override
  Override overrideWith(
    AuthProvider Function(MyAuthRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyAuthProvider._internal(
        (ref) => create(ref as MyAuthRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AuthProvider> createElement() {
    return _MyAuthProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyAuthProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyAuthRef on AutoDisposeProviderRef<AuthProvider> {
  /// The parameter `type` of this provider.
  MyAuthProviderType get type;
}

class _MyAuthProviderElement extends AutoDisposeProviderElement<AuthProvider>
    with MyAuthRef {
  _MyAuthProviderElement(super.provider);

  @override
  MyAuthProviderType get type => (origin as MyAuthProvider).type;
}

String _$myAuthSignInOrLinkHash() =>
    r'4b79af2c207e1165a27843870f67c302e66cb87e';

/// See also [myAuthSignInOrLink].
@ProviderFor(myAuthSignInOrLink)
const myAuthSignInOrLinkProvider = MyAuthSignInOrLinkFamily();

/// See also [myAuthSignInOrLink].
class MyAuthSignInOrLinkFamily extends Family<AsyncValue<void>> {
  /// See also [myAuthSignInOrLink].
  const MyAuthSignInOrLinkFamily();

  /// See also [myAuthSignInOrLink].
  MyAuthSignInOrLinkProvider call(
    AuthProvider authProvider,
  ) {
    return MyAuthSignInOrLinkProvider(
      authProvider,
    );
  }

  @override
  MyAuthSignInOrLinkProvider getProviderOverride(
    covariant MyAuthSignInOrLinkProvider provider,
  ) {
    return call(
      provider.authProvider,
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
  String? get name => r'myAuthSignInOrLinkProvider';
}

/// See also [myAuthSignInOrLink].
class MyAuthSignInOrLinkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [myAuthSignInOrLink].
  MyAuthSignInOrLinkProvider(
    AuthProvider authProvider,
  ) : this._internal(
          (ref) => myAuthSignInOrLink(
            ref as MyAuthSignInOrLinkRef,
            authProvider,
          ),
          from: myAuthSignInOrLinkProvider,
          name: r'myAuthSignInOrLinkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myAuthSignInOrLinkHash,
          dependencies: MyAuthSignInOrLinkFamily._dependencies,
          allTransitiveDependencies:
              MyAuthSignInOrLinkFamily._allTransitiveDependencies,
          authProvider: authProvider,
        );

  MyAuthSignInOrLinkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authProvider,
  }) : super.internal();

  final AuthProvider authProvider;

  @override
  Override overrideWith(
    FutureOr<void> Function(MyAuthSignInOrLinkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyAuthSignInOrLinkProvider._internal(
        (ref) => create(ref as MyAuthSignInOrLinkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authProvider: authProvider,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MyAuthSignInOrLinkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyAuthSignInOrLinkProvider &&
        other.authProvider == authProvider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authProvider.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyAuthSignInOrLinkRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `authProvider` of this provider.
  AuthProvider get authProvider;
}

class _MyAuthSignInOrLinkProviderElement
    extends AutoDisposeFutureProviderElement<void> with MyAuthSignInOrLinkRef {
  _MyAuthSignInOrLinkProviderElement(super.provider);

  @override
  AuthProvider get authProvider =>
      (origin as MyAuthSignInOrLinkProvider).authProvider;
}

String _$myAuthUnlinkHash() => r'97db898470bb8847ed8d09910589abaa40d29dd2';

/// See also [myAuthUnlink].
@ProviderFor(myAuthUnlink)
const myAuthUnlinkProvider = MyAuthUnlinkFamily();

/// See also [myAuthUnlink].
class MyAuthUnlinkFamily extends Family<AsyncValue<void>> {
  /// See also [myAuthUnlink].
  const MyAuthUnlinkFamily();

  /// See also [myAuthUnlink].
  MyAuthUnlinkProvider call(
    AuthProvider authProvider,
  ) {
    return MyAuthUnlinkProvider(
      authProvider,
    );
  }

  @override
  MyAuthUnlinkProvider getProviderOverride(
    covariant MyAuthUnlinkProvider provider,
  ) {
    return call(
      provider.authProvider,
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
  String? get name => r'myAuthUnlinkProvider';
}

/// See also [myAuthUnlink].
class MyAuthUnlinkProvider extends AutoDisposeFutureProvider<void> {
  /// See also [myAuthUnlink].
  MyAuthUnlinkProvider(
    AuthProvider authProvider,
  ) : this._internal(
          (ref) => myAuthUnlink(
            ref as MyAuthUnlinkRef,
            authProvider,
          ),
          from: myAuthUnlinkProvider,
          name: r'myAuthUnlinkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myAuthUnlinkHash,
          dependencies: MyAuthUnlinkFamily._dependencies,
          allTransitiveDependencies:
              MyAuthUnlinkFamily._allTransitiveDependencies,
          authProvider: authProvider,
        );

  MyAuthUnlinkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authProvider,
  }) : super.internal();

  final AuthProvider authProvider;

  @override
  Override overrideWith(
    FutureOr<void> Function(MyAuthUnlinkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyAuthUnlinkProvider._internal(
        (ref) => create(ref as MyAuthUnlinkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authProvider: authProvider,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _MyAuthUnlinkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyAuthUnlinkProvider && other.authProvider == authProvider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authProvider.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyAuthUnlinkRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `authProvider` of this provider.
  AuthProvider get authProvider;
}

class _MyAuthUnlinkProviderElement
    extends AutoDisposeFutureProviderElement<void> with MyAuthUnlinkRef {
  _MyAuthUnlinkProviderElement(super.provider);

  @override
  AuthProvider get authProvider =>
      (origin as MyAuthUnlinkProvider).authProvider;
}

String _$myAuthIsLinkedHash() => r'ff58a83a12460e53a54bf5b0d6066b80dff697b4';

/// See also [myAuthIsLinked].
@ProviderFor(myAuthIsLinked)
const myAuthIsLinkedProvider = MyAuthIsLinkedFamily();

/// See also [myAuthIsLinked].
class MyAuthIsLinkedFamily extends Family<AsyncValue<bool>> {
  /// See also [myAuthIsLinked].
  const MyAuthIsLinkedFamily();

  /// See also [myAuthIsLinked].
  MyAuthIsLinkedProvider call(
    AuthProvider authProvider,
  ) {
    return MyAuthIsLinkedProvider(
      authProvider,
    );
  }

  @override
  MyAuthIsLinkedProvider getProviderOverride(
    covariant MyAuthIsLinkedProvider provider,
  ) {
    return call(
      provider.authProvider,
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
  String? get name => r'myAuthIsLinkedProvider';
}

/// See also [myAuthIsLinked].
class MyAuthIsLinkedProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [myAuthIsLinked].
  MyAuthIsLinkedProvider(
    AuthProvider authProvider,
  ) : this._internal(
          (ref) => myAuthIsLinked(
            ref as MyAuthIsLinkedRef,
            authProvider,
          ),
          from: myAuthIsLinkedProvider,
          name: r'myAuthIsLinkedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myAuthIsLinkedHash,
          dependencies: MyAuthIsLinkedFamily._dependencies,
          allTransitiveDependencies:
              MyAuthIsLinkedFamily._allTransitiveDependencies,
          authProvider: authProvider,
        );

  MyAuthIsLinkedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authProvider,
  }) : super.internal();

  final AuthProvider authProvider;

  @override
  Override overrideWith(
    FutureOr<bool> Function(MyAuthIsLinkedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyAuthIsLinkedProvider._internal(
        (ref) => create(ref as MyAuthIsLinkedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authProvider: authProvider,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _MyAuthIsLinkedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyAuthIsLinkedProvider &&
        other.authProvider == authProvider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authProvider.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyAuthIsLinkedRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `authProvider` of this provider.
  AuthProvider get authProvider;
}

class _MyAuthIsLinkedProviderElement
    extends AutoDisposeFutureProviderElement<bool> with MyAuthIsLinkedRef {
  _MyAuthIsLinkedProviderElement(super.provider);

  @override
  AuthProvider get authProvider =>
      (origin as MyAuthIsLinkedProvider).authProvider;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
