import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/widgets/apartment_card.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_bloc.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_event.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_state.dart';

class TenantDashboard extends StatefulWidget {
  const TenantDashboard({super.key});

  @override
  State<TenantDashboard> createState() => _TenantDashboardState();
}

class _TenantDashboardState extends State<TenantDashboard> {
  late final TenantApartmentBloc _apartmentBloc;

  @override
  void initState() {
    super.initState();
    _apartmentBloc = DependencyInjector.instance.resolve<TenantApartmentBloc>();

    // Load apartments for the current tenant
    context.read<AuthBloc>().state.whenOrNull(
      authenticated: (user) {
        _apartmentBloc.add(TenantApartmentEvent.load(user.uid));
      },
    );
  }

  @override
  void dispose() {
    _apartmentBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _apartmentBloc,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final fullName = authState.maybeWhen(
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
                    l10n.tenantDashboard,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(fullName),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.history_rounded),
                  tooltip: l10n.guestHistory,
                  onPressed: () => context.push(AppRoutes.guestInvitationList),
                ),
                IconButton(
                  icon: const Icon(Icons.settings_rounded),
                  onPressed: () => context.push(AppRoutes.settings),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => context.push(AppRoutes.createGuestInvitation),
              label: Text(l10n.inviteGuest),
              icon: const Icon(Icons.person_add_rounded),
            ),
            child: BlocBuilder<TenantApartmentBloc, TenantApartmentState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (apartments) {
                    if (apartments.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apartment_rounded,
                              size: 64,
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.2,
                              ),
                            ),
                            AppSpacing.gapH24,
                            Text(
                              l10n.noApartments,
                              style: theme.textTheme.titleMedium,
                            ),
                            AppSpacing.gapH8,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Text(
                                l10n.contactAdminToAssign,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(AppSpacing.p16),
                      itemCount: apartments.length,
                      itemBuilder: (context, index) {
                        final apartment = apartments[index];
                        return ApartmentCard(
                          apartment: apartment,
                          condo: null,
                          showCondoName: true,
                        );
                      },
                    );
                  },
                  error: (message) => Center(
                    child: Text(message),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
