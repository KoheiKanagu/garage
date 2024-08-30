/// reference: [remoteconfig.template.json]
class RemoteConfigConstant {
  static const String kRequirementVersionCode = 'requirement_version_code';
  static const int kRequirementVersionCodeDefaultValue = 0;

  static const String kLatestVersionCode = 'latest_version_code';
  static const int kLatestVersionCodeDefaultValue = 0;

  static const String kTermsOfServiceUri = 'terms_of_service_uri';
  static const String kTermsOfServiceUriDefaultValue =
      'https://kingu.dev/apps/term_of_service.html';

  static const String kPrivacyPolicyUri = 'privacy_policy_uri';
  static const String kPrivacyPolicyUriDefaultValue =
      'https://kingu.dev/apps/privacy_policy.html';
}
