import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class AddUnitUseCase {

  AddUnitUseCase(this._repository);
  final UnitRepository _repository;

  Future<void> call(Unit unit) {
    return _repository.addUnit(unit);
  }
}
