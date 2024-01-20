import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:listen_to_music_by_location/constants/collection_path.dart';
import 'package:listen_to_music_by_location/exceptions/locamusic_creation_limit_exception.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locamusic_providers.g.dart';

// 一度に作成できるLocamusicの最大数
// TODO
const int kMaxCreateLocamusicCount = 500;

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
Future<Query<Locamusic>> locamusicQuery(
  LocamusicQueryRef ref,
) async {
  final uid = await ref.watch(firebaseUserUidProvider.future);
  if (uid == null) {
    throw Exception('uid is null');
  }

  return ref
      .watch(locamusicCollectionReferenceProvider)
      .where('createdBy', isEqualTo: uid)
      .where('deleted', isEqualTo: false)
      .orderBy('createdAt', descending: true);
}

@riverpod
Stream<List<LocamusicWithDocumentId>> locamusicDocuments(
  LocamusicDocumentsRef ref,
) async* {
  final query = await ref.watch(locamusicQueryProvider.future);
  logger.d('locamusicQueryProvider: ${query.parameters}');
  yield* query.snapshots().map(
        (event) => event.docs
            .map(
              (e) => (
                documentId: e.id,
                locamusic: e.data(),
              ),
            )
            .toList(),
      );
}

@riverpod
Stream<Locamusic> locamusicDocument(
  LocamusicDocumentRef ref, {
  required String documentId,
}) =>
    ref
        .watch(locamusicCollectionReferenceProvider)
        .doc(documentId)
        .snapshots()
        .where((event) => event.data() != null)
        .map((event) => event.data()!);

@riverpod
Future<SongDetails> locamusicSongDetails(
  LocamusicSongDetailsRef ref, {
  required String musicId,
}) =>
    ref.watch(myMusicHostApiProvider).songDetails(id: musicId);

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

  final query = await ref.watch(locamusicQueryProvider.future);
  final agg = await query.count().get();
  if (agg.count < kMaxCreateLocamusicCount) {
    await ref.watch(locamusicCollectionReferenceProvider).add(
          Locamusic(
            geoPoint: geoPoint,
            distance: distanceRange.meters,
            createdBy: uid,
          ),
        );
  } else {
    throw LocamusicCreationLimitException();
  }
}

@riverpod
Future<void> locamusicUpdate(
  LocamusicUpdateRef ref, {
  required String documentId,
  required Locamusic locamusic,
}) async {
  await ref.watch(locamusicCollectionReferenceProvider).doc(documentId).set(
        locamusic,
        SetOptions(merge: true),
      );
}

@riverpod
Future<void> locamusicDelete(
  LocamusicDeleteRef ref, {
  required String documentId,
}) {
  return ref.watch(locamusicCollectionReferenceProvider).doc(documentId).update(
    {
      'updatedAt': FieldValue.serverTimestamp(),
      'deleted': true,
    },
  );
}
