import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
import 'package:listen_to_music_by_location/features/native/application/my_location_manager_delegate.dart';
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
  final annotations = await ref.read(mapPageMapViewProvider).getAnnotations();
  await Future.wait(
    switch (mapViewType) {
      MapViewType.mapPage => [
          ref.read(mapPageMapViewProvider).removeAnnotations(annotations),
          ref
              .read(mapPageMapViewProvider)
              .removeAnnotationOverlays(annotations),
        ],
      MapViewType.locamusicDetailPage => [
          ref
              .watch(locamusicDetailPageMapViewProvider)
              .removeAnnotations(annotations),
          ref
              .watch(locamusicDetailPageMapViewProvider)
              .removeAnnotationOverlays(annotations),
        ],
    },
  );

  // Annotationを追加
  // 曲が設定されている場合は曲情報を取得してタイトルに設定
  for (final (:documentId, :locamusic) in locamusics) {
    final SongDetails? songDetails;
    final musicId = locamusic.musicId;

    if (musicId != null) {
      songDetails = await ref.watch(
        locamusicSongDetailsProvider(
          musicId: musicId,
        ).future,
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

@riverpod
Future<void> mapSetUserLocationRegion(
  MapSetUserLocationRegionRef ref, {
  required MapViewType mapViewType,
}) async {
  // 初期位置を取得してカメラズーム
  await ref.read(locationManagerProvider).requestLocation();
  final value =
      await ref.read(locationManagerDidUpdateLocationsProvider.future);

  await switch (mapViewType) {
    MapViewType.mapPage => ref.watch(mapPageMapViewProvider).setMapRegion(
          latitude: value.latitude,
          longitude: value.longitude,
          meters: DistanceRange.large.meters,
        ),
    MapViewType.locamusicDetailPage =>
      ref.watch(locamusicDetailPageMapViewProvider).setMapRegion(
            latitude: value.latitude,
            longitude: value.longitude,
            meters: DistanceRange.large.meters,
          ),
  };
}

/// Annotationを描画してカメラをズームする
@riverpod
void mapSetAnnotationRegion(
  MapSetAnnotationRegionRef ref, {
  required LocamusicWithDocumentId locamusic,
  required MapViewType mapViewType,
}) {
  ref.watch(
    mapDrawAnnotationsProvider(
      locamusics: [locamusic].toList(),
      mapViewType: mapViewType,
    ),
  );

  switch (mapViewType) {
    case MapViewType.mapPage:
      ref.watch(mapPageMapViewProvider).setMapRegion(
            latitude: locamusic.locamusic.geoPoint.latitude,
            longitude: locamusic.locamusic.geoPoint.longitude,
            // MKCircleが十分に表示されるように描画範囲を広げる
            meters: locamusic.locamusic.distance * 2.5,
          );
    case MapViewType.locamusicDetailPage:
      ref.watch(locamusicDetailPageMapViewProvider).setMapRegion(
            latitude: locamusic.locamusic.geoPoint.latitude,
            longitude: locamusic.locamusic.geoPoint.longitude,
            // MKCircleが十分に表示されるように描画範囲を広げる
            meters: locamusic.locamusic.distance * 2.5,
          );
  }
}
