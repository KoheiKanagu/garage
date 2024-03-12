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
String _$adsBannerHash() => r'19182e8196a44eb795fdead28cfadf9faccc0439';

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

/// See also [adsBanner].
@ProviderFor(adsBanner)
const adsBannerProvider = AdsBannerFamily();

/// See also [adsBanner].
class AdsBannerFamily extends Family<AsyncValue<BannerAd>> {
  /// See also [adsBanner].
  const AdsBannerFamily();

  /// See also [adsBanner].
  AdsBannerProvider call({
    required String adUnitId,
    required int width,
  }) {
    return AdsBannerProvider(
      adUnitId: adUnitId,
      width: width,
    );
  }

  @override
  AdsBannerProvider getProviderOverride(
    covariant AdsBannerProvider provider,
  ) {
    return call(
      adUnitId: provider.adUnitId,
      width: provider.width,
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
  String? get name => r'adsBannerProvider';
}

/// See also [adsBanner].
class AdsBannerProvider extends AutoDisposeFutureProvider<BannerAd> {
  /// See also [adsBanner].
  AdsBannerProvider({
    required String adUnitId,
    required int width,
  }) : this._internal(
          (ref) => adsBanner(
            ref as AdsBannerRef,
            adUnitId: adUnitId,
            width: width,
          ),
          from: adsBannerProvider,
          name: r'adsBannerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$adsBannerHash,
          dependencies: AdsBannerFamily._dependencies,
          allTransitiveDependencies: AdsBannerFamily._allTransitiveDependencies,
          adUnitId: adUnitId,
          width: width,
        );

  AdsBannerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.adUnitId,
    required this.width,
  }) : super.internal();

  final String adUnitId;
  final int width;

  @override
  Override overrideWith(
    FutureOr<BannerAd> Function(AdsBannerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdsBannerProvider._internal(
        (ref) => create(ref as AdsBannerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        adUnitId: adUnitId,
        width: width,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BannerAd> createElement() {
    return _AdsBannerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdsBannerProvider &&
        other.adUnitId == adUnitId &&
        other.width == width;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adUnitId.hashCode);
    hash = _SystemHash.combine(hash, width.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AdsBannerRef on AutoDisposeFutureProviderRef<BannerAd> {
  /// The parameter `adUnitId` of this provider.
  String get adUnitId;

  /// The parameter `width` of this provider.
  int get width;
}

class _AdsBannerProviderElement
    extends AutoDisposeFutureProviderElement<BannerAd> with AdsBannerRef {
  _AdsBannerProviderElement(super.provider);

  @override
  String get adUnitId => (origin as AdsBannerProvider).adUnitId;
  @override
  int get width => (origin as AdsBannerProvider).width;
}

String _$adsRequestConsentInfoUpdateControllerHash() =>
    r'59ea1a3435b5cd3d328f0ebdac4dbe3dc71df3de';

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
