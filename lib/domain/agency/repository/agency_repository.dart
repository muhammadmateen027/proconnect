import 'package:proconnect/domain/models/agency.dart';

abstract class AgencyRepository {
  /// Get all agencies
  Future<List<Agency>> getAgencies();

  /// Get agency by ID
  Future<Agency> getAgencyById(String id);

  /// Create a new agency
  Future<Agency> createAgency({
    required String name,
    String? contactEmail,
    String? contactPhone,
    String? address,
  });

  /// Update an existing agency
  Future<void> updateAgency(Agency agency);

  /// Delete an agency by ID
  Future<void> deleteAgency(String id);
}
