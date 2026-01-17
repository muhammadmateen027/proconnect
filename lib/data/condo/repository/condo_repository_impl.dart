import 'package:proconnect/data/condo/datasource/condo_remote_data_source.dart';
import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/models/condo.dart';

class CondoRepositoryImpl implements CondoRepository {
  CondoRepositoryImpl(this._remoteDataSource);

  final CondoRemoteDataSource _remoteDataSource;

  @override
  Future<Condo> createCondo({
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    List<String>? amenities,
  }) {
    return _remoteDataSource.createCondo(
      name: name,
      address: address,
      totalUnits: totalUnits,
      totalFloors: totalFloors,
      yearBuilt: yearBuilt,
      description: description,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      amenities: amenities,
    );
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
