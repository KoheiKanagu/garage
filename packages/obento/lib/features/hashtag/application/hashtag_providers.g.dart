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
String _$isarHash() => r'fb52d7affc132eb7bc1b4d3054e86c278e03beff';

/// See also [isar].
@ProviderFor(isar)
final isarProvider = AutoDisposeFutureProvider<Isar>.internal(
  isar,
  name: r'isarProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarRef = AutoDisposeFutureProviderRef<Isar>;
String _$isarHashtagDbHash() => r'4056f8f65f8ac9fedb97b0f5c83a90a6992cdb95';

/// See also [isarHashtagDb].
@ProviderFor(isarHashtagDb)
final isarHashtagDbProvider =
    AutoDisposeFutureProvider<IsarCollection<HashtagDb>>.internal(
  isarHashtagDb,
  name: r'isarHashtagDbProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isarHashtagDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarHashtagDbRef
    = AutoDisposeFutureProviderRef<IsarCollection<HashtagDb>>;
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
String _$hashtagSearchTextControllerHash() =>
    r'ab84145445d077a505b265e89dccceea8acf3526';

/// See also [HashtagSearchTextController].
@ProviderFor(HashtagSearchTextController)
final hashtagSearchTextControllerProvider =
    AutoDisposeNotifierProvider<HashtagSearchTextController, String?>.internal(
  HashtagSearchTextController.new,
  name: r'hashtagSearchTextControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagSearchTextControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagSearchTextController = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
