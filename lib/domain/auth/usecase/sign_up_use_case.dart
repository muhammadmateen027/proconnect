import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  Future<AppUser> call({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String siteId,
    required String orgId,
  }) {
    return _repository.signUp(
      email: email,
      password: password,
      fullName: fullName,
      role: role,
      siteId: siteId,
      orgId: orgId,
    );
  }
}
