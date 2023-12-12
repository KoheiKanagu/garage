import 'package:core/core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'configure_providers.g.dart';

@riverpod
Future<bool> configureIsReleasedNewVersion(
  ConfigureIsReleasedNewVersionRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kLatestVersionCode,
      defaultValue: RemoteConfigConstant.kLatestVersionCodeValue,
    ).future,
  );

  return value > ref.watch(packageInfoBuildNumberProvider);
}

@riverpod
Future<bool> configureIsNeedUpdate(
  ConfigureIsNeedUpdateRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kRequirementVersionCode,
      defaultValue: RemoteConfigConstant.kRequirementVersionCodeValue,
    ).future,
  );

  return value > ref.watch(packageInfoBuildNumberProvider);
}

@riverpod
Future<ServiceStatus> configureServiceStatus(
  ConfigureServiceStatusRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetStringValueProvider(
      key: RemoteConfigConstant.kServiceStatus,
      defaultValue: '',
    ).future,
  );

  return switch (value) {
    'up' => ServiceStatus.up,
    'down' => ServiceStatus.down,
    _ => ServiceStatus.down,
  };
}

@riverpod
Future<String> remoteConfigGetStringValue(
  RemoteConfigGetStringValueRef ref, {
  required String key,
  required String defaultValue,
}) async {
  final result = await ref.watch(remoteConfigValuesProvider.future);
  return result[key]?.asString() ?? defaultValue;
}

@riverpod
Future<int> remoteConfigGetIntValue(
  RemoteConfigGetIntValueRef ref, {
  required String key,
  required int defaultValue,
}) async {
  final result = await ref.watch(remoteConfigValuesProvider.future);
  return result[key]?.asInt() ?? defaultValue;
}

@riverpod
Future<double> remoteConfigGetDoubleValue(
  RemoteConfigGetDoubleValueRef ref, {
  required String key,
  required double defaultValue,
}) async {
  final result = await ref.watch(remoteConfigValuesProvider.future);
  return result[key]?.asDouble() ?? defaultValue;
}

@riverpod
Future<bool> remoteConfigGetBoolValue(
  RemoteConfigGetBoolValueRef ref, {
  required String key,
  required bool defaultValue,
}) async {
  final result = await ref.watch(remoteConfigValuesProvider.future);
  return result[key]?.asBool() ?? defaultValue;
}

@riverpod
Stream<Map<String, RemoteConfigValue>> remoteConfigValues(
  RemoteConfigValuesRef ref,
) =>
    ref.watch(firebaseRemoteConfigProvider).whenOrNull(
          data: (value) => value.onConfigUpdated.map(
            (_) => value.getAll(),
          ),
        ) ??
    const Stream.empty();
