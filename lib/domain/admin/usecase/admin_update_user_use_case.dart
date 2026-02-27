import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class AdminUpdateUserUseCase {
  AdminUpdateUserUseCase(this._repository);
  final AuthRepository _repository;

  Future<void> call({
    required AppUser user,
  }) {
    return _repository.updateUser(user);
  }
}
