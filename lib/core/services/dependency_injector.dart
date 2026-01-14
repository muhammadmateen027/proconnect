import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:proconnect/core/config/environment.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/core/theme/repository/theme_repository.dart';
import 'package:proconnect/data/auth/datasource/auth_remote_data_source.dart';
import 'package:proconnect/data/auth/repository/auth_repository_impl.dart';
import 'package:proconnect/data/unit/datasource/unit_remote_data_source.dart';
import 'package:proconnect/data/unit/repository/unit_repository_impl.dart';
import 'package:proconnect/domain/auth/repository/auth_repository.dart';
import 'package:proconnect/domain/auth/usecase/get_auth_status_stream_use_case.dart';
import 'package:proconnect/domain/auth/usecase/sign_in_use_case.dart';
import 'package:proconnect/domain/auth/usecase/sign_out_use_case.dart';
import 'package:proconnect/domain/auth/usecase/sign_up_use_case.dart';
import 'package:proconnect/domain/unit/repository/unit_repository.dart';
import 'package:proconnect/domain/unit/usecase/add_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/delete_unit_use_case.dart';
import 'package:proconnect/domain/unit/usecase/get_units_use_case.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';

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
        (c) => AuthRepositoryImpl(c.resolve()),
      )
      ..registerSingleton<ThemeRepository>((c) => ThemeRepository())
      ..registerSingleton<UnitRemoteDataSource>(
        (c) => UnitRemoteDataSourceImpl(),
      )
      ..registerSingleton<UnitRepository>(
        (c) => UnitRepositoryImpl(c.resolve()),
      );
  }

  void _setupUseCases() {
    _container
      ..registerSingleton<SignInUseCase>(
        (c) => SignInUseCase(c.resolve()),
      )
      ..registerSingleton<SignOutUseCase>(
        (c) => SignOutUseCase(c.resolve()),
      )
      ..registerSingleton<GetAuthStatusStreamUseCase>(
        (c) => GetAuthStatusStreamUseCase(c.resolve()),
      )
      ..registerSingleton<SignUpUseCase>(
        (c) => SignUpUseCase(c.resolve()),
      )
      ..registerSingleton<GetUnitsUseCase>(
        (c) => GetUnitsUseCase(c.resolve()),
      )
      ..registerSingleton<AddUnitUseCase>(
        (c) => AddUnitUseCase(c.resolve()),
      )
      ..registerSingleton<DeleteUnitUseCase>(
        (c) => DeleteUnitUseCase(c.resolve()),
      );
  }

  void _setupBlocs() {
    _container.registerFactory<AuthBloc>(
      (c) => AuthBloc(
        signInUseCase: c.resolve(),
        signOutUseCase: c.resolve(),
        getAuthStatusStreamUseCase: c.resolve(),
        signUpUseCase: c.resolve(),
      ),
    );
    _container.registerFactory<ThemeBloc>(
      (c) => ThemeBloc(c.resolve()),
    );
    _container.registerFactory<UnitBloc>(
      (c) => UnitBloc(c.resolve(), c.resolve(), c.resolve()),
    );
  }
}
