import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
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
  final existAnnotations = await switch (myMapViewType) {
    MyMapViewType.interactive =>
      ref.watch(myMapHostApiProvider).getAnnotations(),
    MyMapViewType.nonInteractive =>
      ref.watch(myNonInteractiveMapHostApiProvider).getAnnotations(),
  };
  await switch (myMapViewType) {
    MyMapViewType.interactive =>
      ref.watch(myMapHostApiProvider).removeAnnotations(existAnnotations),
    MyMapViewType.nonInteractive => ref
        .watch(myNonInteractiveMapHostApiProvider)
        .removeAnnotations(existAnnotations),
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
      MyMapViewType.interactive =>
        ref.read(myMapHostApiProvider).addAnnotations(annotations),
      MyMapViewType.nonInteractive => ref
          .read(myNonInteractiveMapHostApiProvider)
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
    await ref.read(myLocationHostApiProvider).requestLocation();
    final value = await ref.read(myFlutterApiDidUpdateLocationsProvider.future);
    await ref.read(myMapHostApiProvider).setMapRegion(
          latitude: value.latitude,
          longitude: value.longitude,
          meters: DistanceRange.large.meters,
        );
    return;
  }

  // Annotationsの用意ができたら表示
  await ref.watch(
    mapDrawAnnotationsProvider(
      locamusics: locamusics,
      myMapViewType: myMapViewType,
    ).future,
  );
  await ref.watch(myMapHostApiProvider).showAnnotations();
}
