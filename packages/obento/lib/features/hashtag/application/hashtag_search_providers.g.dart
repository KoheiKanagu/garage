// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'hashtag_search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$isarHashtagDbHash() => r'52197f526386dbfdae313a6b59a0dfd1c3ebb719';

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
String _$hashtagSearchTextEditingControllerHash() =>
    r'a82fa902f253b5fbec3071771310cb1dac9e9e68';

/// See also [hashtagSearchTextEditingController].
@ProviderFor(hashtagSearchTextEditingController)
final hashtagSearchTextEditingControllerProvider =
    AutoDisposeProvider<Raw<TextEditingController>>.internal(
  hashtagSearchTextEditingController,
  name: r'hashtagSearchTextEditingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagSearchTextEditingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HashtagSearchTextEditingControllerRef
    = AutoDisposeProviderRef<Raw<TextEditingController>>;
String _$hashtagSearchResultsHash() =>
    r'b2b487c79e0ef365b81ff9dce6933c249332a7c8';

/// See also [hashtagSearchResults].
@ProviderFor(hashtagSearchResults)
final hashtagSearchResultsProvider =
    AutoDisposeFutureProvider<List<String>?>.internal(
  hashtagSearchResults,
  name: r'hashtagSearchResultsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagSearchResultsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HashtagSearchResultsRef = AutoDisposeFutureProviderRef<List<String>?>;
String _$hashtagSearchTextHash() => r'fe895bca3f12f483da61fad6bc2066029a74334d';

/// See also [HashtagSearchText].
@ProviderFor(HashtagSearchText)
final hashtagSearchTextProvider =
    AutoDisposeNotifierProvider<HashtagSearchText, String?>.internal(
  HashtagSearchText.new,
  name: r'hashtagSearchTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hashtagSearchTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HashtagSearchText = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
