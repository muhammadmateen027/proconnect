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
import 'package:proconnect/pages/owner/bloc/apartment/owner_apartment_bloc.dart';

class OwnerDashboard extends StatefulWidget {
  const OwnerDashboard({super.key});

  @override
  State<OwnerDashboard> createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
  late final OwnerApartmentBloc _apartmentBloc;

  @override
  void initState() {
    super.initState();
    _apartmentBloc = DependencyInjector.instance.resolve<OwnerApartmentBloc>();

    // Load apartments for the current user
    context.read<AuthBloc>().state.whenOrNull(
      authenticated: (user) {
        _apartmentBloc.add(OwnerApartmentEvent.loadApartments(user.uid));
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
                    l10n.ownerDashboard,
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
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                // TODO: Implement guest invitation logic
              },
              label: Text(l10n.inviteGuest),
              icon: const Icon(Icons.person_add),
            ),
            child: BlocBuilder<OwnerApartmentBloc, OwnerApartmentState>(
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
                              Icons.apartment_outlined,
                              size: 64,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            AppSpacing.gapH16,
                            Text(
                              'No apartments assigned',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            AppSpacing.gapH8,
                            Text(
                              'Contact your agency admin to get apartments assigned to you',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: apartments.length,
                      itemBuilder: (context, index) {
                        final apartment = apartments[index];
                        // Get the condo from the apartment's condominiumId
                        // For now, we'll create a minimal Condo object
                        // In a production app, you'd fetch this from the repository
                        return ApartmentCard(
                          apartment: apartment,
                          condo:
                              null, // We'll pass null since we have condoName in apartment
                          showCondoName: true,
                        );
                      },
                    );
                  },
                  error: (message) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: theme.colorScheme.error,
                        ),
                        AppSpacing.gapH16,
                        Text(
                          '${l10n.errorPrefix}$message',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
