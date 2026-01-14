import 'package:proconnect/domain/models/unit.dart';

abstract class UnitRepository {
  Stream<List<Unit>> getUnits(String ownerId);
  Future<void> addUnit(Unit unit);
  Future<void> deleteUnit(String unitId);
}
