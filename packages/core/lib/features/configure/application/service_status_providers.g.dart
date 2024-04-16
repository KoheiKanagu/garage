// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'service_status_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceStatusHash() => r'7f2c3840172656e5876531badaea723ae276f002';

/// サービスの稼働状況
///
/// Copied from [serviceStatus].
@ProviderFor(serviceStatus)
final serviceStatusProvider = AutoDisposeStreamProvider<Status>.internal(
  serviceStatus,
  name: r'serviceStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serviceStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ServiceStatusRef = AutoDisposeStreamProviderRef<Status>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
