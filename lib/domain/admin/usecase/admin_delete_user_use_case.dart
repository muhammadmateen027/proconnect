import 'package:proconnect/domain/auth/repository/auth_repository.dart';

class AdminDeleteUserUseCase {
  AdminDeleteUserUseCase(this._repository);
  final AuthRepository _repository;

  Future<void> call({
    required String uid,
  }) {
    return _repository.deleteUser(uid);
  }
}
