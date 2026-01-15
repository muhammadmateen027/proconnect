import 'package:proconnect/data/unit/datasource/unit_remote_data_source.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class UnitRepositoryImpl implements UnitRepository {

  UnitRepositoryImpl(this._dataSource);
  final UnitRemoteDataSource _dataSource;

  @override
  Stream<List<Unit>> getUnits(String ownerId) => _dataSource.getUnits(ownerId);

  @override
  Future<void> addUnit(Unit unit) => _dataSource.addUnit(unit);

  @override
  Future<void> deleteUnit(String unitId) => _dataSource.deleteUnit(unitId);
}
