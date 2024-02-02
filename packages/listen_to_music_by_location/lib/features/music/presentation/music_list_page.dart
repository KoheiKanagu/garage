import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/configure/application/my_configure_route.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/music_route.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_artwork_widget.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_list_tile.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MusicListPage extends HookConsumerWidget {
  const MusicListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locamusics = ref.watch(locamusicDocumentsProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            largeTitle: Text(i18n.app_name),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(
                CupertinoIcons.settings,
              ),
              onPressed: () {
                MyConfigureRoute(context).push<void>(context);
              },
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: locamusics.maybeWhen(
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (data) => data.isEmpty
                  ? const SizedBox.shrink()
                  : CupertinoListSection(
                      additionalDividerMargin:
                          MusicArtworkWidget.kDefaultSize + 16,
                      children: data
                          .map<Widget>(
                            (e) => MusicListTile(
                              e.locamusic.musicId,
                              onTap: () {
                                LocamusicDetailPageRoute(e.documentId)
                                    .push<void>(context);
                              },
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
