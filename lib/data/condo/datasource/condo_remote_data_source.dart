import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/condo.dart';

abstract class CondoRemoteDataSource {
  Future<List<Condo>> getCondos();
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
  Future<void> assignAgency({
    required String condoId,
    required String agencyId,
    required String agencyName,
  });
}

class CondoRemoteDataSourceImpl implements CondoRemoteDataSource {
  CondoRemoteDataSourceImpl({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

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
  }) async {
    final doc = _firestore.collection('condos').doc();
    final condo = Condo(
      id: doc.id,
      name: name,
      address: address,
      totalUnits: totalUnits,
      totalFloors: totalFloors,
      yearBuilt: yearBuilt,
      description: description,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      amenities: amenities ?? [],
    );
    await doc.set(condo.toJson());
    return condo;
  }

  @override
  Future<void> deleteCondo({required String id}) {
    return _firestore.collection('condos').doc(id).delete();
  }

  @override
  Future<List<Condo>> getCondos() async {
    final snapshot = await _firestore.collection('condos').get();
    return snapshot.docs.map((doc) => Condo.fromJson(doc.data())).toList();
  }

  @override
  Future<void> updateCondo({required Condo condo}) {
    return _firestore.collection('condos').doc(condo.id).update(condo.toJson());
  }

  @override
  Future<void> assignAgency({
    required String condoId,
    required String agencyId,
    required String agencyName,
  }) async {
    try {
      await _firestore.collection('condos').doc(condoId).update({
        'agencyId': agencyId,
        'agencyName': agencyName,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to assign agency: $e');
    }
  }
}
