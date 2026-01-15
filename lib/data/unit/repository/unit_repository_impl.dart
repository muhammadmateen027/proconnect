import 'package:proconnect/data/unit/datasource/unit_remote_data_source.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class UnitRepositoryImpl implements UnitRepository {
  final UnitRemoteDataSource _dataSource;

  UnitRepositoryImpl(this._dataSource);

  @override
  Stream<List<Unit>> getUnits(String ownerId) => _dataSource.getUnits(ownerId);

  @override
  Future<void> addUnit(Unit unit) => _dataSource.addUnit(unit);

  @override
  Future<void> updateUnit(Unit unit) => _dataSource.updateUnit(unit);

  @override
  Future<void> updateUnitTenantDetails({
    required String unitId,
    required String tenantName,
    required String tenantPhone,
    required String? tenantEmail,
    required double? monthlyRent,
  }) => _dataSource.updateUnitTenantDetails(
    unitId: unitId,
    tenantName: tenantName,
    tenantPhone: tenantPhone,
    tenantEmail: tenantEmail,
    monthlyRent: monthlyRent,
  );

  @override
  Future<void> deleteUnit(String unitId) => _dataSource.deleteUnit(unitId);
}
