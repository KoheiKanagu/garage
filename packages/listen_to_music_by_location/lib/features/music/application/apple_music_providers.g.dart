// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'apple_music_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLinksAllUriLinkHash() =>
    r'4bea7e0c4e24f434c69dd1cd20897bf107693d58';

/// See also [appLinksAllUriLink].
@ProviderFor(appLinksAllUriLink)
final appLinksAllUriLinkProvider =
    AutoDisposeProvider<Raw<Stream<Uri>>>.internal(
  appLinksAllUriLink,
  name: r'appLinksAllUriLinkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appLinksAllUriLinkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppLinksAllUriLinkRef = AutoDisposeProviderRef<Raw<Stream<Uri>>>;
String _$appleMusicAppLinksHash() =>
    r'65366468331567a3bee7c2544d7436ff2509297a';

/// See also [appleMusicAppLinks].
@ProviderFor(appleMusicAppLinks)
final appleMusicAppLinksProvider = AutoDisposeStreamProvider<Uri>.internal(
  appleMusicAppLinks,
  name: r'appleMusicAppLinksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appleMusicAppLinksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppleMusicAppLinksRef = AutoDisposeStreamProviderRef<Uri>;
String _$appleMusicAppLinkSongDetailsHash() =>
    r'6c51d5f55c12be8e886ad50fdbb79363c8408cd2';

/// See also [appleMusicAppLinkSongDetails].
@ProviderFor(appleMusicAppLinkSongDetails)
final appleMusicAppLinkSongDetailsProvider =
    AutoDisposeFutureProvider<SongDetails>.internal(
  appleMusicAppLinkSongDetails,
  name: r'appleMusicAppLinkSongDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appleMusicAppLinkSongDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppleMusicAppLinkSongDetailsRef
    = AutoDisposeFutureProviderRef<SongDetails>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
