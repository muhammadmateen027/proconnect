import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/floor.dart';

/// Remote data source for Floor operations using Firestore
abstract class FloorRemoteDataSource {
  /// Get all floors for a specific condominium
  Future<List<Floor>> getFloorsByCondominium(String condominiumId);

  /// Get a specific floor by ID
  Future<Floor?> getFloorById(String floorId);

  /// Create a new floor
  Future<Floor> createFloor({
    required String condominiumId,
    required String agencyId,
    required int floorNumber,
    String? floorName,
    int? totalApartments,
    String? description,
    List<String>? amenities,
  });

  /// Update an existing floor
  Future<void> updateFloor(Floor floor);

  /// Delete a floor
  Future<void> deleteFloor(String floorId);

  /// Get floors by agency ID
  Future<List<Floor>> getFloorsByAgency(String agencyId);
}

/// Implementation of FloorRemoteDataSource using Firestore
class FloorRemoteDataSourceImpl implements FloorRemoteDataSource {
  FloorRemoteDataSourceImpl({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  static const String _collection = 'floors';

  @override
  Future<Floor> createFloor({
    required String condominiumId,
    required String agencyId,
    required int floorNumber,
    String? floorName,
    int? totalApartments,
    String? description,
    List<String>? amenities,
  }) async {
    final doc = _firestore.collection(_collection).doc();
    final now = DateTime.now();

    final floor = Floor(
      id: doc.id,
      condominiumId: condominiumId,
      agencyId: agencyId,
      floorNumber: floorNumber,
      floorName: floorName,
      totalApartments: totalApartments,
      description: description,
      amenities: amenities ?? [],
      createdAt: now,
      updatedAt: now,
    );

    await doc.set(floor.toJson());
    return floor;
  }

  @override
  Future<void> deleteFloor(String floorId) async {
    await _firestore.collection(_collection).doc(floorId).delete();
  }

  @override
  Future<Floor?> getFloorById(String floorId) async {
    final doc = await _firestore.collection(_collection).doc(floorId).get();

    if (!doc.exists) return null;

    return Floor.fromJson(doc.data()!);
  }

  @override
  Future<List<Floor>> getFloorsByAgency(String agencyId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('agencyId', isEqualTo: agencyId)
        .orderBy('floorNumber')
        .get();

    return snapshot.docs.map((doc) => Floor.fromJson(doc.data())).toList();
  }

  @override
  Future<List<Floor>> getFloorsByCondominium(String condominiumId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('condominiumId', isEqualTo: condominiumId)
        .orderBy('floorNumber')
        .get();

    return snapshot.docs.map((doc) => Floor.fromJson(doc.data())).toList();
  }

  @override
  Future<void> updateFloor(Floor floor) async {
    final updatedFloor = floor.copyWith(updatedAt: DateTime.now());

    await _firestore
        .collection(_collection)
        .doc(floor.id)
        .update(updatedFloor.toJson());
  }
}
