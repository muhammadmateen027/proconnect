import 'package:proconnect/auth/domain/repository/auth_repository.dart';
import 'package:proconnect/models/app_user.dart';

class SignInUseCase {
  SignInUseCase(this._repository);

  final AuthRepository _repository;

  Future<AppUser> call({required String email, required String password}) {
    return _repository.signIn(email: email, password: password);
  }
}
