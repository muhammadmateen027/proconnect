import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/auth/domain/usecase/get_auth_status_stream_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_in_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_out_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_up_use_case.dart';
import 'package:proconnect/models/app_user.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUseCase,
    required GetAuthStatusStreamUseCase getAuthStatusStreamUseCase,
    required SignUpUseCase signUpUseCase,
  }) : _signInUseCase = signInUseCase,
       _signOutUseCase = signOutUseCase,
       _getAuthStatusStreamUseCase = getAuthStatusStreamUseCase,
       _signUpUseCase = signUpUseCase,
       super(const AuthState.initial()) {
    on<_CheckAuthentication>(_onCheckAuthentication);
    on<_Login>(_onLogin);
    on<_Logout>(_onLogout);
    on<_SignUp>(_onSignUp);
  }

  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetAuthStatusStreamUseCase _getAuthStatusStreamUseCase;
  final SignUpUseCase _signUpUseCase;

  Future<void> _onCheckAuthentication(
    _CheckAuthentication event,
    Emitter<AuthState> emit,
  ) async {
    await emit.forEach<AppUser?>(
      _getAuthStatusStreamUseCase(),
      onData: (user) {
        if (user != null) {
          return AuthState.authenticated(user: user);
        } else {
          return const AuthState.unauthenticated();
        }
      },
    );
  }

  Future<void> _onLogin(
    _Login event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final user = await _signInUseCase(
        email: event.email,
        password: event.password,
      );
      emit(AuthState.authenticated(user: user));
    } catch (e) {
      emit(const AuthState.unauthenticated(errorKey: 'loginFailed'));
    }
  }

  Future<void> _onLogout(
    _Logout event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _signOutUseCase();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(const AuthState.unauthenticated(errorKey: 'unknownError'));
    }
  }

  Future<void> _onSignUp(
    _SignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final user = await _signUpUseCase(
        email: event.email,
        password: event.password,
        fullName: event.fullName,
        role: event.role,
        siteId: event.siteId,
        orgId: event.orgId,
      );
      emit(AuthState.authenticated(user: user));
    } catch (e) {
      emit(const AuthState.unauthenticated(errorKey: 'signUpFailed'));
    }
  }
}
