import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/apartment.dart';

/// Remote data source for Apartment operations using Firestore
abstract class ApartmentRemoteDataSource {
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
  Future<Apartment> createApartment(Apartment apartment);

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

/// Implementation of ApartmentRemoteDataSource using Firestore
class ApartmentRemoteDataSourceImpl implements ApartmentRemoteDataSource {
  ApartmentRemoteDataSourceImpl({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  static const String _collection = 'apartments';

  @override
  Future<void> assignOwner({
    required String apartmentId,
    required String ownerId,
    required String ownerName,
    String? ownerEmail,
    String? ownerPhone,
  }) async {
    await _firestore.collection(_collection).doc(apartmentId).update({
      'ownerId': ownerId,
      'ownerName': ownerName,
      'ownerEmail': ownerEmail,
      'ownerPhone': ownerPhone,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<Apartment> createApartment(Apartment apartment) async {
    final doc = _firestore.collection(_collection).doc();
    final now = DateTime.now();

    final newApartment = apartment.copyWith(
      id: doc.id,
      createdAt: now,
      updatedAt: now,
    );

    await doc.set(newApartment.toJson());
    return newApartment;
  }

  @override
  Future<void> deleteApartment(String apartmentId) async {
    await _firestore.collection(_collection).doc(apartmentId).delete();
  }

  @override
  Future<Apartment?> getApartmentById(String apartmentId) async {
    final doc = await _firestore.collection(_collection).doc(apartmentId).get();

    if (!doc.exists) return null;

    return Apartment.fromJson(doc.data()!);
  }

  @override
  Future<List<Apartment>> getApartmentsByAgency(String agencyId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('agencyId', isEqualTo: agencyId)
        .orderBy('apartmentNumber')
        .get();

    return snapshot.docs.map((doc) => Apartment.fromJson(doc.data())).toList();
  }

  @override
  Future<List<Apartment>> getApartmentsByCondominium(
    String condominiumId,
  ) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('condominiumId', isEqualTo: condominiumId)
        .orderBy('apartmentNumber')
        .get();

    return snapshot.docs.map((doc) => Apartment.fromJson(doc.data())).toList();
  }

  @override
  Future<List<Apartment>> getApartmentsByFloor(String floorId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('floorId', isEqualTo: floorId)
        .orderBy('apartmentNumber')
        .get();

    return snapshot.docs.map((doc) => Apartment.fromJson(doc.data())).toList();
  }

  @override
  Future<List<Apartment>> getApartmentsByOwner(String ownerId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('ownerId', isEqualTo: ownerId)
        .orderBy('apartmentNumber')
        .get();

    return snapshot.docs.map((doc) => Apartment.fromJson(doc.data())).toList();
  }

  @override
  Future<List<Apartment>> getAvailableApartments(String condominiumId) async {
    final now = Timestamp.now();

    final snapshot = await _firestore
        .collection(_collection)
        .where('condominiumId', isEqualTo: condominiumId)
        .where('status', isEqualTo: ApartmentStatus.vacant.name)
        .where('availableFrom', isLessThanOrEqualTo: now)
        .orderBy('availableFrom')
        .orderBy('apartmentNumber')
        .get();

    return snapshot.docs.map((doc) => Apartment.fromJson(doc.data())).toList();
  }

  @override
  Future<List<Apartment>> getVacantApartments(String condominiumId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('condominiumId', isEqualTo: condominiumId)
        .where('status', isEqualTo: ApartmentStatus.vacant.name)
        .orderBy('apartmentNumber')
        .get();

    return snapshot.docs.map((doc) => Apartment.fromJson(doc.data())).toList();
  }

  @override
  Future<void> removeOwner(String apartmentId) async {
    await _firestore.collection(_collection).doc(apartmentId).update({
      'ownerId': FieldValue.delete(),
      'ownerName': FieldValue.delete(),
      'ownerEmail': FieldValue.delete(),
      'ownerPhone': FieldValue.delete(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updateApartment(Apartment apartment) async {
    final updatedApartment = apartment.copyWith(updatedAt: DateTime.now());

    await _firestore
        .collection(_collection)
        .doc(apartment.id)
        .update(updatedApartment.toJson());
  }

  @override
  Future<void> updateApartmentStatus({
    required String apartmentId,
    required ApartmentStatus status,
    DateTime? vacantFrom,
    DateTime? availableFrom,
  }) async {
    final Map<String, dynamic> updates = {
      'status': status.name,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (vacantFrom != null) {
      updates['vacantFrom'] = Timestamp.fromDate(vacantFrom);
    }

    if (availableFrom != null) {
      updates['availableFrom'] = Timestamp.fromDate(availableFrom);
    }

    await _firestore.collection(_collection).doc(apartmentId).update(updates);
  }
}
