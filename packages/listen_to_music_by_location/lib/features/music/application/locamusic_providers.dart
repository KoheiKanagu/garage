import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
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
  LocamusicDocumentRef ref,
  String documentId,
) =>
    ref
        .watch(locamusicCollectionReferenceProvider)
        .doc(documentId)
        .snapshots()
        .where((event) => event.data() != null)
        .map((event) => event.data()!);

@riverpod
Future<SongDetails> locamusicSongDetails(
  LocamusicSongDetailsRef ref,
  String musicId,
) =>
    ref.watch(musicKitProvider).songDetails(musicId);

/// [CollectionPath.kLocamusics]に[Locamusic]を追加する
///
/// 追加に成功した場合はDocumentIdを返す
@riverpod
Future<String> locamusicAdd(
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
    return ref
        .watch(locamusicCollectionReferenceProvider)
        .add(
          Locamusic(
            geoPoint: geoPoint,
            distance: distanceRange.meters,
            createdBy: uid,
          ),
        )
        .then((value) => value.id);
  } else {
    throw LocamusicCreationLimitException();
  }
}

@riverpod
Future<void> locamusicUpdate(
  LocamusicUpdateRef ref,
  String documentId, {
  required Locamusic locamusic,
}) async {
  await ref.watch(locamusicCollectionReferenceProvider).doc(documentId).set(
        locamusic,
        SetOptions(merge: true),
      );
}

@riverpod
Future<void> locamusicDelete(
  LocamusicDeleteRef ref,
  String documentId,
) {
  return ref.watch(locamusicCollectionReferenceProvider).doc(documentId).update(
    {
      'updatedAt': FieldValue.serverTimestamp(),
      'deleted': true,
    },
  );
}

/// Locamusicのドキュメントの変更を監視し、Regionを登録する
@riverpod
Future<void> locamusicRegionRegister(
  LocamusicRegionRegisterRef ref,
) async {
  final docs = await ref.watch(locamusicDocumentsProvider.future);

  // updatedAtはFieldValue.serverTimestampなので、一旦nullになるがすぐに更新されるため、
  // 無駄にRegionを登録しないように、いずれかのupdatedAtがnullの場合はスキップする
  final isUpdatedAtNull = docs.any(
    (element) =>
        element.locamusic.updatedAt == null ||
        element.locamusic.createdAt == null,
  );
  if (isUpdatedAtNull) {
    logger.dProvider(
      'locamusicRegionRegister',
      'any updatedAt is null. skip register region.',
    );
    return;
  }

  logger.dProvider(
    'locamusicRegionRegister',
    'updated locamusic ${docs.map((e) => e.documentId)}',
  );

  // 既存のRegionを全て削除
  final monitoredRegions =
      (await ref.watch(locationManagerProvider).monitoredRegions())
          .whereNotNull();
  logger.dProvider(
    'locamusicRegionRegister',
    'will stop regions ${monitoredRegions.map((e) => e.identifier)}',
  );
  await Future.wait(
    monitoredRegions.map(
      ref.watch(locationManagerProvider).stopMonitoring,
    ),
  );

  // Regionを新しく登録
  final regions = docs.map(
    (e) => Region(
      identifier: e.documentId,
      latitude: e.locamusic.geoPoint.latitude,
      longitude: e.locamusic.geoPoint.longitude,
      radius: e.locamusic.distance,
    ),
  );
  logger.dProvider(
    'locamusicRegionRegister',
    'will start regions: ${regions.map((e) => e.identifier)}',
  );
  await Future.wait(
    regions.map(
      ref.watch(locationManagerProvider).startMonitoring,
    ),
  );
}
