import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as code_i18n;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/constants/firebase_options_dev.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/features/hashtag/domain/hashtag.dart';
import 'package:obento/gen/strings.g.dart';
import 'package:obento/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/test/core.dart';

Future<void> main() async {
  kTenantId = 'obento-44oe4';
  kAppStoreId = '6499041461';
  kBannerAdUnitId = '';
  const locale = code_i18n.AppLocale.en;

  // i18nのlocaleの初期化は[initialize()]だが、待てないのでここで初期化
  WidgetsFlutterBinding.ensureInitialized();

  code_i18n.LocaleSettings.setLocale(locale);

  final tags = switch (LocaleSettings.currentLocale) {
    AppLocale.ja => [
        i18n.app_name,
        '#キャラ弁',
        '卵焼き',
        'ハンバーグ',
        'ソーセージ',
        'ひじきと大豆の煮物',
        'トマト',
        'からあげ',
        'エビシューマイ',
        'ブロッコリー',
        'ちくわ',
        'メンチカツ',
        'えびとチーズのグラタン',
        'ご飯',
      ],
    _ => [
        i18n.app_name,
        '#Kyaraben',
        'Tamagoyaki',
        'Hamburger',
        'Sausage',
        'Simmered hijiki and soybeans',
        'Tomato',
        'Fried chicken',
        'Shumai with shrimp',
        'Broccoli',
        'Chikuwa',
        'Menchi katsu',
        'Shrimp and cheese gratin',
        'Rice',
      ],
  };

  SharedPreferences.setMockInitialValues(
    {
      HashtagsSelectedController.kSelectedHashtags: [
        tags[0],
        tags[1],
        tags[2],
        tags[3],
        tags[5],
        tags[6],
        tags[8],
        tags[9],
        tags[10],
        tags[13],
      ],
    },
  );
  final sharedPreference = await SharedPreferences.getInstance();

  final container = await initialize(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    useLocale: locale,
    overrides: [
      hashtagProvider.overrideWith(
        (ref) => Future.value(
          (
            hashtag: Hashtag(
              hashtags: tags,
            ),
            reference: MockDocumentReference<Hashtag>(),
          ),
        ),
      ),
      sharedPreferencesInstanceProvider.overrideWithValue(sharedPreference),
    ],
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersive,
  );

  if (container != null) {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: MyApp(
          targetPlatform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
        ),
      ),
    );
  }
}
