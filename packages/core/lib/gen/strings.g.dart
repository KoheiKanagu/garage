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
	ja(languageCode: 'ja', build: Translations.build),
	en(languageCode: 'en', build: _StringsEn.build);

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
	late final _StringsServiceDownJa service_down = _StringsServiceDownJa._(_root);
	late final _StringsUpdateAppJa update_app = _StringsUpdateAppJa._(_root);
	late final _StringsFailedRunAppJa failed_run_app = _StringsFailedRunAppJa._(_root);
	late final _StringsConfigureJa configure = _StringsConfigureJa._(_root);
	late final _StringsFeedbackJa feedback = _StringsFeedbackJa._(_root);
	late final _StringsAuthJa auth = _StringsAuthJa._(_root);
	late final _StringsOnboardingJa onboarding = _StringsOnboardingJa._(_root);
	late final _StringsAdsJa ads = _StringsAdsJa._(_root);
	String get edit => '編集';
	String get add => '追加';
	String get done => '完了';
	String get cancel => 'キャンセル';
	String get save => '保存';
	String get delete => '削除';
	String get error_field_cannot_be_empty => 'この項目は必須です';
	String get copy => 'コピー';
	String get close => '閉じる';
	String get copied_to_clipboard => 'クリップボードにコピーしました';
	String get share => '共有';
}

// Path: service_down
class _StringsServiceDownJa {
	_StringsServiceDownJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'メンテナンス中';
	String get description => '現在サービスを停止してメンテナンス中です。しばらくしてから再度お試しください。';
	String get exit => 'アプリを終了';
}

// Path: update_app
class _StringsUpdateAppJa {
	_StringsUpdateAppJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'が新しくなりました。';
	String description({required Object storeName}) => '${storeName} で最新バージョンをダウンロードしましょう。';
	String get update => 'アップデート';
	String get skip => '後で';
}

// Path: failed_run_app
class _StringsFailedRunAppJa {
	_StringsFailedRunAppJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '予期せぬエラーが発生しました。';
	String get description => 'インターネットの接続をご確認の上、しばらく時間を置いてから再度お試しください。';
	String get exit => 'アプリを終了';
}

// Path: configure
class _StringsConfigureJa {
	_StringsConfigureJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '設定';
	String get feedback => 'ご意見・不具合の報告';
	String get about_this_app => 'このアプリについて';
	String get terms_of_service => '利用規約';
	String get privacy_policy => 'プライバシーポリシー';
	String get licenses => 'ライセンス';
	String get review_app => 'アプリを評価する';
	String get delete_all => 'すべてのデータを削除';
	String get delete_all_description => 'ユーザ情報が削除され、すべてのデータが閲覧できなくなります。この操作は取り消せません。削除してもよろしいですか？';
	String get delete_complete => 'ユーザ情報を削除しました';
	String get user_info => 'ユーザ情報';
	String get link_account => 'アカウントを接続';
	String get link_account_description => 'いずれかのアカウントを接続すると別のデバイスでも引き続きこれまでと同じデータが利用できます。';
	String get link_account_description2 => 'アカウントから取得した全ての情報はユーザ認証のためだけに使用され、他の目的に利用されることはありません。';
	String get unlink_account => 'アカウントの接続を解除';
	String get user_id => 'ユーザID';
	String get user_id_description => 'ユーザIDは自動的に生成された一意の識別子です。あなたのデータを他のユーザーから区別するために使用されます';
}

