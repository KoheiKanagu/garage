// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'location_manager_delegate.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationManagerDelegateHash() =>
    r'619eb56375bbd5862c9fb074f2b74cf1e421561c';

/// See also [_locationManagerDelegate].
@ProviderFor(_locationManagerDelegate)
final _locationManagerDelegateProvider =
    AutoDisposeProvider<_LocationManagerDelegate>.internal(
  _locationManagerDelegate,
  name: r'_locationManagerDelegateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationManagerDelegateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _LocationManagerDelegateRef
    = AutoDisposeProviderRef<_LocationManagerDelegate>;
String _$locationManagerDidChangeAuthorizationHash() =>
    r'ef405b0d988973d67a0a3ed3a7ccc41c2feae8ad';

/// See also [locationManagerDidChangeAuthorization].
@ProviderFor(locationManagerDidChangeAuthorization)
final locationManagerDidChangeAuthorizationProvider =
    AutoDisposeStreamProvider<AuthorizationStatus>.internal(
  locationManagerDidChangeAuthorization,
  name: r'locationManagerDidChangeAuthorizationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationManagerDidChangeAuthorizationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationManagerDidChangeAuthorizationRef
    = AutoDisposeStreamProviderRef<AuthorizationStatus>;
String _$locationManagerDidDetermineStateHash() =>
    r'a028265403f1a30c3008545a864b24a7f4a6a254';

/// See also [locationManagerDidDetermineState].
@ProviderFor(locationManagerDidDetermineState)
final locationManagerDidDetermineStateProvider =
    AutoDisposeStreamProvider<({Region region, RegionState state})>.internal(
  locationManagerDidDetermineState,
  name: r'locationManagerDidDetermineStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationManagerDidDetermineStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationManagerDidDetermineStateRef
    = AutoDisposeStreamProviderRef<({Region region, RegionState state})>;
String _$locationManagerDidStartMonitoringHash() =>
    r'0c581614cccce1ebd7084aaa2b74297d3a79ba3d';

/// See also [locationManagerDidStartMonitoring].
@ProviderFor(locationManagerDidStartMonitoring)
final locationManagerDidStartMonitoringProvider =
    AutoDisposeStreamProvider<({Region region, String? error})>.internal(
  locationManagerDidStartMonitoring,
  name: r'locationManagerDidStartMonitoringProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationManagerDidStartMonitoringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationManagerDidStartMonitoringRef
    = AutoDisposeStreamProviderRef<({Region region, String? error})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
