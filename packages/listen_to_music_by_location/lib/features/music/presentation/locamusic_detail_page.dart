import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/map/application/map_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/distance_range_segmented_control.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page_header.dart';
import 'package:listen_to_music_by_location/features/native/application/map_view_delegate.dart';
import 'package:listen_to_music_by_location/features/native/presentation/my_map_view.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class LocamusicDetailPage extends HookConsumerWidget {
  const LocamusicDetailPage({
    required this.documentId,
    super.key,
  });

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locamusic = ref
        .watch(
          locamusicDocumentProvider(
            documentId: documentId,
          ),
        )
        .value;
    final musicId = locamusic?.musicId;

    final songDetails = musicId == null
        ? null
        : ref
            .watch(
              locamusicSongDetailsProvider(musicId: musicId),
            )
            .value;

    useEffect(
      () {
        Future(
          () async {
            await ref.read(
              mapPageMapViewMapViewDidFinishLoadingMapProvider.selectAsync(
                (data) => data == MyMapViewType.locamusicDetailPage,
              ),
            );

            if (locamusic == null) {
              return null;
            }

            /// カメラ位置を調整
            ref.read(
              mapSetAnnotationRegionProvider(
                locamusic: (
                  documentId: documentId,
                  locamusic: locamusic,
                ),
                myMapViewType: MyMapViewType.locamusicDetailPage,
              ),
            );
          },
        );

        return null;
      },
      [
        locamusic,
        songDetails,
      ],
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: i18n.app_name,
        middle: Text(i18n.locamusic.title),
        // locamusicがまだ取得できていない時は削除ボタンを表示しない
        trailing: locamusic == null
            ? null
            : CupertinoButton(
                onPressed: () async {
                  final result = await showOkCancelAlertDialog(
                    context: context,
                    title: i18n.locamusic.delete_confirm,
                    isDestructiveAction: true,
                    okLabel:
                        MaterialLocalizations.of(context).deleteButtonTooltip,
                  );

                  if (result == OkCancelResult.ok) {
                    if (context.mounted) {
                      GoRouter.of(context).pop();
                    }

                    await ref.read(
                      locamusicDeleteProvider(
                        documentId: documentId,
                      ).future,
                    );
                  }
                },
                child: const Icon(CupertinoIcons.delete),
              ),
      ),
      child: locamusic == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                CupertinoListSection.insetGrouped(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          LocamusicDetailPageHeader(
                            documentId: documentId,
                            songDetails: songDetails,
                          ),
                          const Divider(),
                          const AbsorbPointer(
                            child: SizedBox(
                              height: 200,
                              child: MyMapView(
                                layoutMarginsBottom: 0,
                                myMapViewType:
                                    MyMapViewType.locamusicDetailPage,
                              ),
                            ),
                          ),
                          const Gap(12),
                          DistanceRangeSegmentedControl(
                            onChanged: (value) {
                              final newValue = locamusic.copyWith(
                                distance: value.meters,
                              );

                              ref.read(
                                locamusicUpdateProvider(
                                  documentId: documentId,
                                  locamusic: newValue,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
