import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proconnect/domain/models/condo.dart';

abstract class CondoRemoteDataSource {
  Future<List<Condo>> getCondos();
  Future<Condo> createCondo({required String name, required String address});
  Future<void> updateCondo({required Condo condo});
  Future<void> deleteCondo({required String id});
}

class CondoRemoteDataSourceImpl implements CondoRemoteDataSource {
  CondoRemoteDataSourceImpl({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<Condo> createCondo({required String name, required String address}) async {
    final doc = _firestore.collection('condos').doc();
    final condo = Condo(id: doc.id, name: name, address: address);
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
}
