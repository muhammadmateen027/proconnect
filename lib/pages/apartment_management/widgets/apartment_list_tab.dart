import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_state.dart';
import 'package:proconnect/pages/apartment_management/widgets/apartment_card.dart';

/// Apartment List Tab showing all apartments in a condominium
class ApartmentListTab extends StatelessWidget {
  const ApartmentListTab({
    required this.condo,
    super.key,
  });

  final Condo condo;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocConsumer<ApartmentBloc, ApartmentState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            if (message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            }
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: theme.colorScheme.error,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (apartments) {
            if (apartments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apartment_outlined,
                      size: 64,
                      color: theme.colorScheme.outline,
                    ),
                    AppSpacing.gapH16,
                    Text(
                      l10n.noApartmentsFound,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    AppSpacing.gapH8,
                    Text(
                      'Tap the + button to add an apartment',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.p16),
              itemCount: apartments.length,
              separatorBuilder: (context, index) => AppSpacing.gapH12,
              itemBuilder: (context, index) {
                final apartment = apartments[index];
                return ApartmentCard(apartment: apartment, condo: condo);
              },
            );
          },
          success: (_) => const SizedBox.shrink(),
          failure: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: theme.colorScheme.error,
                ),
                AppSpacing.gapH16,
                Text(
                  message,
                  style: TextStyle(color: theme.colorScheme.error),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.gapH16,
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<ApartmentBloc>().add(
                      ApartmentEvent.loadApartments(
                        condominiumId: condo.id,
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: Text(l10n.retry),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showAddApartmentDialog(BuildContext context, Condo condo) {
    context.push(AppRoutes.createApartment, extra: condo);
  }
}
