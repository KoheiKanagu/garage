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
  required MyMapViewType myMapViewType,
}) async {
  // 既存のAnnotationを削除
  await switch (myMapViewType) {
    MyMapViewType.mapPage =>
      ref.watch(mapPageMapViewProvider).removeAnnotations(
            await ref.watch(mapPageMapViewProvider).getAnnotations(),
          ),
    MyMapViewType.locamusicDetailPage => ref
        .watch(locamusicDetailPageMapViewProvider)
        .removeAnnotations(
          await ref.watch(locamusicDetailPageMapViewProvider).getAnnotations(),
        ),
  };

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

    await switch (myMapViewType) {
      MyMapViewType.mapPage =>
        ref.read(mapPageMapViewProvider).addAnnotations(annotations),
      MyMapViewType.locamusicDetailPage => ref
          .read(locamusicDetailPageMapViewProvider)
          .addAnnotations(annotations),
    };
  }
}

/// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
/// Annotationが存在しないなら現在地にズームする
@riverpod
Future<void> mapAdjustCamera(
  MapAdjustCameraRef ref, {
  required List<LocamusicWithDocumentId> locamusics,
  required MyMapViewType myMapViewType,
}) async {
  if (locamusics.isEmpty) {
    // 初期位置を取得してカメラズーム
    await ref.read(locationManagerProvider).requestLocation();
    final value =
        await ref.read(locationManagerDidUpdateLocationsProvider.future);

    await switch (myMapViewType) {
      MyMapViewType.mapPage => ref.watch(mapPageMapViewProvider).setMapRegion(
            latitude: value.latitude,
            longitude: value.longitude,
            meters: DistanceRange.large.meters,
          ),
      MyMapViewType.locamusicDetailPage =>
        ref.watch(locamusicDetailPageMapViewProvider).setMapRegion(
              latitude: value.latitude,
              longitude: value.longitude,
              meters: DistanceRange.large.meters,
            ),
    };
    return;
  }

  // Annotationsの用意ができたら表示
  await ref.watch(
    mapDrawAnnotationsProvider(
      locamusics: locamusics,
      myMapViewType: myMapViewType,
    ).future,
  );
  await switch (myMapViewType) {
    MyMapViewType.mapPage =>
      ref.watch(mapPageMapViewProvider).showAnnotations(),
    MyMapViewType.locamusicDetailPage =>
      ref.watch(locamusicDetailPageMapViewProvider).showAnnotations(),
  };
}

/// Annotationを描画してカメラをズームする
@riverpod
Future<void> mapSetAnnotationRegion(
  MapSetAnnotationRegionRef ref, {
  required LocamusicWithDocumentId locamusic,
  required MyMapViewType myMapViewType,
}) async {
  await ref.watch(
    mapDrawAnnotationsProvider(
      locamusics: [locamusic].toList(),
      myMapViewType: myMapViewType,
    ).future,
  );

  await switch (myMapViewType) {
    MyMapViewType.mapPage => ref.watch(mapPageMapViewProvider).setMapRegion(
          latitude: locamusic.locamusic.geoPoint.latitude,
          longitude: locamusic.locamusic.geoPoint.longitude,
          meters: locamusic.locamusic.distance * 2.5,
        ),
    MyMapViewType.locamusicDetailPage =>
      ref.watch(locamusicDetailPageMapViewProvider).setMapRegion(
            latitude: locamusic.locamusic.geoPoint.latitude,
            longitude: locamusic.locamusic.geoPoint.longitude,
            meters: locamusic.locamusic.distance * 2.5,
          ),
  };
}
