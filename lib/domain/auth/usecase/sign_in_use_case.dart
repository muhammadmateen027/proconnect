import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class SignInUseCase {

  SignInUseCase(this._repository);
  final AuthRepository _repository;

  Future<AppUser> call({required String email, required String password}) {
    return _repository.signIn(email: email, password: password);
  }
}
