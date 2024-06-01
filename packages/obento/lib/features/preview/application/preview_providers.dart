import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preview_providers.g.dart';

@riverpod
Future<String> hashtagPreview(
  HashtagPreviewRef ref,
) async {
  await ref.watch(hashtagsSelectedControllerProvider.notifier).cleanup();

  final selected = ref.watch(hashtagsSelectedControllerProvider);

  final value = await ref.watch(
    hashtagControllerProvider.selectAsync(
      (e) => e.hashtag.hashtags,
    ),
  );

  return value.where(selected.contains).join('\n');
}
