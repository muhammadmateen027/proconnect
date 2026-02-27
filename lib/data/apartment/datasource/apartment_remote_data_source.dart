import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/apartment.dart';

/// Remote data source for Apartment operations using Firestore
abstract class ApartmentRemoteDataSource {
  /// Get all apartments for a specific condominium
  Future<List<Apartment>> getApartmentsByCondominium(String condominiumId);

  /// Get all apartments on a specific floor
  Future<List<Apartment>> getApartmentsByFloor(
    String floorId, {
    String? condominiumId,
  });

  /// Delete all apartments on a specific floor
  Future<void> deleteApartmentsByFloor(String floorId, {String? condominiumId});

  /// Get all apartments managed by an agency
  Future<List<Apartment>> getApartmentsByAgency(String agencyId);

  /// Get all apartments where the user is a tenant
  Future<List<Apartment>> getApartmentsByTenant(String tenantId);

  /// Get all apartments owned by a specific owner
  Future<List<Apartment>> getApartmentsByOwner(String ownerId);

  /// Watch all apartments owned by a specific owner (real-time)
  Stream<List<Apartment>> watchApartmentsByOwner(String ownerId);

  /// Watch all apartments where the user is a tenant (real-time)
  Stream<List<Apartment>> watchApartmentsByTenant(String tenantId);

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

  /// Delete all apartments for a specific condominium
  Future<void> deleteApartmentsByCondominium(String condominiumId);
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
  Future<List<Apartment>> getApartmentsByFloor(
    String floorId, {
    String? condominiumId,
  }) async {
    var query = _firestore
        .collection(_collection)
        .where('floorId', isEqualTo: floorId);

    if (condominiumId != null) {
      query = query.where('condominiumId', isEqualTo: condominiumId);
    }

    final snapshot = await query.get();

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
  Stream<List<Apartment>> watchApartmentsByOwner(String ownerId) {
    return _firestore
        .collection(_collection)
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Apartment.fromJson(doc.data()))
              .toList();
        });
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
    final updates = <String, dynamic>{
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

  @override
  Future<void> deleteApartmentsByFloor(
    String floorId, {
    String? condominiumId,
  }) async {
    var query = _firestore
        .collection(_collection)
        .where('floorId', isEqualTo: floorId);

    if (condominiumId != null) {
      query = query.where('condominiumId', isEqualTo: condominiumId);
    }

    final snapshot = await query.get();
    if (snapshot.docs.isEmpty) return;

    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  @override
  Future<void> deleteApartmentsByCondominium(String condominiumId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('condominiumId', isEqualTo: condominiumId)
        .get();

    if (snapshot.docs.isEmpty) return;

    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  @override
  Future<List<Apartment>> getApartmentsByTenant(String tenantId) async {
    final snapshot = await _firestore
        .collection(_collection)
        .where('tenantId', isEqualTo: tenantId)
        .orderBy('apartmentNumber')
        .get();

    return snapshot.docs.map((doc) => Apartment.fromJson(doc.data())).toList();
  }

  @override
  Stream<List<Apartment>> watchApartmentsByTenant(String tenantId) {
    return _firestore
        .collection(_collection)
        .where('tenantId', isEqualTo: tenantId)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Apartment.fromJson(doc.data()))
              .toList();
        });
  }
}
