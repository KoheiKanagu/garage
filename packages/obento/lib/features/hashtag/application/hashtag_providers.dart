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

  void updateTags(List<String> tags) {
    state = state.whenData(
      (e) => e.copyWith(hashtags: tags),
    );
  }

  Future<void> commit() async {
    final value = state.value;
    if (value == null) {
      logger.warning('HashtagController.commit: state.value is null');
      return;
    }

    final data = await ref.watch(hashtagsDocumentSnapshotProvider.future);

    await data.reference.set(
      value,
      SetOptions(
        merge: true,
      ),
    );
  }
}

@riverpod
class HashtagsEditController extends _$HashtagsEditController {
  @override
  bool build() {
    return false;
  }

  void cancel() {
    state = false;

    ref.invalidate(hashtagControllerProvider);
  }

  void edit() {
    state = true;
  }

  void save() {
    ref.watch(hashtagControllerProvider.notifier).commit();

    state = false;
  }

  void updateTags(List<String> tags) {
    ref.watch(hashtagControllerProvider.notifier).updateTags(tags);
  }
}
