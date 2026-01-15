import 'package:proconnect/domain/models/condo.dart';

abstract class CondoRepository {
  Future<List<Condo>> getCondos();
  Future<Condo> createCondo({required String name, required String address});
  Future<void> updateCondo({required Condo condo});
  Future<void> deleteCondo({required String id});
}
