import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class DeleteUnitUseCase {

  DeleteUnitUseCase(this._repository);
  final UnitRepository _repository;

  Future<void> call(String unitId) {
    return _repository.deleteUnit(unitId);
  }
}
