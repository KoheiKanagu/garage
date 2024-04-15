// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'version_check_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$versionCheckIsReleasedNewHash() =>
    r'5be9d2d84d83e735be7d02bb5d611fb9f09746a0';

/// 新しいバージョンがリリースされているかどうか
///
/// Copied from [versionCheckIsReleasedNew].
@ProviderFor(versionCheckIsReleasedNew)
final versionCheckIsReleasedNewProvider =
    AutoDisposeFutureProvider<bool>.internal(
  versionCheckIsReleasedNew,
  name: r'versionCheckIsReleasedNewProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$versionCheckIsReleasedNewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VersionCheckIsReleasedNewRef = AutoDisposeFutureProviderRef<bool>;
String _$versionCheckIsRequiredUpdateHash() =>
    r'b37ece0e640f03381a5ec2519a29b570cec58157';

/// 新しいバージョンにアップデートが必須であるかどうか
///
/// Copied from [versionCheckIsRequiredUpdate].
@ProviderFor(versionCheckIsRequiredUpdate)
final versionCheckIsRequiredUpdateProvider =
    AutoDisposeFutureProvider<bool>.internal(
  versionCheckIsRequiredUpdate,
  name: r'versionCheckIsRequiredUpdateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$versionCheckIsRequiredUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VersionCheckIsRequiredUpdateRef = AutoDisposeFutureProviderRef<bool>;
String _$versionCheckInfoHash() => r'1f1f6cef39d3e4e650881abdd60f1b33e3f0f422';

/// See also [versionCheckInfo].
@ProviderFor(versionCheckInfo)
final versionCheckInfoProvider =
    AutoDisposeStreamProvider<UpgraderVersionInfo>.internal(
  versionCheckInfo,
  name: r'versionCheckInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$versionCheckInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VersionCheckInfoRef = AutoDisposeStreamProviderRef<UpgraderVersionInfo>;
String _$upgraderHash() => r'41e8f9f9aa8a812252032f37d568954afc92a0bf';

/// See also [upgrader].
@ProviderFor(upgrader)
final upgraderProvider = AutoDisposeProvider<Upgrader>.internal(
  upgrader,
  name: r'upgraderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$upgraderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpgraderRef = AutoDisposeProviderRef<Upgrader>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
