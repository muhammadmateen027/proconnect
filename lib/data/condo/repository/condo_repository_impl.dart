import 'package:proconnect/data/condo/datasource/condo_remote_data_source.dart';
import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/models/condo.dart';

class CondoRepositoryImpl implements CondoRepository {
  CondoRepositoryImpl(this._remoteDataSource);

  final CondoRemoteDataSource _remoteDataSource;

  @override
  Future<Condo> createCondo({required String name, required String address}) {
    return _remoteDataSource.createCondo(name: name, address: address);
  }

  @override
  Future<void> deleteCondo({required String id}) {
    return _remoteDataSource.deleteCondo(id: id);
  }

  @override
  Future<List<Condo>> getCondos() {
    return _remoteDataSource.getCondos();
  }

  @override
  Future<void> updateCondo({required Condo condo}) {
    return _remoteDataSource.updateCondo(condo: condo);
  }
}
