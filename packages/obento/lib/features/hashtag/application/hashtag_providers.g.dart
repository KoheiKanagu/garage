// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'hashtag_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hashtagsCollectionReferenceHash() =>
    r'1b4cfaa04b21b372ab0ccce125ebd759037641de';

/// See also [hashtagsCollectionReference].
@ProviderFor(hashtagsCollectionReference)
final hashtagsCollectionReferenceProvider =
    AutoDisposeProvider<CollectionReference<Hashtag>>.internal(
  hashtagsCollectionReference,
  name: r'hashtagsCollectionReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagsCollectionReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HashtagsCollectionReferenceRef
    = AutoDisposeProviderRef<CollectionReference<Hashtag>>;
String _$hashtagsDocumentSnapshotHash() =>
    r'160098e949140a556f05e71d40c0bf7fe635639e';

/// See also [hashtagsDocumentSnapshot].
@ProviderFor(hashtagsDocumentSnapshot)
final hashtagsDocumentSnapshotProvider =
    AutoDisposeStreamProvider<DocumentSnapshot<Hashtag>>.internal(
  hashtagsDocumentSnapshot,
  name: r'hashtagsDocumentSnapshotProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagsDocumentSnapshotHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HashtagsDocumentSnapshotRef
    = AutoDisposeStreamProviderRef<DocumentSnapshot<Hashtag>>;
String _$hashtagControllerHash() => r'12724307d3210476863ee82d9daea3df26e1c95a';

/// See also [HashtagController].
@ProviderFor(HashtagController)
final hashtagControllerProvider =
    AutoDisposeAsyncNotifierProvider<HashtagController, Hashtag>.internal(
  HashtagController.new,
  name: r'hashtagControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagController = AutoDisposeAsyncNotifier<Hashtag>;
String _$hashtagsEditControllerHash() =>
    r'6b0049e400ff9521ef6aff1bca69227d002a5097';

/// See also [HashtagsEditController].
@ProviderFor(HashtagsEditController)
final hashtagsEditControllerProvider =
    AutoDisposeNotifierProvider<HashtagsEditController, bool>.internal(
  HashtagsEditController.new,
  name: r'hashtagsEditControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagsEditControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagsEditController = AutoDisposeNotifier<bool>;
String _$hashtagsSelectedControllerHash() =>
    r'c26b74467c38cc9ecbc897f589ccf44c90d80c7e';

/// See also [HashtagsSelectedController].
@ProviderFor(HashtagsSelectedController)
final hashtagsSelectedControllerProvider = AutoDisposeNotifierProvider<
    HashtagsSelectedController, Set<String>>.internal(
  HashtagsSelectedController.new,
  name: r'hashtagsSelectedControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagsSelectedControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagsSelectedController = AutoDisposeNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
