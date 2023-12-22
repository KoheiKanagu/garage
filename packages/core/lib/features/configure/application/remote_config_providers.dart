import 'package:core/features/firebase/application/firebase_providers.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_providers.g.dart';

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
class RemoteConfigValues extends _$RemoteConfigValues {
  @override
  Stream<Map<String, RemoteConfigValue>> build() async* {
    final config = await ref.watch(firebaseRemoteConfigProvider.future);

    // 変更を監視
    final subscription = config.onConfigUpdated.listen(
      (event) async {
        final config = await ref.read(firebaseRemoteConfigProvider.future);
        await config.activate();
        state = AsyncValue.data(
          config.getAll(),
        );
      },
    );
    ref.onDispose(subscription.cancel);

    yield config.getAll();
  }
}
