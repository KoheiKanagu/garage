import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_providers.g.dart';

@riverpod
SharedPreferences sharedPreferencesInstance(
  SharedPreferencesInstanceRef ref,
) =>
    throw UnimplementedError();

@riverpod
Future<void> sharedPreferencesClear(
  SharedPreferencesClearRef ref,
) async {
  await ref.watch(sharedPreferencesInstanceProvider).clear();
  ref.invalidate(sharedPreferencesInstanceProvider);
}
