import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/map/application/map_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/presentation/distance_range_segmented_control.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page_header.dart';
import 'package:listen_to_music_by_location/features/native/presentation/map_view.dart';
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
    ref.listen(
      mapLocamusicDetailPageInitializeProvider(documentId).future,
      (_, __) => logger.d('on mapLocamusicDetailPageInitializeProvider'),
    );

    return ref
        .watch(
          locamusicDocumentProvider(documentId),
        )
        .maybeWhen(
          orElse: () => const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(),
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
          data: (locamusic) => CupertinoPageScaffold(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            navigationBar: CupertinoNavigationBar(
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  final result = await showOkCancelAlertDialog(
                    context: context,
                    title: i18n.locamusic.delete_confirm,
                    isDestructiveAction: true,
                    okLabel:
                        MaterialLocalizations.of(context).deleteButtonTooltip,
                  );

                  if (result == OkCancelResult.ok) {
                    await ref.read(
                      locamusicDeleteProvider(documentId).future,
                    );

                    if (context.mounted) {
                      GoRouter.of(context).pop();
                    }
                  }
                },
                child: const Icon(CupertinoIcons.delete),
              ),
            ),
            child: ListView(
              children: [
                CupertinoListSection.insetGrouped(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: LocamusicDetailPageHeader(
                        documentId: documentId,
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  header: Text(i18n.locamusic.range_select_title),
                  footer: i18n.locamusic.range_notice.wrapBudouXText(
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 13,
                            ),
                  ),
                  children: [
                    Column(
                      children: [
                        const AbsorbPointer(
                          child: SizedBox(
                            height: 200,
                            child: MapView(
                              layoutMarginsBottom: 0,
                              mapViewType: MapViewType.locamusicDetailPage,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: DistanceRangeSegmentedControl(
                            initialValue: DistanceRange.fromMeters(
                              locamusic.distance,
                            ),
                            onChanged: (value) {
                              final newValue = locamusic.copyWith(
                                distance: value.meters,
                              );

                              ref.read(
                                locamusicUpdateProvider(
                                  documentId,
                                  locamusic: newValue,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
