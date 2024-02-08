import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/features/permission/presentation/permission_tile_base.dart';
import 'package:listen_to_music_by_location/gen/assets.gen.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MusicPermissionTile extends HookConsumerWidget {
  const MusicPermissionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status =
        ref.watch(musicKitCurrentPermissionStatusProvider).asData?.value;

    return PermissionTileBase(
      headerLabel: i18n.permission.apple_music,
      footerLabel: i18n.permission.apple_music_details,
      children: [
        CupertinoListTile.notched(
          title: Text(
            status == MusicAuthorizationStatus.authorized
                ? i18n.permission.permission_ok
                : i18n.continue_text,
          ),
          leading: ScalableImageWidget.fromSISource(
            si: ScalableImageSource.fromSI(
              DefaultAssetBundle.of(context),
              Assets.si.appleMusicIcon,
            ),
          ),
          trailing: switch (status) {
            MusicAuthorizationStatus.authorized => const Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: CupertinoColors.systemGreen,
              ),
            _ => const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: CupertinoColors.systemRed,
              ),
          },
          onTap: () async {
            final status =
                await ref.read(musicKitCurrentPermissionStatusProvider.future);

            switch (status) {
              case MusicAuthorizationStatus.notDetermined:
                await ref.read(musicKitProvider).requestPermission();
                // 現在の権限を取得させるためにinvalidate
                ref.invalidate(musicKitCurrentPermissionStatusProvider);

              case MusicAuthorizationStatus.denied ||
                    MusicAuthorizationStatus.restricted:
                // 利用できないか拒否されている場合
                // 設定画面への遷移を促す
                if (context.mounted) {
                  final result = await showModalActionSheet(
                    context: context,
                    title: i18n.permission.denied_apple_music_permission,
                    message:
                        i18n.permission.denied_apple_music_permission_message,
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
              case MusicAuthorizationStatus.authorized:
                break;
            }
          },
        ),
      ],
    );
  }
}
