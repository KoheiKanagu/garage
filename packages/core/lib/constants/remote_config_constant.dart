/// reference: [remoteconfig.template.json]
class RemoteConfigConstant {
  static const String kRequirementVersionCode = 'requirement_version_code';
  static const int kRequirementVersionCodeDefaultValue = 0;

  static const String kLatestVersionCode = 'latest_version_code';
  static const int kLatestVersionCodeDefaultValue = 0;

  static const String kServiceStatus = 'service_status';
  static const String kServiceStatusDefaultValue = 'down';

  static const String kTermsOfServiceUri = 'terms_of_service_uri';
  static const String kTermsOfServiceUriDefaultValue =
      'https://github.com/KoheiKanagu/garage/blob/main/term_of_service.md';

  static const String kPrivacyPolicyUri = 'privacy_policy_uri';
  static const String kPrivacyPolicyUriDefaultValue =
      'https://github.com/KoheiKanagu/garage/blob/main/privacy_policy.md';
}
