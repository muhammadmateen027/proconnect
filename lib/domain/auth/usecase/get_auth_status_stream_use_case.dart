import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class GetAuthStatusStreamUseCase {
  final AuthRepository _repository;

  GetAuthStatusStreamUseCase(this._repository);

  Stream<AppUser?> call() {
    return _repository.authStateChanges;
  }
}
