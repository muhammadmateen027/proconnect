import 'package:proconnect/data/floor/datasource/floor_remote_data_source.dart';
import 'package:proconnect/domain/models/floor.dart';
import 'package:proconnect/domain/repositories/floor_repository.dart';

/// Implementation of FloorRepository
class FloorRepositoryImpl implements FloorRepository {
  FloorRepositoryImpl({
    required FloorRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final FloorRemoteDataSource _remoteDataSource;

  @override
  Future<void> createFloor(Floor floor) async {
    await _remoteDataSource.createFloor(
      condominiumId: floor.condominiumId,
      agencyId: floor.agencyId,
      floorNumber: floor.floorNumber,
      floorName: floor.floorName,
      totalApartments: floor.totalApartments,
      description: floor.description,
      amenities: floor.amenities,
    );
  }

  @override
  Future<void> deleteFloor(String floorId) async {
    await _remoteDataSource.deleteFloor(floorId);
  }

  @override
  Future<Floor?> getFloorById(String floorId) async {
    return await _remoteDataSource.getFloorById(floorId);
  }

  @override
  Future<List<Floor>> getFloorsByAgency(String agencyId) async {
    return await _remoteDataSource.getFloorsByAgency(agencyId);
  }

  @override
  Future<List<Floor>> getFloorsByCondominium(String condominiumId) async {
    return await _remoteDataSource.getFloorsByCondominium(condominiumId);
  }

  @override
  Future<void> updateFloor(Floor floor) async {
    await _remoteDataSource.updateFloor(floor);
  }
}
