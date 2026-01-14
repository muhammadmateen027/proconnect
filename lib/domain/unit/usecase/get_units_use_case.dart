import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class GetUnitsUseCase {
  final UnitRepository _repository;

  GetUnitsUseCase(this._repository);

  Stream<List<Unit>> call(String ownerId) {
    return _repository.getUnits(ownerId);
  }
}
