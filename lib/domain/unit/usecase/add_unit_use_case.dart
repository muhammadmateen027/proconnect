import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class AddUnitUseCase {
  final UnitRepository _repository;

  AddUnitUseCase(this._repository);

  Future<void> call(Unit unit) {
    return _repository.addUnit(unit);
  }
}
