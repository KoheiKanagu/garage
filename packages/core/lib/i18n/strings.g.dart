/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ja;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ja(languageCode: 'ja', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of i18n).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = i18n.someKey.anotherKey;
Translations get i18n => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final i18n = Translations.of(context); // Get i18n variable.
/// String a = i18n.someKey.anotherKey; // Use i18n variable.
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.i18n.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get i18n => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final i18n = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	// Translations

	/// コメント
	String hello({required Object name}) => 'こんにちは ${name}';

	late final _StringsConfigureJa configure = _StringsConfigureJa._(_root);
	late final _StringsFeedbackJa feedback = _StringsFeedbackJa._(_root);
}

// Path: configure
class _StringsConfigureJa {
	_StringsConfigureJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '設定';
	String get feedback => 'フィードバックを送る';
	String get about_this_app => 'このアプリについて';
	String get terms_of_service => '利用規約';
	String get privacy_policy => 'プライバシーポリシー';
	String get license => 'ライセンス';
	String get review_app => 'アプリを評価する';
	String get delete_all => 'すべてのデータを削除';
	String get delete_all_description => 'ユーザ情報が削除され、すべてのデータが閲覧できなくなります。この操作は取り消せません。削除してもよろしいですか？';
	String get delete_complete => 'ユーザ情報を削除しました';
}

// Path: feedback
class _StringsFeedbackJa {
	_StringsFeedbackJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get do_not_enter_personal_info => '個人情報を含む内容は記入しないでください';
	String get input_email_if_reply_is_needed => '返信をご希望の場合はメールアドレスをご記入ください';
	String get input_email_if_reply_is_needed2 => 'なお、お問い合わせ内容によってはお返事できない場合もございますので、あらかじめご了承ください';
	String get email_address => 'メールアドレス';
	String get device_info_collection_notice => '問題解決やアプリの改善に活用するため、ご利用の端末の情報が自動的に送信されます';
	String get os_version => 'OSとバージョン';
	String get model_name => 'モデル名';
	String get locale => '言語と地域';
	String get submit => '送信';
	String get confirm_sending_feedback => 'フィードバックを送信しますか？';
	String get thank_you_for_your_feedback => 'ご意見ありがとうございました';
	String get please_enter_your_feedback => 'ご意見をご記入ください';
	String get please_feedback => 'フィードバックにご協力ください';
}