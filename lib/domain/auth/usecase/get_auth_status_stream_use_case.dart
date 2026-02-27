import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class GetAuthStatusStreamUseCase {

  GetAuthStatusStreamUseCase(this._repository);
  final AuthRepository _repository;

  Stream<AppUser?> call() {
    return _repository.authStateChanges;
  }
}
