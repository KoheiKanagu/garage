import 'package:listen_to_music_by_location/features/map/presentation/map_page.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_providers.g.dart';

@riverpod
Future<void> mapDrawAnnotations(
  MapDrawAnnotationsRef ref, {
  required List<LocamusicWithDocumentId> locamusics,
  required MapViewType mapViewType,
}) async {
  // 既存のAnnotationを削除
  await switch (mapViewType) {
    MapViewType.mapPage => Future.wait(
        await ref.read(mapPageMapViewProvider).getAnnotations().then(
              (value) => [
                ref.read(mapPageMapViewProvider).removeAnnotations(value),
                ref
                    .read(mapPageMapViewProvider)
                    .removeAnnotationOverlays(value),
              ],
            ),
      ),
    MapViewType.locamusicDetailPage => Future.wait(
        await ref
            .read(locamusicDetailPageMapViewProvider)
            .getAnnotations()
            .then(
              (value) => [
                ref
                    .watch(locamusicDetailPageMapViewProvider)
                    .removeAnnotations(value),
                ref
                    .watch(locamusicDetailPageMapViewProvider)
                    .removeAnnotationOverlays(value),
              ],
            ),
      ),
  };

  // Annotationを追加
  // 曲が設定されている場合は曲情報を取得してタイトルに設定
  for (final (:documentId, :locamusic) in locamusics) {
    final SongDetails? songDetails;
    final musicId = locamusic.musicId;

    if (musicId != null) {
      songDetails = await ref.watch(
        locamusicSongDetailsProvider(musicId).future,
      );
    } else {
      songDetails = null;
    }

    final annotations = [
      CircleAnnotation(
        identifier: documentId,
        latitude: locamusic.geoPoint.latitude,
        longitude: locamusic.geoPoint.longitude,
        title: songDetails?.title ?? i18n.unset,
        circleDistance: locamusic.distance,
      ),
    ];

    await Future.wait(
      switch (mapViewType) {
        MapViewType.mapPage => [
            ref.read(mapPageMapViewProvider).addAnnotations(annotations),
            ref.read(mapPageMapViewProvider).addAnnotationOverlays(annotations),
          ],
        MapViewType.locamusicDetailPage => [
            ref
                .read(locamusicDetailPageMapViewProvider)
                .addAnnotations(annotations),
            ref
                .read(locamusicDetailPageMapViewProvider)
                .addAnnotationOverlays(annotations),
          ],
      },
    );
  }
}

/// Annotationを描画してカメラをズームする
@riverpod
Future<void> mapSetAnnotationRegion(
  MapSetAnnotationRegionRef ref, {
  required LocamusicWithDocumentId locamusic,
  required MapViewType mapViewType,
}) async {
  await ref.read(
    mapDrawAnnotationsProvider(
      locamusics: [locamusic].toList(),
      mapViewType: mapViewType,
    ).future,
  );

  switch (mapViewType) {
    case MapViewType.mapPage:
      await ref.read(mapPageMapViewProvider).setMapRegion(
            latitude: locamusic.locamusic.geoPoint.latitude,
            longitude: locamusic.locamusic.geoPoint.longitude,
            // MKCircleが十分に表示されるように描画範囲を広げる
            meters: locamusic.locamusic.distance * 2.5,
          );
    case MapViewType.locamusicDetailPage:
      await ref.read(locamusicDetailPageMapViewProvider).setMapRegion(
            latitude: locamusic.locamusic.geoPoint.latitude,
            longitude: locamusic.locamusic.geoPoint.longitude,
            // MKCircleが十分に表示されるように描画範囲を広げる
            meters: locamusic.locamusic.distance * 2.5,
          );
  }
}

/// [MapPage] のMapViewのハンドリング
@riverpod
Future<void> mapPageHandler(
  MapPageHandlerRef ref,
) async {
  final locamusics = await ref.watch(locamusicDocumentsProvider.future);

  // FieldValue.serverTimestamp なので一旦nullになるがすぐに更新されるため、
  // 無駄にAnnotationを描画しないように、いずれかがnullの場合はスキップする
  final anyNull = locamusics.any(
    (element) =>
        element.locamusic.updatedAt == null ||
        element.locamusic.createdAt == null,
  );
  if (anyNull) {
    return;
  }

  // Annotationを描画
  await ref.read(
    mapDrawAnnotationsProvider(
      locamusics: locamusics,
      mapViewType: MapViewType.mapPage,
    ).future,
  );
}

/// [LocamusicDetailPage] のMapViewのハンドリング
@riverpod
Future<void> mapLocamusicDetailPageHandler(
  MapLocamusicDetailPageHandlerRef ref,
  String documentId,
) async {
  final locamusic = await ref.watch(
    locamusicDocumentProvider(documentId).future,
  );

  // updatedAt は FieldValue.serverTimestamp なので一旦nullになるがすぐに更新される
  // ここでは updatedAt がnullかどうかは関係ないので無視する
  // 無視しないとAnnotationの描画がチラつく
  if (locamusic.createdAt == null || locamusic.updatedAt == null) {
    return;
  }

  // カメラ位置を調整
  await ref.read(
    mapSetAnnotationRegionProvider(
      locamusic: (
        documentId: documentId,
        locamusic: locamusic,
      ),
      mapViewType: MapViewType.locamusicDetailPage,
    ).future,
  );
}
