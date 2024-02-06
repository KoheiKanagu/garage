// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'my_go_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myGoRouterHash() => r'd99ac81eca958e6ebc1c086c16b98e74f512ef9f';

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

/// See also [myGoRouter].
@ProviderFor(myGoRouter)
const myGoRouterProvider = MyGoRouterFamily();

/// See also [myGoRouter].
class MyGoRouterFamily extends Family<Raw<GoRouter>> {
  /// See also [myGoRouter].
  const MyGoRouterFamily();

  /// See also [myGoRouter].
  MyGoRouterProvider call({
    required List<RouteBase> routes,
    required String signedInLocation,
  }) {
    return MyGoRouterProvider(
      routes: routes,
      signedInLocation: signedInLocation,
    );
  }

  @override
  MyGoRouterProvider getProviderOverride(
    covariant MyGoRouterProvider provider,
  ) {
    return call(
      routes: provider.routes,
      signedInLocation: provider.signedInLocation,
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
  String? get name => r'myGoRouterProvider';
}

/// See also [myGoRouter].
class MyGoRouterProvider extends AutoDisposeProvider<Raw<GoRouter>> {
  /// See also [myGoRouter].
  MyGoRouterProvider({
    required List<RouteBase> routes,
    required String signedInLocation,
  }) : this._internal(
          (ref) => myGoRouter(
            ref as MyGoRouterRef,
            routes: routes,
            signedInLocation: signedInLocation,
          ),
          from: myGoRouterProvider,
          name: r'myGoRouterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myGoRouterHash,
          dependencies: MyGoRouterFamily._dependencies,
          allTransitiveDependencies:
              MyGoRouterFamily._allTransitiveDependencies,
          routes: routes,
          signedInLocation: signedInLocation,
        );

  MyGoRouterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.routes,
    required this.signedInLocation,
  }) : super.internal();

  final List<RouteBase> routes;
  final String signedInLocation;

  @override
  Override overrideWith(
    Raw<GoRouter> Function(MyGoRouterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyGoRouterProvider._internal(
        (ref) => create(ref as MyGoRouterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        routes: routes,
        signedInLocation: signedInLocation,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Raw<GoRouter>> createElement() {
    return _MyGoRouterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyGoRouterProvider &&
        other.routes == routes &&
        other.signedInLocation == signedInLocation;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, routes.hashCode);
    hash = _SystemHash.combine(hash, signedInLocation.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyGoRouterRef on AutoDisposeProviderRef<Raw<GoRouter>> {
  /// The parameter `routes` of this provider.
  List<RouteBase> get routes;

  /// The parameter `signedInLocation` of this provider.
  String get signedInLocation;
}

class _MyGoRouterProviderElement
    extends AutoDisposeProviderElement<Raw<GoRouter>> with MyGoRouterRef {
  _MyGoRouterProviderElement(super.provider);

  @override
  List<RouteBase> get routes => (origin as MyGoRouterProvider).routes;
  @override
  String get signedInLocation =>
      (origin as MyGoRouterProvider).signedInLocation;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