// Path: feedback
class _StringsFeedbackJa {
	_StringsFeedbackJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get do_not_enter_personal_info => '個人情報を含む内容は記入しないでください';
	String get input_email_if_reply_is_needed => '返信をご希望の場合はメールアドレスをご記入ください。ご報告の内容によってはお返事できない場合もございますので、あらかじめご了承ください。';
	String get email_address => 'メールアドレス';
	String get device_info => '端末の情報';
	String get device_info_collection_notice => '問題解決やアプリの改善に活用するため、ご利用の端末の情報が自動的に送信されます。個人を特定できる情報は含まれません。';
	String get os_version => 'OSとバージョン';
	String get model_name => 'モデル名';
	String get locale => '言語と地域';
	String get submit => '送信';
	String get confirm_sending_feedback => 'この内容で送信しますか？';
	String get thank_you_for_your_feedback => 'ご報告ありがとうございました';
	String get please_enter_your_feedback => 'ご報告内容をご記入ください';
	String get please_feedback => 'フィードバックにご協力ください';
	String get too_long => '文字数が多すぎます';
	String get feedback_type_header => 'どのようなご報告ですか？';
	late final _StringsFeedbackTypeJa type = _StringsFeedbackTypeJa._(_root);
	String get attach_screenshot => 'スクリーンショットを添付';
	String get screenshot => 'スクリーンショット';
	String get attach_screenshot_notice => '具体的にどの部分に関するご報告かお知らせいただけると、より迅速に対応できるため、アプリ画面のスクリーンショットを添付していただけると助かります。';
}

// Path: auth
class _StringsAuthJa {
	_StringsAuthJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get sigh_in_with_apple => 'Appleでサインイン';
	String get unlink_apple => 'Appleとの接続を解除';
	String get apple_id => 'Apple ID';
	String get sigh_in_with_google => 'Googleでサインイン';
	String get unlink_google => 'Googleとの接続を解除';
	String get google_account => 'Googleアカウント';
	String get sigh_in_with_github => 'GitHubでサインイン';
	String get unlink_github => 'GitHubとの接続を解除';
	String get github_account => 'GitHubアカウント';
	String unlink_confirm({required Object account}) => '${account}との接続を解除しますか？';
	String get unlink => '解除';
	String get sign_out => 'サインアウト';
	String get sign_out_description => 'サインアウトすると、アカウントを接続していない場合は現在利用中のデータにアクセスできなくなります。';
	String get sign_out_complete => 'サインアウトしました';
	String get exception => '予期せぬエラーが発生しました';
	String get exception_message => 'しばらく時間を置いてから再度お試しください。';
	String get credential_already_in_use_exception => 'アカウントを接続できません';
	String credential_already_in_use_exception_message({required Object providerName}) => 'この${providerName}はすでに他のユーザーに接続されています。他の${providerName}を使用してください。';
}

// Path: onboarding
class _StringsOnboardingJa {
	_StringsOnboardingJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get start => 'はじめる';
	String get social_account_sign_in => 'ソーシャルアカウントでサインイン';
	String get social_account_sign_in_description => 'このアプリにソーシャルアカウントを接続したことがある場合はこちらからサインインできます。';
	TextSpan ack_term({required InlineSpanBuilder termOfService, required InlineSpanBuilder privacyPolicy}) => TextSpan(children: [
		const TextSpan(text: '本アプリの利用開始をもって'),
		termOfService('利用規約'),
		const TextSpan(text: 'と'),
		privacyPolicy('プライバシーポリシー'),
		const TextSpan(text: 'に同意したものとみなされます。'),
	]);
	String get anonymous_start => 'サインインせずにはじめる';
	String get or => 'または';
}

// Path: ads
class _StringsAdsJa {
	_StringsAdsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get please_check_banner => '広告について確認のお願い';
	late final _StringsAdsRevokePersonalizedJa revoke_personalized = _StringsAdsRevokePersonalizedJa._(_root);
}

// Path: feedback.type
class _StringsFeedbackTypeJa {
	_StringsFeedbackTypeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get bug_report => '不具合について';
	String get feature_request => '機能追加について';
	String get impression => 'ご意見・ご感想について';
	String get other => 'その他';
}

// Path: ads.revoke_personalized
class _StringsAdsRevokePersonalizedJa {
	_StringsAdsRevokePersonalizedJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get request_label => 'パーソナライズド広告の同意を取り消す';
	String get title => 'パーソナライズド広告の同意を取り消しますか？';
	String get ok_label => '取り消す';
	String get did_revoke_title => 'パーソナライズド広告の同意を取り消しました';
}

