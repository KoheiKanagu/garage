import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/map/application/map_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
import 'package:listen_to_music_by_location/features/music/presentation/distance_range_segmented_control.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page_header.dart';
import 'package:listen_to_music_by_location/features/native/application/map_view_delegate.dart';
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
    final initialized = useState(false);

    useEffect(
      () {
        Future(
          () async {
            // MapViewの初期化待ち
            await ref.read(mapViewDidFinishLoadingMapProvider).firstWhere(
                  (element) => element == MapViewType.locamusicDetailPage,
                );
            initialized.value = true;
          },
        );
        return null;
      },
      [context],
    );

    // Mapの初期化が完了次第、Annotationの描画とカメラの移動
    if (initialized.value) {
      ref.listen(
        mapLocamusicDetailPageHandlerProvider(documentId),
        (_, __) => logger.fine('on mapLocamusicDetailPageHandlerProvider'),
      );
    }

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
                _Range(locamusic, documentId),
                _BuiltInSpeakerSwitch(locamusic, documentId),
              ],
            ),
          ),
        );
  }
}

class _Range extends HookConsumerWidget {
  const _Range(
    this.locamusic,
    this.documentId,
  );

  final Locamusic locamusic;

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListSection.insetGrouped(
      header: Text(i18n.locamusic.range_select_title),
      footer: Text(
        i18n.locamusic.range_notice,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
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
                  mapViewType: MapViewType.locamusicDetailPage,
                  layoutMarginsBottom: 0,
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
    );
  }
}

class _BuiltInSpeakerSwitch extends HookConsumerWidget {
  const _BuiltInSpeakerSwitch(
    this.locamusic,
    this.documentId,
  );

  final Locamusic locamusic;

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListSection.insetGrouped(
      header: Text(i18n.locamusic.built_in_speaker_title),
      footer: Text(
        i18n.locamusic.built_in_speaker_notice,
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 13,
            ),
      ),
      children: [
        CupertinoListTile.notched(
          title: Text(i18n.locamusic.allow_play),
          trailing: CupertinoSwitch(
            value: locamusic.allowBuiltInSpeaker,
            onChanged: (value) async {
              if (value) {
                // オンにする時は注意を表示
                final result = await showOkAlertDialog(
                  context: context,
                  title: i18n.locamusic.built_in_speaker_on_warning_title,
                  message: i18n.locamusic.built_in_speaker_on_warning_message,
                );
                if (result != OkCancelResult.ok) {
                  return;
                }
              }

              await ref.read(
                locamusicUpdateProvider(
                  documentId,
                  locamusic: locamusic.copyWith(
                    allowBuiltInSpeaker: value,
                  ),
                ).future,
              );
            },
          ),
        ),
      ],
    );
  }
}
