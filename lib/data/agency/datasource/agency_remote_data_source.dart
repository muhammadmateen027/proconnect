import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/agency.dart';

abstract class AgencyRemoteDataSource {
  Future<List<Agency>> getAgencies();
  Future<Agency> getAgencyById(String id);
  Future<Agency> createAgency({
    required String name,
    String? contactEmail,
    String? contactPhone,
    String? address,
  });
  Future<void> updateAgency(Agency agency);
  Future<void> deleteAgency(String id);
}

class AgencyRemoteDataSourceImpl implements AgencyRemoteDataSource {
  final FirebaseFirestore _firestore;

  AgencyRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<Agency>> getAgencies() async {
    try {
      final snapshot = await _firestore
          .collection('agencies')
          .orderBy('name')
          .get();

      return snapshot.docs
          .map(
            (doc) => Agency.fromJson({
              'id': doc.id,
              ...doc.data(),
            }),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load agencies: $e');
    }
  }

  @override
  Future<Agency> getAgencyById(String id) async {
    try {
      final doc = await _firestore.collection('agencies').doc(id).get();

      if (!doc.exists) {
        throw Exception('Agency not found');
      }

      return Agency.fromJson({
        'id': doc.id,
        ...doc.data()!,
      });
    } catch (e) {
      throw Exception('Failed to load agency: $e');
    }
  }

  @override
  Future<Agency> createAgency({
    required String name,
    String? contactEmail,
    String? contactPhone,
    String? address,
  }) async {
    try {
      final docRef = _firestore.collection('agencies').doc();

      final agency = Agency(
        id: docRef.id,
        name: name,
        contactEmail: contactEmail,
        contactPhone: contactPhone,
        address: address,
      );

      await docRef.set({
        ...agency.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      return agency;
    } catch (e) {
      throw Exception('Failed to create agency: $e');
    }
  }

  @override
  Future<void> updateAgency(Agency agency) async {
    try {
      await _firestore.collection('agencies').doc(agency.id).update({
        ...agency.toJson(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update agency: $e');
    }
  }

  @override
  Future<void> deleteAgency(String id) async {
    try {
      await _firestore.collection('agencies').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete agency: $e');
    }
  }
}
