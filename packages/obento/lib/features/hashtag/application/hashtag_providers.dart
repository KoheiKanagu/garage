import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:obento/constants/collection_path.dart';
import 'package:obento/features/hashtag/domain/hashtag.dart';
import 'package:obento/gen/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hashtag_providers.g.dart';

@riverpod
CollectionReference<Hashtag> hashtagsCollectionReference(
  HashtagsCollectionReferenceRef ref,
) =>
    ref
        .watch(firebaseFirestoreProvider)
        .collection(CollectionPath.kHashtags)
        .withConverter(
          fromFirestore: Hashtag.fromFirestore,
          toFirestore: Hashtag.toFirestore,
        );

@riverpod
Stream<DocumentSnapshot<Hashtag>> hashtagsDocumentSnapshot(
  HashtagsDocumentSnapshotRef ref,
) async* {
  final uid = await ref.watch(firebaseUserUidProvider.future);
  yield* ref.watch(hashtagsCollectionReferenceProvider).doc(uid).snapshots();
}

@riverpod
class HashtagController extends _$HashtagController {
  @override
  Future<Hashtag> build() async {
    final snapshot = await ref.watch(hashtagsDocumentSnapshotProvider.future);

    final data = snapshot.data();
    if (data != null) {
      return data;
    }

    return Hashtag(
      hashtags: [
        // default tag
        i18n.app_name,
      ],
    );
  }

  Future<void> updateTags(List<String> tags) async {
    final value = state.value;
    if (value == null) {
      logger.warning('HashtagController.update: state.value is null');
      return;
    }

    final data = await ref.watch(hashtagsDocumentSnapshotProvider.future);

    await data.reference.set(
      value.copyWith(
        hashtags: tags,
      ),
      SetOptions(
        merge: true,
      ),
    );
  }
}
