import 'package:proconnect/domain/models/condo.dart';

abstract class CondoRepository {
  Future<List<Condo>> getCondos({String? agencyId});
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
  });
  Future<void> updateCondo({required Condo condo});
  Future<void> deleteCondo({required String id});

  /// Assign an agency to a condominium
  Future<void> assignAgency({
    required String condoId,
    required String agencyId,
    required String agencyName,
  });
}
