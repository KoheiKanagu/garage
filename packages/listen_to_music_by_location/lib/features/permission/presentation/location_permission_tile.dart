import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/features/permission/presentation/permission_tile_base.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class LocationPermissionTile extends HookConsumerWidget {
  const LocationPermissionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref
        .watch(locationManagerCurrentPermissionStatusStreamProvider)
        .asData
        ?.value;

    return PermissionTileBase(
      headerLabel: i18n.permission.location,
      footerLabel: i18n.permission.location_details,
      children: [
        CupertinoListTile.notched(
          leading: const Icon(
            CupertinoIcons.location_fill,
            color: CupertinoColors.activeBlue,
          ),
          title: Text(
            status == AuthorizationStatus.authorizedAlways
                ? i18n.permission.permission_ok
                : i18n.continue_text,
          ),
          trailing: switch (status) {
            AuthorizationStatus.authorizedAlways => const Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: CupertinoColors.systemGreen,
              ),
            _ => const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: CupertinoColors.systemRed,
              ),
          },
          onTap: () async {
            final status = await ref
                .read(locationManagerProvider)
                .currentPermissionStatus();

            switch (status) {
              case AuthorizationStatus.notDetermined:
                // まだ許可を求めていない場合は、まず使用中のみ許可を求める
                if (context.mounted) {
                  final result = await _showActionSheet(
                    context: context,
                    title: i18n.permission.request_location_dialog_title,
                    message: i18n.permission.request_location_dialog_message,
                    requestPermission: true,
                  );

                  switch (result) {
                    case _ShowActionSheetResult.openSettings:
                      await ref.read(openSettingsProvider).openSettings();
                    case _ShowActionSheetResult.requestPermission:
                      await ref
                          .read(locationManagerProvider)
                          .requestAuthorization(always: false);
                    case _:
                    // cancel
                  }
                }

              case AuthorizationStatus.authorizedWhenInUse:
                // 使用中のみ許可されている場合は、常に許可を求める
                if (context.mounted) {
                  final result = await _showActionSheet(
                    context: context,
                    title: i18n.permission.request_location_always_dialog_title,
                    message: i18n.permission.request_location_dialog_message,
                    requestPermission: true,
                  );

                  switch (result) {
                    case _ShowActionSheetResult.openSettings:
                      await ref.read(openSettingsProvider).openSettings();
                    case _ShowActionSheetResult.requestPermission:
                      await ref
                          .read(locationManagerProvider)
                          .requestAuthorization(always: true);
                    case _:
                    // cancel
                  }
                }

              case AuthorizationStatus.restricted || AuthorizationStatus.denied:
                // 利用できないか拒否されている場合
                if (context.mounted) {
                  final result = await _showActionSheet(
                    context: context,
                    title: i18n.permission.denied_location_permission_title,
                    message: i18n.permission.denied_location_permission_message,
                    requestPermission: false,
                  );

                  if (result == _ShowActionSheetResult.openSettings) {
                    await ref.read(openSettingsProvider).openSettings();
                  }
                }

              case AuthorizationStatus.authorizedAlways:
                // 常に許可されている場合は何もしない
                break;
            }
          },
        ),
      ],
    );
  }

  Future<_ShowActionSheetResult?> _showActionSheet({
    required BuildContext context,
    required String title,
    required String message,
    required bool requestPermission,
  }) =>
      showModalActionSheet(
        context: context,
        title: title,
        message: message,
        actions: [
          if (requestPermission)
            SheetAction(
              label: i18n.continue_text,
              key: _ShowActionSheetResult.requestPermission,
            ),
          SheetAction(
            label: i18n.permission.settings,
            key: _ShowActionSheetResult.openSettings,
          ),
        ],
      );
}

enum _ShowActionSheetResult {
  openSettings,
  requestPermission,
  ;
}
