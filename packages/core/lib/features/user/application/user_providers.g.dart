// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userCollectionReferenceHash() =>
    r'f2b106f5d2c8a2e681f631ff34499c8a4734896c';

/// See also [userCollectionReference].
@ProviderFor(userCollectionReference)
final userCollectionReferenceProvider =
    AutoDisposeProvider<CollectionReference<User>>.internal(
  userCollectionReference,
  name: r'userCollectionReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userCollectionReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserCollectionReferenceRef
    = AutoDisposeProviderRef<CollectionReference<User>>;
String _$userDocumentSnapshotHash() =>
    r'449e1f6f5775bffea1b396dbdf90f29056ab5bb7';

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

/// See also [userDocumentSnapshot].
@ProviderFor(userDocumentSnapshot)
const userDocumentSnapshotProvider = UserDocumentSnapshotFamily();

/// See also [userDocumentSnapshot].
class UserDocumentSnapshotFamily
    extends Family<AsyncValue<DocumentSnapshot<User>>> {
  /// See also [userDocumentSnapshot].
  const UserDocumentSnapshotFamily();

  /// See also [userDocumentSnapshot].
  UserDocumentSnapshotProvider call(
    String uid,
  ) {
    return UserDocumentSnapshotProvider(
      uid,
    );
  }

  @override
  UserDocumentSnapshotProvider getProviderOverride(
    covariant UserDocumentSnapshotProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'userDocumentSnapshotProvider';
}

/// See also [userDocumentSnapshot].
class UserDocumentSnapshotProvider
    extends AutoDisposeStreamProvider<DocumentSnapshot<User>> {
  /// See also [userDocumentSnapshot].
  UserDocumentSnapshotProvider(
    String uid,
  ) : this._internal(
          (ref) => userDocumentSnapshot(
            ref as UserDocumentSnapshotRef,
            uid,
          ),
          from: userDocumentSnapshotProvider,
          name: r'userDocumentSnapshotProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userDocumentSnapshotHash,
          dependencies: UserDocumentSnapshotFamily._dependencies,
          allTransitiveDependencies:
              UserDocumentSnapshotFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserDocumentSnapshotProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot<User>> Function(UserDocumentSnapshotRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDocumentSnapshotProvider._internal(
        (ref) => create(ref as UserDocumentSnapshotRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DocumentSnapshot<User>> createElement() {
    return _UserDocumentSnapshotProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDocumentSnapshotProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserDocumentSnapshotRef
    on AutoDisposeStreamProviderRef<DocumentSnapshot<User>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserDocumentSnapshotProviderElement
    extends AutoDisposeStreamProviderElement<DocumentSnapshot<User>>
    with UserDocumentSnapshotRef {
  _UserDocumentSnapshotProviderElement(super.provider);

  @override
  String get uid => (origin as UserDocumentSnapshotProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
