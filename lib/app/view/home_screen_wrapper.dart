import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/guard/view/guard_dashboard.dart';
import 'package:proconnect/pages/owner/view/owner_dashboard.dart';
import 'package:proconnect/pages/tenant/view/tenant_dashboard.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _LoadingScreen(),
          loading: () => const _LoadingScreen(),
          authenticated: (user) {
            switch (user.role) {
              case UserRole.guard:
                return const GuardDashboard();
              case UserRole.owner:
                return const OwnerDashboard();
              case UserRole.tenant:
                return const TenantDashboard();
            }
          },
          unauthenticated: (message) {
            // You might want to navigate to the login screen here
            // For now, just showing an error.
            return const Scaffold(
              body: Center(
                child: Text('You are not logged in.'),
              ),
            );
          },
        );
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
