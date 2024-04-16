import 'package:core/features/firebase/application/firebase_providers.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_providers.g.dart';

@riverpod
Future<String> remoteConfigGetStringValue(
  RemoteConfigGetStringValueRef ref, {
  required String key,
  required String defaultValue,
}) =>
    ref.watch(
      remoteConfigValuesProvider.selectAsync(
        (e) => e[key]?.asString() ?? defaultValue,
      ),
    );

@riverpod
Future<int> remoteConfigGetIntValue(
  RemoteConfigGetIntValueRef ref, {
  required String key,
  required int defaultValue,
}) =>
    ref.watch(
      remoteConfigValuesProvider.selectAsync(
        (e) => e[key]?.asInt() ?? defaultValue,
      ),
    );

@riverpod
Future<double> remoteConfigGetDoubleValue(
  RemoteConfigGetDoubleValueRef ref, {
  required String key,
  required double defaultValue,
}) =>
    ref.watch(
      remoteConfigValuesProvider.selectAsync(
        (e) => e[key]?.asDouble() ?? defaultValue,
      ),
    );

@riverpod
Future<bool> remoteConfigGetBoolValue(
  RemoteConfigGetBoolValueRef ref, {
  required String key,
  required bool defaultValue,
}) =>
    ref.watch(
      remoteConfigValuesProvider.selectAsync(
        (e) => e[key]?.asBool() ?? defaultValue,
      ),
    );

@riverpod
Stream<Map<String, RemoteConfigValue>> remoteConfigValues(
  RemoteConfigValuesRef ref,
) async* {
  final config = await ref.watch(firebaseRemoteConfigProvider.future);
  await config.fetchAndActivate();
  yield config.getAll();

  // "Multiple listeners can be added by calling this method again"
  // なので取り扱いに注意が必要
  yield* config.onConfigUpdated.asyncMap(
    (_) async {
      final config = await ref.watch(firebaseRemoteConfigProvider.future);
      await config.activate();
      return config.getAll();
    },
  );
}
