part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthentication() = _CheckAuthentication;
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    required String siteId,
    required String orgId,
  }) = _SignUp;
}
