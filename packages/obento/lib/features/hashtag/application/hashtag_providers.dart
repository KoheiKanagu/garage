import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as core_i18n;
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
Future<
    ({
      Hashtag hashtag,
      DocumentReference<Hashtag> reference,
    })> hashtag(
  HashtagRef ref,
) async {
  final snapshot = await ref.watch(hashtagsDocumentSnapshotProvider.future);

  final data = snapshot.data() ??
      Hashtag(
        hashtags: [
          // default tag
          i18n.app_name,
        ],
      );

  return (
    hashtag: data,
    reference: snapshot.reference,
  );
}

@riverpod
class HashtagsEditController extends _$HashtagsEditController {
  @override
  Hashtag? build() {
    return null;
  }

  Future<void> edit() async {
    state = await ref.watch(
      hashtagProvider.selectAsync(
        (e) => e.hashtag,
      ),
    );
  }

  void cancel() {
    state = null;
  }

  void swap(int oldIndex, int newIndex) {
    final newHashtags = state?.hashtags.toList();
    if (newHashtags == null) {
      return;
    }

    newHashtags.insert(
      oldIndex < newIndex ? newIndex - 1 : newIndex,
      newHashtags.removeAt(oldIndex),
    );

    set(newHashtags);
  }

  void delete(int index) {
    final newHashtags = state?.hashtags.toList();
    if (newHashtags == null) {
      return;
    }

    newHashtags.removeAt(index);

    set(newHashtags);
  }

  void add(String tag) {
    set([
      ...state?.hashtags ?? [],
      tag,
    ]);
  }

  void set(List<String> tags) {
    state = state?.copyWith(
      hashtags: tags
          .map(
            (e) => e.trim(),
          )
          .where(
            (e) => e.isNotEmpty,
          )
          .toList(),
    );
  }

  String? validate(String? value) {
    final trimmed = value?.trim();

    final isEmpty = trimmed?.isEmpty ?? true;
    if (isEmpty) {
      return core_i18n.i18n.error_field_cannot_be_empty;
    }

    final current = state?.hashtags ?? [];
    if (current.contains(trimmed)) {
      return i18n.error_tag_already_exists;
    }

    return null;
  }

  Future<void> save() async {
    if (state == null) {
      return;
    }

    final reference = await ref.watch(
      hashtagProvider.selectAsync(
        (e) => e.reference,
      ),
    );

    await reference.set(
      state!,
      SetOptions(
        merge: true,
      ),
    );

    state = null;
  }
}

@riverpod
class HashtagsSelectedController extends _$HashtagsSelectedController {
  static const String kSelectedHashtags = 'selected_hashtags';

  @override
  Set<String> build() {
    final list = ref
        .watch(sharedPreferencesControllerProvider)
        .getStringList(kSelectedHashtags);

    return list?.toSet() ?? {};
  }

  void toggle(String tag) {
    if (state.contains(tag)) {
      state = state..remove(tag);
    } else {
      state = state..add(tag);
    }

    ref.notifyListeners();

    ref.watch(sharedPreferencesControllerProvider).setStringList(
          kSelectedHashtags,
          state.toList(),
        );
  }
}
