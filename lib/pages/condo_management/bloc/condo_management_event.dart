part of '../bloc/condo_management_bloc.dart';

@freezed
abstract class CondoManagementEvent with _$CondoManagementEvent {
  const factory CondoManagementEvent.loadCondos() = _LoadCondos;

  const factory CondoManagementEvent.createCondo({
    required String name,
    required String address,
    int? totalUnits,
    int? totalFloors,
    int? yearBuilt,
    String? description,
    String? contactEmail,
    String? contactPhone,
    @Default([]) List<String> amenities,
  }) = _CreateCondo;

  const factory CondoManagementEvent.updateCondo({
    required Condo condo,
  }) = _UpdateCondo;

  const factory CondoManagementEvent.deleteCondo({
    required String id,
  }) = _DeleteCondo;

  const factory CondoManagementEvent.assignAgency({
    required String condoId,
    required String agencyId,
    required String agencyName,
  }) = _AssignAgency;
}