// Path: <root>
class _StringsEn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsServiceDownEn service_down = _StringsServiceDownEn._(_root);
	@override late final _StringsUpdateAppEn update_app = _StringsUpdateAppEn._(_root);
	@override late final _StringsFailedRunAppEn failed_run_app = _StringsFailedRunAppEn._(_root);
	@override late final _StringsConfigureEn configure = _StringsConfigureEn._(_root);
	@override late final _StringsFeedbackEn feedback = _StringsFeedbackEn._(_root);
	@override late final _StringsAuthEn auth = _StringsAuthEn._(_root);
	@override late final _StringsOnboardingEn onboarding = _StringsOnboardingEn._(_root);
	@override late final _StringsAdsEn ads = _StringsAdsEn._(_root);
	@override String get edit => 'Edit';
	@override String get add => 'Add';
	@override String get done => 'Done';
	@override String get cancel => 'Cancel';
	@override String get save => 'Save';
	@override String get delete => 'Delete';
	@override String get error_field_cannot_be_empty => 'This field is required';
	@override String get copy => 'Copy';
	@override String get close => 'Close';
	@override String get copied_to_clipboard => 'Copied to clipboard';
	@override String get share => 'Share';
}

// Path: service_down
class _StringsServiceDownEn extends _StringsServiceDownJa {
	_StringsServiceDownEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Maintenance in Progress';
	@override String get description => 'The service is currently down for maintenance. Please try again later.';
	@override String get exit => 'Exit the app';
}

// Path: update_app
class _StringsUpdateAppEn extends _StringsUpdateAppJa {
	_StringsUpdateAppEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'has been updated.';
	@override String description({required Object storeName}) => 'Download the latest version from ${storeName}.';
	@override String get update => 'Update';
	@override String get skip => 'Later';
}

// Path: failed_run_app
class _StringsFailedRunAppEn extends _StringsFailedRunAppJa {
	_StringsFailedRunAppEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'An unexpected error occurred.';
	@override String get description => 'Please check your internet connection and try again after a while.';
	@override String get exit => 'Exit the app';
}

// Path: configure
class _StringsConfigureEn extends _StringsConfigureJa {
	_StringsConfigureEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
	@override String get feedback => 'Feedback';
	@override String get about_this_app => 'About This App';
	@override String get terms_of_service => 'Terms of Service';
	@override String get privacy_policy => 'Privacy Policy';
	@override String get licenses => 'Licenses';
	@override String get review_app => 'Review App';
	@override String get delete_all => 'Delete All Data';
	@override String get delete_all_description => 'User information will be deleted and all data will be inaccessible. This operation cannot be undone. Are you sure you want to delete?';
	@override String get delete_complete => 'User information has been deleted';
	@override String get user_info => 'User Information';
	@override String get link_account => 'Link Account';
	@override String get link_account_description => 'By linking an account, you can access the same data on other devices.';
	@override String get link_account_description2 => 'All information obtained from the account will only be used for user authentication and will not be used for any other purpose.';
	@override String get unlink_account => 'Unlink Account';
	@override String get user_id => 'User ID';
	@override String get user_id_description => 'The user ID is a automatically generated unique identifier used to distinguish your data from other users.';
}

