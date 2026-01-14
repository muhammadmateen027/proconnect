import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/auth/bloc/auth_bloc.dart';
import 'package:proconnect/auth/domain/usecase/get_auth_status_stream_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_in_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_out_use_case.dart';
import 'package:proconnect/auth/domain/usecase/sign_up_use_case.dart';
import 'package:proconnect/core/services/dependency_injector.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dependencyInjector = DependencyInjector.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            signInUseCase: dependencyInjector.resolve<SignInUseCase>(),
            signOutUseCase: dependencyInjector.resolve<SignOutUseCase>(),
            getAuthStatusStreamUseCase: dependencyInjector
                .resolve<GetAuthStatusStreamUseCase>(),
            signUpUseCase: dependencyInjector.resolve<SignUpUseCase>(),
          )..add(const AuthEvent.checkAuthentication()),
        ),
      ],
      child: child,
    );
  }
}
