import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_providers.g.dart';

@riverpod
void mapOnLongPressed(
  MapOnLongPressedRef ref, {
  required double latitude,
  required double longitude,
}) {
  ref.read(
    locamusicAddProvider(
      geoPoint: GeoPoint(latitude, longitude),
      distanceRange: DistanceRange.medium,
    ),
  );
}

@riverpod
Future<void> mapOnTapCircle(
  MapOnTapCircleRef ref, {
  required String identifier,
}) async {}

@riverpod
Future<void> mapDrawAnnotations(
  MapDrawAnnotationsRef ref,
) async {
  final values = await ref.watch(locamusicWithSongDetailsProvider.future);

  // 既存のアノテーションを削除
  final existAnnotations =
      await ref.watch(myMapHostApiProvider).getAnnotations();
  await ref.watch(myMapHostApiProvider).removeAnnotations(
        existAnnotations,
      );

  // 新しいアノテーションを追加
  final annotations = values
      .map(
        (e) => CircleAnnotation(
          identifier: e.documentId,
          latitude: e.locamusic.geoPoint.latitude,
          longitude: e.locamusic.geoPoint.longitude,
          title: e.songDetails?.title ?? i18n.unset,
          circleDistance: e.locamusic.distance,
        ),
      )
      .toList();
  await ref.read(myMapHostApiProvider).addAnnotations(annotations);
}

/// Annotationが存在するなら全てのAnnotationが表示できるようにズームする
/// Annotationが存在しないなら現在地にズームする
@riverpod
Future<void> mapAdjustCamera(
  MapAdjustCameraRef ref,
) async {
  final isEmptyAnnotations = await ref
      .watch(locamusicQuerySnapshotProvider.future)
      .then((value) => value.docs.isEmpty);
  if (isEmptyAnnotations) {
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
  await ref.watch(mapDrawAnnotationsProvider.future);
  await ref.watch(myMapHostApiProvider).showAnnotations();
}
