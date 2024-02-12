import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_providers.g.dart';

@riverpod
SharedPreferences sharedPreferencesInstance(
  SharedPreferencesInstanceRef ref,
) =>
    throw UnimplementedError();

@riverpod
class SharedPreferencesController extends _$SharedPreferencesController {
  @override
  SharedPreferences build() {
    return ref.watch(sharedPreferencesInstanceProvider);
  }

  void _didChange() {
    state.reload();
    ref.notifyListeners();
  }

  Future<void> clear() async {
    await state.clear();
    logger.fine('clear SharedPreferences');
    _didChange();
  }
}
