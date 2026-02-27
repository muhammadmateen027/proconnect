import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/models/condo.dart';

class CreateCondoUseCase {
  CreateCondoUseCase(this._repository);
  final CondoRepository _repository;

  Future<Condo> call({
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    List<String>? amenities,
  }) {
    return _repository.createCondo(
      name: name,
      address: address,
      totalUnits: totalUnits,
      totalFloors: totalFloors,
      yearBuilt: yearBuilt,
      description: description,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      amenities: amenities,
    );
  }
}
