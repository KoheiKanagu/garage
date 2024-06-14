import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:obento/features/hashtag/domain/hashtag_db.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hashtag_search_providers.g.dart';

@riverpod
Future<Isar> isar(
  IsarRef ref,
) async =>
    Isar.openSync(
      [HashtagDbSchema],
      directory: await getApplicationDocumentsDirectory().then((v) => v.path),
    );

@riverpod
Future<IsarCollection<HashtagDb>> isarHashtagDb(
  IsarHashtagDbRef ref,
) async {
  final instance = Isar.getInstance();

  // if the instance is already open, use it
  if (instance?.isOpen ?? false) {
    return instance!.hashtagDbs;
  }

  return ref.watch(
    isarProvider.selectAsync(
      (e) => e.hashtagDbs,
    ),
  );
}

@riverpod
TextEditingController hashtagSearchTextEditingController(
  HashtagSearchTextEditingControllerRef ref,
) =>
    TextEditingController();

@riverpod
class HashtagSearchText extends _$HashtagSearchText {
  @override
  String? build() {
    final controller = ref.watch(hashtagSearchTextEditingControllerProvider);

    void onChange() {
      state = controller.text;
    }

    controller.addListener(onChange);

    ref.onDispose(() {
      controller.removeListener(onChange);
    });

    return null;
  }
}

@riverpod
Future<List<String>?> hashtagSearchResults(
  HashtagSearchResultsRef ref,
) async {
  final searchText = ref.watch(hashtagSearchTextProvider)?.trim() ?? '';
  if (searchText.isEmpty) {
    return null;
  }

  final db = await ref.watch(isarHashtagDbProvider.future);
  return db
      .filter()
      .wordsElementContains(searchText)
      .findAllSync()
      .map((e) => e.content)
      .toList();
}
