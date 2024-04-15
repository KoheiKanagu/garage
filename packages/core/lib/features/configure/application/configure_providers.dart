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
