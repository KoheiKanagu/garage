import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page_header.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
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
    final data = ref.watch(
      locamusicWithSongDetailsProvider(
        documentId: documentId,
      ),
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: i18n.app_name,
        middle: Text(i18n.locamusic.title),
      ),
      child: data.maybeWhen(
        orElse: CircularProgressIndicator.adaptive,
        data: (data) => ListView(
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      LocamusicDetailPageHeader(
                        documentId: documentId,
                        songDetails: data.songDetails,
                      ),
                      const Divider(),
                      AbsorbPointer(
                        child: SizedBox(
                          height: 200,
                          child: MyMapView(
                            layoutMarginsBottom: 0,
                            latitude: data.locamusic.geoPoint.latitude,
                            longitude: data.locamusic.geoPoint.longitude,
                            meters: data.locamusic.distance + 50,
                          ),
                        ),
                      ),
                      AbsorbPointer(
                        child: SizedBox(
                          height: 200,
                          child: MyMapView(
                            layoutMarginsBottom: 0,
                            latitude: data.locamusic.geoPoint.latitude,
                            longitude: data.locamusic.geoPoint.longitude,
                            meters: data.locamusic.distance + 50,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(myMapHostApiProvider).addAnnotations(
                            [
                              CircleAnnotation(
                                identifier: documentId,
                                latitude: data.locamusic.geoPoint.latitude,
                                longitude: data.locamusic.geoPoint.longitude,
                                title: data.songDetails?.title ?? i18n.unset,
                                circleDistance: data.locamusic.distance,
                              ),
                            ],
                          );
                        },
                        child: const Text('hoge'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
