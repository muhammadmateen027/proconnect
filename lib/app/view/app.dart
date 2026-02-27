import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/src/router.dart';
import 'package:proconnect/app/router.dart';
import 'package:proconnect/core/l10n/bloc/l10n_bloc.dart';
import 'package:proconnect/core/theme/app_theme.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/l10n/gen/app_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router = createRouter(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<L10nBloc, L10nState>(
          builder: (context, l10nState) {
            return MaterialApp.router(
              routerConfig: _router,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeState.themeMode,
              locale: l10nState.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        );
      },
    );
  }
}