// Path: feedback
class _StringsFeedbackEn extends _StringsFeedbackJa {
	_StringsFeedbackEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get do_not_enter_personal_info => 'Do not enter personal information';
	@override String get input_email_if_reply_is_needed => 'If you require a reply, please provide your email address. Please note that we may not be able to respond depending on the content of your report.';
	@override String get email_address => 'Email Address';
	@override String get device_info => 'Device Information';
	@override String get device_info_collection_notice => 'To resolve issues and improve the app, information about your device will be automatically sent. No personally identifiable information will be included.';
	@override String get os_version => 'OS and Version';
	@override String get model_name => 'Model Name';
	@override String get locale => 'Language and Region';
	@override String get submit => 'Submit';
	@override String get confirm_sending_feedback => 'Send with this content?';
	@override String get thank_you_for_your_feedback => 'Thank you for your report';
	@override String get please_enter_your_feedback => 'Please enter your report';
	@override String get please_feedback => 'Please provide feedback';
	@override String get too_long => 'Too many characters';
	@override String get feedback_type_header => 'What type of report is this?';
	@override late final _StringsFeedbackTypeEn type = _StringsFeedbackTypeEn._(_root);
	@override String get attach_screenshot => 'Attach screenshot';
	@override String get screenshot => 'Screenshot';
	@override String get attach_screenshot_notice => 'If you can let us know specifically which part of the report is about, we can respond more quickly. It would be helpful if you could attach a screenshot of the app screen.';
}

// Path: auth
class _StringsAuthEn extends _StringsAuthJa {
	_StringsAuthEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get sigh_in_with_apple => 'Sign in with Apple';
	@override String get unlink_apple => 'Unlink Apple';
	@override String get apple_id => 'Apple ID';
	@override String get sigh_in_with_google => 'Sign in with Google';
	@override String get unlink_google => 'Unlink Google';
	@override String get google_account => 'Google Account';
	@override String get sigh_in_with_github => 'Sign in with GitHub';
	@override String get unlink_github => 'Unlink GitHub';
	@override String get github_account => 'GitHub Account';
	@override String unlink_confirm({required Object account}) => 'Unlink ${account}?';
	@override String get unlink => 'Unlink';
	@override String get sign_out => 'Sign out';
	@override String get sign_out_description => 'When you sign out, you will no longer have access to the data you are currently using unless you are connected to an account.';
	@override String get sign_out_complete => 'Signed out successfully';
	@override String get exception => 'An unexpected error occurred';
	@override String get exception_message => 'Please try again after a while.';
	@override String get credential_already_in_use_exception => 'Account already in use';
	@override String credential_already_in_use_exception_message({required Object providerName}) => 'This ${providerName} is already connected to another user. Please use a different ${providerName}.';
}

// Path: onboarding
class _StringsOnboardingEn extends _StringsOnboardingJa {
	_StringsOnboardingEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get start => 'Start';
	@override String get social_account_sign_in => 'Sign in with Social Account';
	@override String get social_account_sign_in_description => 'If you have linked a social account to this app, you can sign in from here.';
	@override TextSpan ack_term({required InlineSpanBuilder termOfService, required InlineSpanBuilder privacyPolicy}) => TextSpan(children: [
		const TextSpan(text: 'By starting to use this app, you are deemed to have agreed to the '),
		termOfService('Terms of Service'),
		const TextSpan(text: ' and '),
		privacyPolicy('Privacy Policy'),
		const TextSpan(text: '.'),
	]);
	@override String get anonymous_start => 'Start without signing in';
	@override String get or => 'Or';
}

// Path: ads
class _StringsAdsEn extends _StringsAdsJa {
	_StringsAdsEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get please_check_banner => 'Please check about the ads';
	@override late final _StringsAdsRevokePersonalizedEn revoke_personalized = _StringsAdsRevokePersonalizedEn._(_root);
}

// Path: feedback.type
class _StringsFeedbackTypeEn extends _StringsFeedbackTypeJa {
	_StringsFeedbackTypeEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get bug_report => 'Bug Report';
	@override String get feature_request => 'Feature Request';
	@override String get impression => 'Opinion';
	@override String get other => 'Other';
}

// Path: ads.revoke_personalized
class _StringsAdsRevokePersonalizedEn extends _StringsAdsRevokePersonalizedJa {
	_StringsAdsRevokePersonalizedEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get request_label => 'Revoke consent for personalized ads';
	@override String get title => 'Do you want to revoke consent for personalized ads?';
	@override String get ok_label => 'Revoke';
	@override String get did_revoke_title => 'Consent for personalized ads has been revoked';
}
