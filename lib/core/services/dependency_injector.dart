import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:proconnect/core/config/environment.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/core/theme/repository/theme_repository.dart';
import 'package:proconnect/data/auth/datasource/auth_remote_data_source.dart';
import 'package:proconnect/data/auth/repository/auth_repository_impl.dart';
import 'package:proconnect/data/condo/datasource/condo_remote_data_source.dart';
import 'package:proconnect/data/condo/repository/condo_repository_impl.dart';
import 'package:proconnect/data/unit/datasource/unit_remote_data_source.dart';
import 'package:proconnect/data/unit/repository/unit_repository_impl.dart';
import 'package:proconnect/domain/admin/usecase/admin_create_user_use_case.dart';
import 'package:proconnect/domain/admin/usecase/admin_delete_user_use_case.dart';
import 'package:proconnect/domain/admin/usecase/admin_update_user_use_case.dart';
import 'package:proconnect/domain/admin/usecase/create_condo_use_case.dart';
import 'package:proconnect/domain/admin/usecase/delete_condo_use_case.dart';
import 'package:proconnect/domain/admin/usecase/get_users_use_case.dart';
import 'package:proconnect/domain/admin/usecase/load_condos_use_case.dart';
import 'package:proconnect/domain/admin/usecase/update_condo_use_case.dart';
import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/auth/usecase/get_auth_status_stream_use_case.dart';
import 'package:proconnect/domain/auth/usecase/sign_in_use_case.dart';
import 'package:proconnect/domain/auth/usecase/sign_out_use_case.dart';
import 'package:proconnect/domain/auth/usecase/sign_up_use_case.dart';
import 'package:proconnect/domain/condo/repository/condo_repository.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';
import 'package:proconnect/domain/unit/usecase/add_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/delete_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/get_units_use_case.dart';
import 'package:proconnect/domain/unit/usecase/update_unit_tenant_details_use_case.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';
import 'package:proconnect/pages/super_admin/bloc/condo_management/condo_management_bloc.dart';
import 'package:proconnect/pages/super_admin/bloc/user_management/user_management_bloc.dart';

class DependencyInjector {
  DependencyInjector._();

  static final DependencyInjector _instance = DependencyInjector._();
  final KiwiContainer _container = KiwiContainer();

  static DependencyInjector get instance => _instance;

  T resolve<T>([String? name]) => _container.resolve<T>(name);

  void registerInstance<T>(T instance, {String? name}) =>
      _container.registerInstance(instance, name: name);

  Future<void> initialize(Environment env) async {
    _setupRepositories();
    _setupUseCases();
    _setupBlocs();
  }

  @visibleForTesting
  void unregister<T>([String? name]) {
    _container.unregister<T>(name);
  }

  @visibleForTesting
  void dispose() {
    _container.clear();
  }

  void _setupRepositories() {
    _container
      ..registerSingleton<AuthRemoteDataSource>(
        (c) => AuthRemoteDataSourceImpl(),
      )
      ..registerSingleton<AuthRepository>(
        (c) => AuthRepositoryImpl(c.resolve<AuthRemoteDataSource>()),
      )
      ..registerSingleton<ThemeRepository>((c) => ThemeRepository())
      ..registerSingleton<UnitRemoteDataSource>(
        (c) => UnitRemoteDataSourceImpl(),
      )
      ..registerSingleton<UnitRepository>(
        (c) => UnitRepositoryImpl(c.resolve<UnitRemoteDataSource>()),
      )
      ..registerSingleton<CondoRemoteDataSource>(
        (c) => CondoRemoteDataSourceImpl(),
      )
      ..registerSingleton<CondoRepository>(
        (c) => CondoRepositoryImpl(c.resolve<CondoRemoteDataSource>()),
      );
  }

