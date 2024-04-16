import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'configure_providers.g.dart';

/// 新しいバージョンがリリースされているかどうか
@riverpod
Future<bool> configureIsReleasedNewVersion(
  ConfigureIsReleasedNewVersionRef ref,
) {
  final buildNumber = ref.watch(packageInfoBuildNumberProvider);
  return ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kLatestVersionCode,
      defaultValue: RemoteConfigConstant.kLatestVersionCodeDefaultValue,
    ).selectAsync((e) => e > buildNumber),
  );
}

/// 新しいバージョンにアップデートが必須であるかどうか
@riverpod
Future<bool> configureIsRequiredUpdate(
  ConfigureIsRequiredUpdateRef ref,
) {
  final buildNumber = ref.watch(packageInfoBuildNumberProvider);
  return ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kRequirementVersionCode,
      defaultValue: RemoteConfigConstant.kRequirementVersionCodeDefaultValue,
    ).selectAsync((e) => e > buildNumber),
  );
}

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
