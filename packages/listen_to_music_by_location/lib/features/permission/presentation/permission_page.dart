import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/permission/presentation/location_permission_tile.dart';
import 'package:listen_to_music_by_location/features/permission/presentation/music_permission_tile.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class PermissionPage extends HookConsumerWidget {
  const PermissionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(MaterialLocalizations.of(context).closeButtonLabel),
            ),
            largeTitle: Text(
              i18n.permission.title,
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  LocationPermissionTile(),
                  MusicPermissionTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
