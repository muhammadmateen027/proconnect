import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/repositories/apartment_repository.dart';

class GetTenantApartmentsUseCase {
  GetTenantApartmentsUseCase(this._repository);

  final ApartmentRepository _repository;

  Stream<List<Apartment>> call(String tenantId) {
    return _repository.watchApartmentsByTenant(tenantId);
  }
}
