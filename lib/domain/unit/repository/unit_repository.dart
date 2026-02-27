import 'package:proconnect/domain/models/unit.dart';

abstract class UnitRepository {
  Stream<List<Unit>> getUnits(String ownerId);
  Future<void> addUnit(Unit unit);
  Future<void> updateUnit(Unit unit);
  Future<void> updateUnitTenantDetails({
    required String unitId,
    required String tenantName,
    required String tenantPhone,
    required String? tenantEmail,
    required double? monthlyRent,
  });
  Future<void> deleteUnit(String unitId);
}
