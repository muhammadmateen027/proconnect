import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proconnect/domain/admin/usecase/admin_create_user_use_case.dart';
import 'package:proconnect/domain/admin/usecase/admin_delete_user_use_case.dart';
import 'package:proconnect/domain/admin/usecase/admin_update_user_use_case.dart';
import 'package:proconnect/domain/models/app_user.dart';

part 'user_management_bloc.freezed.dart';
part 'user_management_event.dart';
part 'user_management_state.dart';

class UserManagementBloc
    extends Bloc<UserManagementEvent, UserManagementState> {
  UserManagementBloc({
    required AdminCreateUserUseCase adminCreateUserUseCase,
    required AdminUpdateUserUseCase adminUpdateUserUseCase,
    required AdminDeleteUserUseCase adminDeleteUserUseCase,
  })  : _adminCreateUserUseCase = adminCreateUserUseCase,
        _adminUpdateUserUseCase = adminUpdateUserUseCase,
        _adminDeleteUserUseCase = adminDeleteUserUseCase,
        super(const UserManagementState.initial()) {
    on<_AdminCreateUser>(_onAdminCreateUser);
    on<_AdminUpdateUser>(_onAdminUpdateUser);
    on<_AdminDeleteUser>(_onAdminDeleteUser);
  }

  final AdminCreateUserUseCase _adminCreateUserUseCase;
  final AdminUpdateUserUseCase _adminUpdateUserUseCase;
  final AdminDeleteUserUseCase _adminDeleteUserUseCase;

  Future<void> _onAdminCreateUser(
    _AdminCreateUser event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(const UserManagementState.loading());
    try {
      await _adminCreateUserUseCase(
        email: event.email,
        password: event.password,
        fullName: event.fullName,
        role: event.role,
        condominiumId: event.condominiumId,
        agencyId: event.agencyId,
      );
      emit(const UserManagementState.success());
    } catch (e) {
      emit(const UserManagementState.failure(
        errorKey: 'createUserFailed',
      ));
    }
  }

  Future<void> _onAdminUpdateUser(
    _AdminUpdateUser event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(const UserManagementState.loading());
    try {
      await _adminUpdateUserUseCase(
        user: event.user,
      );
      emit(const UserManagementState.success());
    } catch (e) {
      emit(const UserManagementState.failure(
        errorKey: 'updateUserFailed',
      ));
    }
  }

  Future<void> _onAdminDeleteUser(
    _AdminDeleteUser event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(const UserManagementState.loading());
    try {
      await _adminDeleteUserUseCase(
        uid: event.uid,
      );
      emit(const UserManagementState.success());
    } catch (e) {
      emit(const UserManagementState.failure(
        errorKey: 'deleteUserFailed',
      ));
    }
  }
}
