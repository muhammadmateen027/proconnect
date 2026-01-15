import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/models/condo.dart';

class UpdateCondoUseCase {
  UpdateCondoUseCase(this._repository);
  final CondoRepository _repository;

  Future<void> call({required Condo condo}) {
    return _repository.updateCondo(condo: condo);
  }
}
