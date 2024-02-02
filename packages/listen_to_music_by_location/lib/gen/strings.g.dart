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
	String get unset => '未設定';
	late final _StringsLocamusicJa locamusic = _StringsLocamusicJa._(_root);
	String get app_name => '場所で音楽';
	String get map => '地図';
	String get tap_to_set => 'タップして設定';
	String get error_dialog_title => 'エラー';
	String get error_dialog_message => '何らかのエラーが発生しました。もう一度お試しください';
	late final _StringsPermissionJa permission = _StringsPermissionJa._(_root);
}

// Path: locamusic
class _StringsLocamusicJa {
	_StringsLocamusicJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get create_limit_error => '範囲を作成できませんでした';
	String create_limit_error_message({required Object n}) => '${n}個まで作成できます';
	String get select_music => '曲を選択';
	String get change_music => '曲を変更';
	String get small => '小';
	String get medium => '中';
	String get large => '大';
	String get delete => '削除';
	String get delete_confirm => '削除しますか？';
	String get open_apple_music => 'Apple Music を開く';
	String get awaiting_music_share => '曲の共有を待っています';
	String get how_to_share_step_1 => 'お気に入りの曲を探して「・・・」をタップしてください';
	String get how_to_share_step_2 => '「曲を共有」をタップしてください';
	String get how_to_share_step_3 => '「場所で音楽」をタップして共有します';
	String get range_select_title => '音楽の再生を始める範囲';
	String get range_notice => '設定した範囲に入ってから数十秒後に音楽が再生されるので、広めに設定することをオススメします。';
	String get built_in_speaker_title => '内蔵スピーカー';
	String get built_in_speaker_notice => 'イヤホンやヘッドホンなどを使用していない場合でも、内臓スピーカーで音楽を再生することを許可します。';
	String get allow_play => '再生を許可';
	String get built_in_speaker_on_warning_title => '内臓スピーカーでの再生を許可します';
	String get built_in_speaker_on_warning_message => '周りの人に音楽が聞こえる可能性がありますので、ご注意ください。';
}

// Path: permission
class _StringsPermissionJa {
	_StringsPermissionJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '権限の確認';
	String get error_banner_label => '権限の確認が必要です';
	String get location => '位置情報';
	String get location_details => '現在位置を基にして音楽を再生するため、位置情報の使用を許可する必要があります';
	String get request_location_permission => '使用を許可する';
	String get request_authorized_when_in_use => '"アプリの使用中は許可"を選択してください';
	String get request_authorized_always => '"常に許可"に変更を選択してください';
	String get denied_location_permission => '位置情報が利用できません';
	String get denied_location_permission_message => '設定から位置情報の利用を許可してください';
	String get apple_music => 'Apple Music';
	String get apple_music_details => '音楽を再生するため、Apple Music へのアクセスを許可する必要があります';
	String get request_apple_music_permission => 'アクセスを許可する';
	String get denied_apple_music_permission => 'Apple Music にアクセスできません';
	String get denied_apple_music_permission_message => '設定から Apple Music へのアクセスを許可してください';
	String get settings => '設定';
	String get permission_ok => '許可されています';
}
