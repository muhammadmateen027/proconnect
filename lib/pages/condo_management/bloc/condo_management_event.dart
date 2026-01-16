part of '../bloc/condo_management_bloc.dart';

@freezed
abstract class CondoManagementEvent with _$CondoManagementEvent {
  const factory CondoManagementEvent.loadCondos() = _LoadCondos;

  const factory CondoManagementEvent.createCondo({
    required String name,
    required String address,
  }) = _CreateCondo;

  const factory CondoManagementEvent.updateCondo({
    required Condo condo,
  }) = _UpdateCondo;

  const factory CondoManagementEvent.deleteCondo({
    required String id,
  }) = _DeleteCondo;
}
