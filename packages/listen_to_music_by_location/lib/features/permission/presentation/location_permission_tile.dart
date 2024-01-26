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
                : i18n.permission.request_location_permission,
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
                  await showOkAlertDialog(
                    context: context,
                    title: i18n.permission.request_authorized_when_in_use,
                  );
                }
                await ref
                    .read(locationManagerProvider)
                    .requestAuthorization(always: false);

              case AuthorizationStatus.authorizedWhenInUse:
                // 使用中のみ許可されている場合は、常に許可を求める
                if (context.mounted) {
                  await showOkAlertDialog(
                    context: context,
                    title: i18n.permission.request_authorized_always,
                  );
                }
                await ref
                    .read(locationManagerProvider)
                    .requestAuthorization(always: true);

              case AuthorizationStatus.restricted || AuthorizationStatus.denied:
                // 利用できないか拒否されている場合
                // 設定画面への遷移を促す
                if (context.mounted) {
                  final result = await showModalActionSheet(
                    context: context,
                    title: i18n.permission.denied_location_permission,
                    message: i18n.permission.denied_location_permission_message,
                    actions: [
                      SheetAction(
                        label: i18n.permission.settings,
                        key: i18n.permission.settings,
                      ),
                    ],
                  );
                  if (result == i18n.permission.settings) {
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
}
