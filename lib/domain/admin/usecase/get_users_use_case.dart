import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/models/app_user.dart';

class GetUsersUseCase {
  GetUsersUseCase(this._repository);
  final AuthRepository _repository;

  Future<List<AppUser>> call() {
    return _repository.getUsers();
  }
}
