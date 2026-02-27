import 'package:proconnect/domain/auth/repository/auth_repository.dart';

class SignOutUseCase {

  SignOutUseCase(this._repository);
  final AuthRepository _repository;

  Future<void> call() {
    return _repository.signOut();
  }
}