  void _setupUseCases() {
    _container
      ..registerSingleton<SignInUseCase>(
        (c) => SignInUseCase(c.resolve<AuthRepository>()),
      )
      ..registerSingleton<SignOutUseCase>(
        (c) => SignOutUseCase(c.resolve<AuthRepository>()),
      )
      ..registerSingleton<GetAuthStatusStreamUseCase>(
        (c) => GetAuthStatusStreamUseCase(c.resolve<AuthRepository>()),
      )
      ..registerSingleton<SignUpUseCase>(
        (c) => SignUpUseCase(c.resolve<AuthRepository>()),
      )
      ..registerSingleton<GetUnitsUseCase>(
        (c) => GetUnitsUseCase(c.resolve<UnitRepository>()),
      )
      ..registerSingleton<AddUnitUseCase>(
        (c) => AddUnitUseCase(c.resolve<UnitRepository>()),
      )
      ..registerSingleton<DeleteUnitUseCase>(
        (c) => DeleteUnitUseCase(c.resolve<UnitRepository>()),
      )
      ..registerSingleton<UpdateUnitTenantDetailsUseCase>(
        (c) => UpdateUnitTenantDetailsUseCase(c.resolve<UnitRepository>()),
      )
      ..registerSingleton<AdminCreateUserUseCase>(
        (c) => AdminCreateUserUseCase(c.resolve<AuthRepository>()),
      )
      ..registerSingleton<AdminUpdateUserUseCase>(
        (c) => AdminUpdateUserUseCase(c.resolve<AuthRepository>()),
      )
      ..registerSingleton<AdminDeleteUserUseCase>(
        (c) => AdminDeleteUserUseCase(c.resolve<AuthRepository>()),
      )
      ..registerSingleton<LoadCondosUseCase>(
        (c) => LoadCondosUseCase(c.resolve<CondoRepository>()),
      )
      ..registerSingleton<CreateCondoUseCase>(
        (c) => CreateCondoUseCase(c.resolve<CondoRepository>()),
      )
      ..registerSingleton<UpdateCondoUseCase>(
        (c) => UpdateCondoUseCase(c.resolve<CondoRepository>()),
      )
      ..registerSingleton<DeleteCondoUseCase>(
        (c) => DeleteCondoUseCase(c.resolve<CondoRepository>()),
      )
      ..registerSingleton<GetUsersUseCase>(
        (c) => GetUsersUseCase(c.resolve<AuthRepository>()),
      );
  }

  void _setupBlocs() {
    _container
      ..registerFactory<AuthBloc>(
        (c) => AuthBloc(
          signInUseCase: c.resolve<SignInUseCase>(),
          signOutUseCase: c.resolve<SignOutUseCase>(),
          getAuthStatusStreamUseCase: c.resolve<GetAuthStatusStreamUseCase>(),
          signUpUseCase: c.resolve<SignUpUseCase>(),
        ),
      )
      ..registerFactory<ThemeBloc>(
        (c) => ThemeBloc(c.resolve<ThemeRepository>()),
      )
      ..registerFactory<UnitBloc>(
        (c) => UnitBloc(
          c.resolve<GetUnitsUseCase>(),
          c.resolve<AddUnitUseCase>(),
          c.resolve<DeleteUnitUseCase>(),
          c.resolve<UpdateUnitTenantDetailsUseCase>(),
        ),
      )
      ..registerFactory<UserManagementBloc>(
        (c) => UserManagementBloc(
          adminCreateUserUseCase: c.resolve<AdminCreateUserUseCase>(),
          adminUpdateUserUseCase: c.resolve<AdminUpdateUserUseCase>(),
          adminDeleteUserUseCase: c.resolve<AdminDeleteUserUseCase>(),
          getUsersUseCase: c.resolve<GetUsersUseCase>(),
        ),
      )
      ..registerFactory<CondoManagementBloc>(
        (c) => CondoManagementBloc(
          loadCondosUseCase: c.resolve<LoadCondosUseCase>(),
          createCondoUseCase: c.resolve<CreateCondoUseCase>(),
          updateCondoUseCase: c.resolve<UpdateCondoUseCase>(),
          deleteCondoUseCase: c.resolve<DeleteCondoUseCase>(),
        ),
      );
  }
}
