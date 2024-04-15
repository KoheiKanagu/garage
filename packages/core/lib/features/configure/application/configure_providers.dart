import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'configure_providers.g.dart';

/// アップデートが必須なバージョンコード
@riverpod
Future<int> configureRequiredVersionCode(
  ConfigureRequiredVersionCodeRef ref,
) =>
    ref.watch(
      remoteConfigGetIntValueProvider(
        key: RemoteConfigConstant.kRequirementVersionCode,
        defaultValue: RemoteConfigConstant.kRequirementVersionCodeDefaultValue,
      ).future,
    );

/// 利用規約のURI
@riverpod
Future<Uri?> configureTermsOfServiceUri(
  ConfigureTermsOfServiceUriRef ref,
) =>
    ref.watch(
      remoteConfigGetStringValueProvider(
        key: RemoteConfigConstant.kTermsOfServiceUri,
        defaultValue: RemoteConfigConstant.kTermsOfServiceUriDefaultValue,
      ).selectAsync(Uri.tryParse),
    );

/// プライバシーポリシーのURI
@riverpod
Future<Uri?> configurePrivacyPolicyUri(
  ConfigurePrivacyPolicyUriRef ref,
) =>
    ref.watch(
      remoteConfigGetStringValueProvider(
        key: RemoteConfigConstant.kPrivacyPolicyUri,
        defaultValue: RemoteConfigConstant.kPrivacyPolicyUriDefaultValue,
      ).selectAsync(Uri.tryParse),
    );
