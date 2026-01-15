part of 'user_management_bloc.dart';

@freezed
abstract class UserManagementEvent with _$UserManagementEvent {
  const factory UserManagementEvent.adminCreateUser({
    required String email,
    required String fullName,
    required UserRole role,
    required String password,
    String? condominiumId,
    String? agencyId,
  }) = _AdminCreateUser;

  const factory UserManagementEvent.adminUpdateUser({
    required AppUser user,
  }) = _AdminUpdateUser;
  
  const factory UserManagementEvent.adminDeleteUser({
    required String uid,
  }) = _AdminDeleteUser;

  const factory UserManagementEvent.loadUsers() = _LoadUsers;
}
