import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class SignUpUseCase {
  SignUpUseCase(this._repository);
  final AuthRepository _repository;

  Future<AppUser> call({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String condominiumId,
    required String agencyId,
  }) {
    return _repository.signUp(
      email: email,
      password: password,
      fullName: fullName,
      role: role,
      condominiumId: condominiumId,
      agencyId: agencyId,
    );
  }
}
