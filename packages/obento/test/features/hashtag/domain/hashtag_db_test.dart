import 'package:obento/features/hashtag/domain/hashtag_db.dart';
import 'package:test/test.dart';

void main() {
  test(
    'transformHiraganaKatakana',
    () {
      // Convert hiragana to katakana
      expect(
        transformHiraganaKatakana(
          'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん',
        ),
        'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン',
      );

      // Convert katakana to hiragana
      expect(
        transformHiraganaKatakana(
          'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン',
        ),
        'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん',
      );

      // Other characters are not converted
      expect(
        transformHiraganaKatakana('1234567890 漢字 english'),
        '1234567890 漢字 english',
      );
    },
  );
}
