import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dependencyInjector = DependencyInjector.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              dependencyInjector.resolve<AuthBloc>()
                ..add(const AuthEvent.checkAuthentication()),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) =>
              dependencyInjector.resolve<ThemeBloc>()..add(ThemeLoadStarted()),
        ),
      ],
      child: child,
    );
  }
}
