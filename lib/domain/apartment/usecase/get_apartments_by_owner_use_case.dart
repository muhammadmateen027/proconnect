import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/repositories/apartment_repository.dart';

/// Use case to get all apartments owned by a specific owner
class GetApartmentsByOwnerUseCase {
  GetApartmentsByOwnerUseCase(this._apartmentRepository);

  final ApartmentRepository _apartmentRepository;

  /// Returns a stream of apartments owned by the given owner ID
  Stream<List<Apartment>> call(String ownerId) {
    return _apartmentRepository.watchApartmentsByOwner(ownerId);
  }
}
