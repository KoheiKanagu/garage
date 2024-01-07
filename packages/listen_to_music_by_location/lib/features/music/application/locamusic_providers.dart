import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:listen_to_music_by_location/constants/collection_path.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locamusic_providers.g.dart';

@riverpod
CollectionReference<Locamusic> locamusicCollectionReference(
  LocamusicCollectionReferenceRef ref,
) =>
    ref
        .read(firebaseFirestoreProvider)
        .collection(CollectionPath.kLocamusics)
        .withConverter(
          fromFirestore: Locamusic.fromFirestore,
          toFirestore: Locamusic.toFirestore,
        );

@riverpod
Future<void> locamusicAdd(
  LocamusicAddRef ref, {
  required GeoPoint geoPoint,
  required DistanceRange distanceRange,
}) async {
  final uid = await ref.read(firebaseUserUidProvider.future);
  if (uid == null) {
    throw Exception('uid is null');
  }

  await ref.read(locamusicCollectionReferenceProvider).add(
        Locamusic(
          geoPoint: geoPoint,
          distance: distanceRange.meters,
          createdBy: uid,
        ),
      );
}
