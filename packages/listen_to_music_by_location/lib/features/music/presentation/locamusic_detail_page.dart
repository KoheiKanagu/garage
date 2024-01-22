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

    final didFinishMapViewType = ref
        .watch(
          mapPageMapViewMapViewDidFinishLoadingMapProvider(
            whereViewType: MapViewType.locamusicDetailPage,
          ),
        )
        .asData
        ?.value;

    if (locamusic != null && didFinishMapViewType != null) {
      // MapViewが読み込まれたらAnnotationを描画
      useEffect(
        () {
          /// カメラ位置も調整
          ref.read(
            mapSetAnnotationRegionProvider(
              locamusic: (
                documentId: documentId,
                locamusic: locamusic,
              ),
              mapViewType: MapViewType.locamusicDetailPage,
            ),
          );

          return null;
        },
        [
          didFinishMapViewType,
          locamusic,
        ],
      );
    }

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: i18n.app_name,
        middle: Text(i18n.locamusic.title),
        trailing: CupertinoButton(
          // locamusicがまだ取得できていない時は削除ボタンdisable
          onPressed: locamusic == null
              ? null
              : () async {
                  final result = await showOkCancelAlertDialog(
                    context: context,
                    title: i18n.locamusic.delete_confirm,
                    isDestructiveAction: true,
                    okLabel:
                        MaterialLocalizations.of(context).deleteButtonTooltip,
                  );

                  if (result == OkCancelResult.ok) {
                    await ref.read(
                      locamusicDeleteProvider(
                        documentId: documentId,
                      ).future,
                    );

                    if (context.mounted) {
                      GoRouter.of(context).pop();
                    }
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
                          ),
                          const Divider(),
                          const AbsorbPointer(
                            child: SizedBox(
                              height: 200,
                              child: MyMapView(
                                layoutMarginsBottom: 0,
                                mapViewType: MapViewType.locamusicDetailPage,
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
