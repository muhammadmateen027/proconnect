import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:proconnect/auth/bloc/auth_bloc.dart';
import 'package:proconnect/auth/data/datasource/auth_remote_data_source.dart';
import 'package:proconnect/auth/data/repository/auth_repository_impl.dart';
import 'package:proconnect/auth/domain/repository/auth_repository.dart';
import 'package:proconnect/auth/domain/usecase/get_auth_status_stream_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_in_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_out_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_up_use_case.dart';
import 'package:proconnect/core/config/environment.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/core/theme/repository/theme_repository.dart';

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
      ..registerSingleton<ThemeRepository>((c) => ThemeRepository());
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
  }
}
