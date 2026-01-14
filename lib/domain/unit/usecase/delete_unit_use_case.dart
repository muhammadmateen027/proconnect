import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class DeleteUnitUseCase {
  final UnitRepository _repository;

  DeleteUnitUseCase(this._repository);

  Future<void> call(String unitId) {
    return _repository.deleteUnit(unitId);
  }
}
