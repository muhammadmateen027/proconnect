import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/unit.dart';

abstract class UnitRemoteDataSource {
  Stream<List<Unit>> getUnits(String ownerId);
  Future<void> addUnit(Unit unit);
  Future<void> updateUnit(Unit unit);
  Future<void> updateUnitTenantDetails({
    required String unitId,
    required String tenantName,
    required String tenantPhone,
    required String? tenantEmail,
    required double? monthlyRent,
  });
  Future<void> deleteUnit(String unitId);
}

class UnitRemoteDataSourceImpl implements UnitRemoteDataSource {
  final FirebaseFirestore _firestore;

  UnitRemoteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Unit>> getUnits(String ownerId) {
    return _firestore
        .collection('units')
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => Unit.fromJson(doc.data())).toList();
        });
  }

  @override
  Future<void> addUnit(Unit unit) {
    return _firestore.collection('units').doc(unit.id).set(unit.toJson());
  }

  @override
  Future<void> updateUnit(Unit unit) {
    return _firestore.collection('units').doc(unit.id).update(unit.toJson());
  }

  @override
  Future<void> updateUnitTenantDetails({
    required String unitId,
    required String tenantName,
    required String tenantPhone,
    required String? tenantEmail,
    required double? monthlyRent,
  }) {
    return _firestore.collection('units').doc(unitId).update({
      'tenantName': tenantName,
      'tenantPhone': tenantPhone,
      'tenantEmail': tenantEmail,
      'monthlyRent': monthlyRent,
    });
  }

  @override
  Future<void> deleteUnit(String unitId) {
    return _firestore.collection('units').doc(unitId).delete();
  }
}
