import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/app/view/home_screen_wrapper.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/auth/view/login_screen.dart';
import 'package:proconnect/pages/auth/view/registration_screen.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';
import 'package:proconnect/pages/condo_management/view/condo_management_page.dart';
import 'package:proconnect/pages/condo_management/view/create_edit_condo_page.dart';
import 'package:proconnect/pages/owner/view/add_unit_page.dart';
import 'package:proconnect/pages/owner/view/unit_detail_screen.dart';
import 'package:proconnect/pages/settings/view/settings_screen.dart';
import 'package:proconnect/pages/super_admin/bloc/user_management/user_management_bloc.dart';
import 'package:proconnect/pages/super_admin/view/create_user_page.dart';
import 'package:proconnect/pages/super_admin/view/super_admin_dashboard.dart';
import 'package:proconnect/pages/super_admin/view/user_management_page.dart';
import 'package:proconnect/pages/apartment_management/view/apartment_management_page.dart';
import 'package:proconnect/pages/apartment_management/view/create_edit_apartment_page.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_event.dart';

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
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.addUnit,
        builder: (context, state) => const AddUnitPage(),
      ),
      GoRoute(
        path: AppRoutes.unitDetail,
        builder: (context, state) {
          final unit = state.extra! as Unit;
          return UnitDetailScreen(unit: unit);
        },
      ),
      GoRoute(
        path: AppRoutes.superAdminDashboard,
        builder: (context, state) => const SuperAdminDashboard(),
      ),
      GoRoute(
        path: AppRoutes.userManagement,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              DependencyInjector.instance.resolve<UserManagementBloc>(),
          child: const UserManagementPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.createUser,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              DependencyInjector.instance.resolve<UserManagementBloc>(),
          child: const CreateUserPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.condoManagement,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              DependencyInjector.instance.resolve<CondoManagementBloc>(),
          child: const CondoManagementPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.createCondo,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              DependencyInjector.instance.resolve<CondoManagementBloc>(),
          child: const CreateEditCondoPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.editCondo,
        builder: (context, state) {
          final condo = state.extra! as Condo;
          return BlocProvider(
            create: (context) =>
                DependencyInjector.instance.resolve<CondoManagementBloc>(),
            child: CreateEditCondoPage(
              condo: condo,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.apartmentManagement,
        builder: (context, state) {
          final condo = state.extra! as Condo;
          return ApartmentManagementPage(condo: condo);
        },
      ),
      GoRoute(
        path: AppRoutes.createApartment,
        builder: (context, state) {
          final condo = state.extra! as Condo;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    DependencyInjector.instance.resolve<ApartmentBloc>(),
              ),
              BlocProvider(
                create: (context) =>
                    DependencyInjector.instance.resolve<FloorBloc>()
                      ..add(FloorEvent.loadFloors(condominiumId: condo.id)),
              ),
            ],
            child: CreateEditApartmentPage(condo: condo),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.editApartment,
        builder: (context, state) {
          final extras = state.extra! as Map<String, dynamic>;
          final condo = extras['condo'] as Condo;
          final apartment = extras['apartment'] as Apartment;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    DependencyInjector.instance.resolve<ApartmentBloc>(),
              ),
              BlocProvider(
                create: (context) =>
                    DependencyInjector.instance.resolve<FloorBloc>()
                      ..add(FloorEvent.loadFloors(condominiumId: condo.id)),
              ),
            ],
            child: CreateEditApartmentPage(condo: condo, apartment: apartment),
          );
        },
      ),
      // A dedicated splash screen route
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const ProConnectLayout(
          useGlass: false,
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
