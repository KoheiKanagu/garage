// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'shared_preferences_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesInstanceHash() =>
    r'5d2614cf1a835c347c11cb0748cb2f28c024471f';

/// See also [sharedPreferencesInstance].
@ProviderFor(sharedPreferencesInstance)
final sharedPreferencesInstanceProvider =
    AutoDisposeProvider<SharedPreferences>.internal(
  sharedPreferencesInstance,
  name: r'sharedPreferencesInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesInstanceRef
    = AutoDisposeProviderRef<SharedPreferences>;
String _$sharedPreferencesControllerHash() =>
    r'2bca893846b1e2bea9cb45a10ba16b8f9da3a9c5';

/// See also [SharedPreferencesController].
@ProviderFor(SharedPreferencesController)
final sharedPreferencesControllerProvider = AutoDisposeNotifierProvider<
    SharedPreferencesController, SharedPreferences>.internal(
  SharedPreferencesController.new,
  name: r'sharedPreferencesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SharedPreferencesController = AutoDisposeNotifier<SharedPreferences>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
