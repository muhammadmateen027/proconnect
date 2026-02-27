import 'package:proconnect/data/apartment/datasource/apartment_remote_data_source.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/repositories/apartment_repository.dart';

/// Implementation of ApartmentRepository
class ApartmentRepositoryImpl implements ApartmentRepository {
  ApartmentRepositoryImpl({
    required ApartmentRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final ApartmentRemoteDataSource _remoteDataSource;

  @override
  Future<void> assignOwner({
    required String apartmentId,
    required String ownerId,
    required String ownerName,
    String? ownerEmail,
    String? ownerPhone,
  }) async {
    await _remoteDataSource.assignOwner(
      apartmentId: apartmentId,
      ownerId: ownerId,
      ownerName: ownerName,
      ownerEmail: ownerEmail,
      ownerPhone: ownerPhone,
    );
  }

  @override
  Future<void> createApartment(Apartment apartment) async {
    await _remoteDataSource.createApartment(apartment);
  }

  @override
  Future<void> deleteApartment(String apartmentId) async {
    await _remoteDataSource.deleteApartment(apartmentId);
  }

  @override
  Future<Apartment?> getApartmentById(String apartmentId) async {
    return _remoteDataSource.getApartmentById(apartmentId);
  }

  @override
  Future<List<Apartment>> getApartmentsByAgency(String agencyId) async {
    return _remoteDataSource.getApartmentsByAgency(agencyId);
  }

  @override
  Future<List<Apartment>> getApartmentsByCondominium(
    String condominiumId,
  ) async {
    return _remoteDataSource.getApartmentsByCondominium(condominiumId);
  }

  @override
  Future<List<Apartment>> getApartmentsByFloor(
    String floorId, {
    String? condominiumId,
  }) async {
    return _remoteDataSource.getApartmentsByFloor(
      floorId,
      condominiumId: condominiumId,
    );
  }

  @override
  Future<List<Apartment>> getApartmentsByOwner(String ownerId) async {
    return _remoteDataSource.getApartmentsByOwner(ownerId);
  }

  @override
  Stream<List<Apartment>> watchApartmentsByOwner(String ownerId) {
    return _remoteDataSource.watchApartmentsByOwner(ownerId);
  }

  @override
  Future<List<Apartment>> getAvailableApartments(String condominiumId) async {
    return _remoteDataSource.getAvailableApartments(condominiumId);
  }

  @override
  Future<List<Apartment>> getVacantApartments(String condominiumId) async {
    return _remoteDataSource.getVacantApartments(condominiumId);
  }

  @override
  Future<void> removeOwner(String apartmentId) async {
    await _remoteDataSource.removeOwner(apartmentId);
  }

  @override
  Future<void> updateApartment(Apartment apartment) async {
    await _remoteDataSource.updateApartment(apartment);
  }

  @override
  Future<void> updateApartmentStatus({
    required String apartmentId,
    required ApartmentStatus status,
    DateTime? vacantFrom,
    DateTime? availableFrom,
  }) async {
    await _remoteDataSource.updateApartmentStatus(
      apartmentId: apartmentId,
      status: status,
      vacantFrom: vacantFrom,
      availableFrom: availableFrom,
    );
  }

  @override
  Future<void> deleteApartmentsByFloor(
    String floorId, {
    required String condominiumId,
  }) async {
    await _remoteDataSource.deleteApartmentsByFloor(
      floorId,
      condominiumId: condominiumId,
    );
  }

  @override
  Future<List<Apartment>> getApartmentsByTenant(String tenantId) async {
    return _remoteDataSource.getApartmentsByTenant(tenantId);
  }

  @override
  Stream<List<Apartment>> watchApartmentsByTenant(String tenantId) {
    return _remoteDataSource.watchApartmentsByTenant(tenantId);
  }
}
