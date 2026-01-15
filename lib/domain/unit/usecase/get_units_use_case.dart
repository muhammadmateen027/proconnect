import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class GetUnitsUseCase {

  GetUnitsUseCase(this._repository);
  final UnitRepository _repository;

  Stream<List<Unit>> call(String ownerId) {
    return _repository.getUnits(ownerId);
  }
}
