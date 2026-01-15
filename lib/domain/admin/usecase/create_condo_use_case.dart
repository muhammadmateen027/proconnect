import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/models/condo.dart';

class CreateCondoUseCase {
  CreateCondoUseCase(this._repository);
  final CondoRepository _repository;

  Future<Condo> call({required String name, required String address}) {
    return _repository.createCondo(name: name, address: address);
  }
}
