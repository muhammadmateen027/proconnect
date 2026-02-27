import 'package:proconnect/domain/models/floor.dart';

/// Repository interface for Floor operations
abstract class FloorRepository {
  /// Get all floors for a specific condominium
  Future<List<Floor>> getFloorsByCondominium(String condominiumId);

  /// Get a specific floor by ID
  Future<Floor?> getFloorById(String floorId);

  /// Create a new floor
  Future<void> createFloor(Floor floor);

  /// Update an existing floor
  Future<void> updateFloor(Floor floor);

  /// Delete a floor
  Future<void> deleteFloor(String floorId);

  /// Get floors by agency ID
  Future<List<Floor>> getFloorsByAgency(String agencyId);
}
