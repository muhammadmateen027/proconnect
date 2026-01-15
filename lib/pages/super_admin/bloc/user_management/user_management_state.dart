part of 'user_management_bloc.dart';

@freezed
abstract class UserManagementState with _$UserManagementState {
  const factory UserManagementState.initial() = _Initial;
  const factory UserManagementState.loading() = _Loading;
  const factory UserManagementState.success() = _Success;
  const factory UserManagementState.failure({
    required String errorKey,
  }) = _Failure;
}
