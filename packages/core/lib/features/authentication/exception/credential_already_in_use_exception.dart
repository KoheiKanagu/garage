import 'package:core/features/authentication/application/my_auth_provider.dart';

class CredentialAlreadyInUseException implements Exception {
  CredentialAlreadyInUseException(this.type);

  final MyAuthProviderType type;
}
