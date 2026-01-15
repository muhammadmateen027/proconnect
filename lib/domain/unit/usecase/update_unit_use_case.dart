import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class UpdateUnitUseCase {
  final UnitRepository _repository;

  UpdateUnitUseCase(this._repository);

  Future<void> call(Unit unit) {
    return _repository.updateUnit(unit);
  }
}
