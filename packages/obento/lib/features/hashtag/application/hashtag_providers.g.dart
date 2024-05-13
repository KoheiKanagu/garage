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
String _$hashtagHash() => r'd6b97b31f6c6e9b1f1e2b3cf9be43faf8aafb4e2';

/// See also [hashtag].
@ProviderFor(hashtag)
final hashtagProvider = AutoDisposeFutureProvider<
    ({Hashtag hashtag, DocumentReference<Hashtag> reference})>.internal(
  hashtag,
  name: r'hashtagProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hashtagHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HashtagRef = AutoDisposeFutureProviderRef<
    ({Hashtag hashtag, DocumentReference<Hashtag> reference})>;
String _$hashtagPreviewHash() => r'd2f7d37245a58b118a09209a35ee5f9c0c6137f0';

/// See also [hashtagPreview].
@ProviderFor(hashtagPreview)
final hashtagPreviewProvider = AutoDisposeFutureProvider<String>.internal(
  hashtagPreview,
  name: r'hashtagPreviewProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagPreviewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HashtagPreviewRef = AutoDisposeFutureProviderRef<String>;
String _$hashtagControllerHash() => r'75686b89f92fc9e3b1611dddbde1a21cb59e5274';

/// See also [HashtagController].
@ProviderFor(HashtagController)
final hashtagControllerProvider = AutoDisposeAsyncNotifierProvider<
    HashtagController,
    ({Hashtag hashtag, DocumentReference<Hashtag> reference})>.internal(
  HashtagController.new,
  name: r'hashtagControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagController = AutoDisposeAsyncNotifier<
    ({Hashtag hashtag, DocumentReference<Hashtag> reference})>;
String _$hashtagsEditControllerHash() =>
    r'f5363a1d7a1ee6c56fc479e438b4442ae508bc30';

/// See also [HashtagsEditController].
@ProviderFor(HashtagsEditController)
final hashtagsEditControllerProvider =
    AutoDisposeNotifierProvider<HashtagsEditController, Hashtag?>.internal(
  HashtagsEditController.new,
  name: r'hashtagsEditControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagsEditControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagsEditController = AutoDisposeNotifier<Hashtag?>;
String _$hashtagsSelectedControllerHash() =>
    r'29b3cb0e54c974b8fc66f8152dbd4a26ceddc305';

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
