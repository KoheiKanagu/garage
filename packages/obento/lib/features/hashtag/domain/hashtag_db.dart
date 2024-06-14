import 'package:isar/isar.dart';
import 'package:obento/features/hashtag/domain/hashtag.dart';

part 'hashtag_db.g.dart';

@collection
class HashtagDb {
  const HashtagDb({
    required this.content,
    required this.words,
  });

  Id get id => Isar.autoIncrement;

  final String content;

  // 検索対象の文字列
  @Index()
  final List<String> words;

  static List<HashtagDb> fromHashtag(Hashtag hashtag) {
    return hashtag.hashtags.map(
      (content) {
        return HashtagDb(
          content: content,
          words: [
            content,
            transformHiraganaKatakana(content),
          ],
        );
      },
    ).toList();
  }
}

String transformHiraganaKatakana(String input) {
  const hiraganaStart = 0x3041;
  const hiraganaEnd = 0x3096;

  const katakanaStart = 0x30A1;
  const katakanaEnd = 0x30F6;

  const conversionOffset = katakanaStart - hiraganaStart;

  return input.split('').map(
    (char) {
      final codeUnit = char.codeUnitAt(0);
      if (codeUnit >= hiraganaStart && codeUnit <= hiraganaEnd) {
        // ひらがなからカタカナへ
        return String.fromCharCode(codeUnit + conversionOffset);
      } else if (codeUnit >= katakanaStart && codeUnit <= katakanaEnd) {
        // カタカナからひらがなへ
        return String.fromCharCode(codeUnit - conversionOffset);
      }
      return char; // その他の文字はそのまま
    },
  ).join();
}
