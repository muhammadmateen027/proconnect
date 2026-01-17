import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/l10n/bloc/l10n_bloc.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';

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
        BlocProvider<L10nBloc>(
          create: (context) =>
              dependencyInjector.resolve<L10nBloc>()..add(L10nLoadStarted()),
        ),
        BlocProvider<UnitBloc>(
          create: (context) => dependencyInjector.resolve<UnitBloc>(),
        ),
      ],
      child: child,
    );
  }
}
