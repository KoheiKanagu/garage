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
const int kMaxCreateLocamusicCount = 5;

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
      .where('deleted', isEqualTo: false);
}

@riverpod
Stream<QuerySnapshot<Locamusic>> locamusicQuerySnapshot(
  LocamusicQuerySnapshotRef ref,
) async* {
  final query = await ref.watch(locamusicQueryProvider.future);
  yield* query.snapshots();
}

@riverpod
Future<
    List<
        ({
          String documentId,
          Locamusic locamusic,
          SongDetails? songDetails,
        })>> locamusicWithSongDetails(
  LocamusicWithSongDetailsRef ref,
) async {
  final snapshot = await ref.watch(locamusicQuerySnapshotProvider.future);

  return Future.wait(
    // 音楽の情報取得が全て完了するまで待つことになる
    snapshot.docs.map(
      (e) async {
        final documentId = e.id;

        final locamusic = e.data();
        final musicId = locamusic.musicId;

        SongDetails? songDetails;

        // 音楽が設定されている場合は詳細を取得
        if (musicId != null) {
          songDetails = await ref.read(myMusicHostApiProvider).songDetails(
                id: musicId,
              );
        }

        // 音楽未設定の場合はsongDetailsはnullで、Futureもすぐに返る
        return (
          documentId: documentId,
          locamusic: locamusic,
          songDetails: songDetails,
        );
      },
    ),
  );
}

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
  if (agg.count <= 5) {
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
