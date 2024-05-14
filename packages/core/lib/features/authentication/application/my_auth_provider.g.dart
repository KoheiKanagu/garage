// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'my_auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myAuthProviderIsLinkedHash() =>
    r'be28a101b15bc7e4a52a033aa78e0b3d2c71e94f';

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

/// See also [myAuthProviderIsLinked].
@ProviderFor(myAuthProviderIsLinked)
const myAuthProviderIsLinkedProvider = MyAuthProviderIsLinkedFamily();

/// See also [myAuthProviderIsLinked].
class MyAuthProviderIsLinkedFamily extends Family<AsyncValue<bool>> {
  /// See also [myAuthProviderIsLinked].
  const MyAuthProviderIsLinkedFamily();

  /// See also [myAuthProviderIsLinked].
  MyAuthProviderIsLinkedProvider call(
    MyAuthProviderType type,
  ) {
    return MyAuthProviderIsLinkedProvider(
      type,
    );
  }

  @override
  MyAuthProviderIsLinkedProvider getProviderOverride(
    covariant MyAuthProviderIsLinkedProvider provider,
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
  String? get name => r'myAuthProviderIsLinkedProvider';
}

/// See also [myAuthProviderIsLinked].
class MyAuthProviderIsLinkedProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [myAuthProviderIsLinked].
  MyAuthProviderIsLinkedProvider(
    MyAuthProviderType type,
  ) : this._internal(
          (ref) => myAuthProviderIsLinked(
            ref as MyAuthProviderIsLinkedRef,
            type,
          ),
          from: myAuthProviderIsLinkedProvider,
          name: r'myAuthProviderIsLinkedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myAuthProviderIsLinkedHash,
          dependencies: MyAuthProviderIsLinkedFamily._dependencies,
          allTransitiveDependencies:
              MyAuthProviderIsLinkedFamily._allTransitiveDependencies,
          type: type,
        );

  MyAuthProviderIsLinkedProvider._internal(
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
    FutureOr<bool> Function(MyAuthProviderIsLinkedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyAuthProviderIsLinkedProvider._internal(
        (ref) => create(ref as MyAuthProviderIsLinkedRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _MyAuthProviderIsLinkedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyAuthProviderIsLinkedProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyAuthProviderIsLinkedRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `type` of this provider.
  MyAuthProviderType get type;
}

class _MyAuthProviderIsLinkedProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with MyAuthProviderIsLinkedRef {
  _MyAuthProviderIsLinkedProviderElement(super.provider);

  @override
  MyAuthProviderType get type =>
      (origin as MyAuthProviderIsLinkedProvider).type;
}

String _$myAuthProviderControllerHash() =>
    r'8339f7d263e1d7a1e37e14475d2416f849b98fb1';

abstract class _$MyAuthProviderController
    extends BuildlessAutoDisposeNotifier<AuthProvider> {
  late final MyAuthProviderType type;

  AuthProvider build(
    MyAuthProviderType type,
  );
}

/// See also [MyAuthProviderController].
@ProviderFor(MyAuthProviderController)
const myAuthProviderControllerProvider = MyAuthProviderControllerFamily();

/// See also [MyAuthProviderController].
class MyAuthProviderControllerFamily extends Family<AuthProvider> {
  /// See also [MyAuthProviderController].
  const MyAuthProviderControllerFamily();

  /// See also [MyAuthProviderController].
  MyAuthProviderControllerProvider call(
    MyAuthProviderType type,
  ) {
    return MyAuthProviderControllerProvider(
      type,
    );
  }

  @override
  MyAuthProviderControllerProvider getProviderOverride(
    covariant MyAuthProviderControllerProvider provider,
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
  String? get name => r'myAuthProviderControllerProvider';
}

/// See also [MyAuthProviderController].
class MyAuthProviderControllerProvider extends AutoDisposeNotifierProviderImpl<
    MyAuthProviderController, AuthProvider> {
  /// See also [MyAuthProviderController].
  MyAuthProviderControllerProvider(
    MyAuthProviderType type,
  ) : this._internal(
          () => MyAuthProviderController()..type = type,
          from: myAuthProviderControllerProvider,
          name: r'myAuthProviderControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myAuthProviderControllerHash,
          dependencies: MyAuthProviderControllerFamily._dependencies,
          allTransitiveDependencies:
              MyAuthProviderControllerFamily._allTransitiveDependencies,
          type: type,
        );

  MyAuthProviderControllerProvider._internal(
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
  AuthProvider runNotifierBuild(
    covariant MyAuthProviderController notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(MyAuthProviderController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MyAuthProviderControllerProvider._internal(
        () => create()..type = type,
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
  AutoDisposeNotifierProviderElement<MyAuthProviderController, AuthProvider>
      createElement() {
    return _MyAuthProviderControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyAuthProviderControllerProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyAuthProviderControllerRef
    on AutoDisposeNotifierProviderRef<AuthProvider> {
  /// The parameter `type` of this provider.
  MyAuthProviderType get type;
}

class _MyAuthProviderControllerProviderElement
    extends AutoDisposeNotifierProviderElement<MyAuthProviderController,
        AuthProvider> with MyAuthProviderControllerRef {
  _MyAuthProviderControllerProviderElement(super.provider);

  @override
  MyAuthProviderType get type =>
      (origin as MyAuthProviderControllerProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
