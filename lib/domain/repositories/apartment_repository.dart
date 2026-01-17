import 'package:proconnect/domain/models/apartment.dart';

/// Repository interface for Apartment operations
abstract class ApartmentRepository {
  /// Get all apartments for a specific condominium
  Future<List<Apartment>> getApartmentsByCondominium(String condominiumId);

  /// Get all apartments on a specific floor
  Future<List<Apartment>> getApartmentsByFloor(String floorId);

  /// Get all apartments managed by an agency
  Future<List<Apartment>> getApartmentsByAgency(String agencyId);

  /// Get all apartments owned by a specific owner
  Future<List<Apartment>> getApartmentsByOwner(String ownerId);

  /// Get a specific apartment by ID
  Future<Apartment?> getApartmentById(String apartmentId);

  /// Create a new apartment
  Future<void> createApartment(Apartment apartment);

  /// Update an existing apartment
  Future<void> updateApartment(Apartment apartment);

  /// Delete an apartment
  Future<void> deleteApartment(String apartmentId);

  /// Assign an owner to an apartment
  Future<void> assignOwner({
    required String apartmentId,
    required String ownerId,
    required String ownerName,
    String? ownerEmail,
    String? ownerPhone,
  });

  /// Remove owner from an apartment
  Future<void> removeOwner(String apartmentId);

  /// Update apartment status
  Future<void> updateApartmentStatus({
    required String apartmentId,
    required ApartmentStatus status,
    DateTime? vacantFrom,
    DateTime? availableFrom,
  });

  /// Get vacant apartments
  Future<List<Apartment>> getVacantApartments(String condominiumId);

  /// Get available apartments (vacant and ready to move in)
  Future<List<Apartment>> getAvailableApartments(String condominiumId);
}
