import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'configure_providers.g.dart';

/// 新しいバージョンがリリースされているかどうか
@riverpod
Future<bool> configureIsReleasedNewVersion(
  ConfigureIsReleasedNewVersionRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kLatestVersionCode,
      defaultValue: RemoteConfigConstant.kLatestVersionCodeDefaultValue,
    ).future,
  );

  return value > ref.watch(packageInfoBuildNumberProvider);
}

/// 新しいバージョンにアップデートが必須であるかどうか
@riverpod
Future<bool> configureIsNeedUpdate(
  ConfigureIsNeedUpdateRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kRequirementVersionCode,
      defaultValue: RemoteConfigConstant.kRequirementVersionCodeDefaultValue,
    ).future,
  );

  return value > ref.watch(packageInfoBuildNumberProvider);
}

/// サービスの稼働状況
@riverpod
Future<ServiceStatus> configureServiceStatus(
  ConfigureServiceStatusRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetStringValueProvider(
      key: RemoteConfigConstant.kServiceStatus,
      defaultValue: RemoteConfigConstant.kServiceStatusDefaultValue,
    ).future,
  );

  return switch (value) {
    'up' => ServiceStatus.up,
    'down' => ServiceStatus.down,
    _ => ServiceStatus.down,
  };
}

/// 利用規約のURI
@riverpod
Future<Uri?> configureTermsOfServiceUri(
  ConfigureTermsOfServiceUriRef ref,
) =>
    ref
        .watch(
          remoteConfigGetStringValueProvider(
            key: RemoteConfigConstant.kTermsOfServiceUri,
            defaultValue: RemoteConfigConstant.kTermsOfServiceUriDefaultValue,
          ).future,
        )
        .then(Uri.tryParse);

/// プライバシーポリシーのURI
@riverpod
Future<Uri?> configurePrivacyPolicyUri(
  ConfigurePrivacyPolicyUriRef ref,
) =>
    ref
        .watch(
          remoteConfigGetStringValueProvider(
            key: RemoteConfigConstant.kPrivacyPolicyUri,
            defaultValue: RemoteConfigConstant.kPrivacyPolicyUriDefaultValue,
          ).future,
        )
        .then(Uri.tryParse);
