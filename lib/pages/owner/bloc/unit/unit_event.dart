part of 'unit_bloc.dart';

@freezed
abstract class UnitEvent with _$UnitEvent {
  const factory UnitEvent.loadUnits(String ownerId) = _LoadUnits;
  const factory UnitEvent.addUnit(Unit unit) = _AddUnit;
  const factory UnitEvent.updateUnitTenantInfo({
    required String unitId,
    required String tenantName,
    required String tenantPhone,
    required String? tenantEmail,
    required double? monthlyRent,
  }) = UpdateTenantInfo;
  const factory UnitEvent.deleteUnit(String unitId) = _DeleteUnit;
  const factory UnitEvent.unitsUpdated(List<Unit> units) = _UnitsUpdated;
  const factory UnitEvent.clear() = _Clear;
}
