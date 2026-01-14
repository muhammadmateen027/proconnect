part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated({required AppUser user}) =
      _Authenticated;
  const factory AuthState.unauthenticated({String? errorKey}) =
      _Unauthenticated;
}
