import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class AdminCreateUserUseCase {
  AdminCreateUserUseCase(this._repository);
  final AuthRepository _repository;

  Future<AppUser> call({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? condominiumId,
    String? agencyId,
  }) {
    final user = AppUser(
      uid: '',
      email: email,
      fullName: fullName,
      role: role,
      condominiumId: condominiumId,
      agencyId: agencyId,
    );
    return _repository.createUserWithRole(
      user: user,
      password: password,
    );
  }
}
