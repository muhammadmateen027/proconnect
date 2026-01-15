import 'package:proconnect/domain/unit/repository/unit_repository.dart';

class UpdateUnitTenantDetailsUseCase {

  UpdateUnitTenantDetailsUseCase(this._repository);
  final UnitRepository _repository;

  Future<void> call({
    required String unitId,
    required String tenantName,
    required String tenantPhone,
    required String? tenantEmail,
    required double? monthlyRent,
  }) {
    return _repository.updateUnitTenantDetails(
      unitId: unitId,
      tenantName: tenantName,
      tenantPhone: tenantPhone,
      tenantEmail: tenantEmail,
      monthlyRent: monthlyRent,
    );
  }
}
