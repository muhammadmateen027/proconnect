import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final fullName = state.maybeWhen(
          authenticated: (user) => user.fullName,
          orElse: () => '',
        );

        return ProConnectLayout(
          useGlass: false,
          useScrolling: false,
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.superAdminDashboard,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(fullName),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => context.push(AppRoutes.settings),
              ),
            ],
          ),
          child: GridView.count(
            padding: const EdgeInsets.all(24),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              DashboardCard(
                title: l10n.condoManagement,
                icon: Icons.business,
                onTap: () => context.push(AppRoutes.condoManagement),
              ),
              DashboardCard(
                title: l10n.userManagement,
                icon: Icons.people,
                onTap: () => context.push(AppRoutes.userManagement),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        Colors.white.withValues(alpha: 0.12),
                        Colors.white.withValues(alpha: 0.04),
                      ]
                    : [
                        Colors.white.withValues(alpha: 0.7),
                        Colors.white.withValues(alpha: 0.35),
                      ],
              ),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.secondary,
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  AppSpacing.gapH20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
