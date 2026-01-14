import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/app/view/home_screen_wrapper.dart';
import 'package:proconnect/core/widgets/auth_background.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/auth/view/login_screen.dart';
import 'package:proconnect/pages/auth/view/registration_screen.dart';
import 'package:proconnect/pages/owner/view/add_unit_page.dart';
import 'package:proconnect/pages/settings/view/settings_screen.dart';

// A helper class to make GoRouter listen to a BLoC stream
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// The router creation function
GoRouter createRouter(BuildContext context) {
  final authBloc = context.read<AuthBloc>();

  return GoRouter(
    // This tells the router to re-evaluate the redirect whenever the AuthBloc emits a new state.
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreenWrapper(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        // Use push for this route in your UI
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.addUnit,
        builder: (context, state) => const AddUnitPage(),
      ),
      // A dedicated splash screen route
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const AuthBackground(
          child: Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final authState = authBloc.state;
      final location = state.matchedLocation;

      // Check if the current route is one of the authentication routes
      final isAuthRoute =
          location == AppRoutes.login || location == AppRoutes.register;

      return authState.when(
        // While the auth state is being determined, show the splash screen
        initial: () => AppRoutes.splash,
        loading: () => AppRoutes.splash,

        // When the user is authenticated
        authenticated: (user) {
          // If they are on the splash screen or an auth route, redirect them to home
          if (location == AppRoutes.splash || isAuthRoute) {
            return AppRoutes.home;
          }
          // Otherwise, let them stay where they are
          return null;
        },

        // When the user is not authenticated
        unauthenticated: (message) {
          // If they are not on an auth route, redirect them to the login page
          return isAuthRoute ? null : AppRoutes.login;
        },
      );
    },
  );
}
