part of 'condo_management_bloc.dart';

@freezed
abstract class CondoManagementState with _$CondoManagementState {
  const factory CondoManagementState.initial() = _Initial;
  const factory CondoManagementState.loading() = _Loading;
  const factory CondoManagementState.success() = _Success;
  const factory CondoManagementState.loaded({
    required List<Condo> condos,
  }) = _Loaded;
  const factory CondoManagementState.failure({
    required String errorKey,
  }) = _Failure;
}
