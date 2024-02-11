// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'ads_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adsConsentStatusHash() => r'5f46b9754b6f87d055ee1afc42fec09d6b872bdd';

/// See also [adsConsentStatus].
@ProviderFor(adsConsentStatus)
final adsConsentStatusProvider =
    AutoDisposeFutureProvider<ConsentStatus>.internal(
  adsConsentStatus,
  name: r'adsConsentStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adsConsentStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdsConsentStatusRef = AutoDisposeFutureProviderRef<ConsentStatus>;
String _$adsRequestConsentInfoUpdateControllerHash() =>
    r'093f6d0f916a9b34f953a7607197382f9c73c3dd';

/// トラッキングをリクエストするべきかどうか
///
/// Copied from [AdsRequestConsentInfoUpdateController].
@ProviderFor(AdsRequestConsentInfoUpdateController)
final adsRequestConsentInfoUpdateControllerProvider =
    AutoDisposeNotifierProvider<AdsRequestConsentInfoUpdateController,
        bool>.internal(
  AdsRequestConsentInfoUpdateController.new,
  name: r'adsRequestConsentInfoUpdateControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adsRequestConsentInfoUpdateControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdsRequestConsentInfoUpdateController = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
