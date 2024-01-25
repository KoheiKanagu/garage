import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MusicPermissionTile extends HookConsumerWidget {
  const MusicPermissionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.watch(musicKitProvider).currentPermissionStatus();

    return CupertinoListSection.insetGrouped(
      header: Text(
        i18n.permission.music_library,
      ),
      footer: i18n.permission.music_library_details.wrapBudouXText(
        style: Theme.of(context).textTheme.bodySmall,
      ),
      children: [
        CupertinoListTile.notched(
            // title: Text(i1),
            ),
      ],
    );
  }
}
