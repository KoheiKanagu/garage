import 'package:core/core.dart';
import 'package:core/features/ads/application/ads_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_providers.g.dart';

const String _kRequestConsentInfoUpdate = 'request_consent_info_update';

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

  Future<void> setRequestConsentInfoUpdate({
    bool value = false,
  }) async {
    await state.setBool(
      _kRequestConsentInfoUpdate,
      value,
    );
    _didChange();
  }
}

/// request ads consent info update
///
// ignore: lines_longer_than_80_chars
/// If true is returned, use [adsRequestConsentInfoUpdateProvider] to request consent info update.
@riverpod
bool sharedPreferencesRequestConsentInfoUpdate(
  SharedPreferencesRequestConsentInfoUpdateRef ref,
) =>
    ref.watch(sharedPreferencesControllerProvider).getBool(
          _kRequestConsentInfoUpdate,
        ) ??
    true;
