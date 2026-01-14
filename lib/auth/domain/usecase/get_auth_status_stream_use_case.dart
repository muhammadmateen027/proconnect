import 'package:proconnect/auth/domain/repository/auth_repository.dart';
import 'package:proconnect/models/app_user.dart';

class GetAuthStatusStreamUseCase {

  GetAuthStatusStreamUseCase(this._repository);
  final AuthRepository _repository;

  Stream<AppUser?> call() {
    return _repository.authStateChanges;
  }
}
