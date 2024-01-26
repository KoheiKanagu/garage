import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_providers.g.dart';

/// 各種権限の確認が必要かどうかを返す
@riverpod
Future<bool> permissionRequestIsNeed(
  PermissionRequestIsNeedRef ref,
) async {
  final locationStatus = await ref
      .watch(locationManagerCurrentPermissionStatusStreamProvider.future);

  final musicStatus =
      await ref.watch(musicKitCurrentPermissionStatusProvider.future);

  if (locationStatus == AuthorizationStatus.authorizedAlways &&
      musicStatus == MusicAuthorizationStatus.authorized) {
    return false;
  }

  return true;
}
