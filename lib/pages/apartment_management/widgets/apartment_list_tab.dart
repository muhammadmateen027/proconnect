import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_state.dart';

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
                return _ApartmentCard(apartment: apartment);
              },
            );
          },
          success: (_) => const Center(child: CircularProgressIndicator()),
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
    final l10n = context.l10n;

    // TODO: Implement apartment creation dialog
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${l10n.addApartment} feature coming soon!'),
      ),
    );
  }
}

/// Apartment Card Widget
class _ApartmentCard extends StatelessWidget {
  const _ApartmentCard({
    required this.apartment,
  });

  final Apartment apartment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.p12,
                    vertical: AppSpacing.p8,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    apartment.apartmentNumber,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppSpacing.gapW12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _StatusChip(status: apartment.status),
                      if (apartment.ownerName != null) ...[
                        AppSpacing.gapH4,
                        Text(
                          '${l10n.owner}: ${apartment.ownerName}',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            AppSpacing.gapH16,
            Row(
              children: [
                _InfoChip(
                  icon: Icons.bed_rounded,
                  label: '${apartment.totalBedrooms} ${l10n.bedrooms}',
                ),
                AppSpacing.gapW8,
                _InfoChip(
                  icon: Icons.bathtub_rounded,
                  label: '${apartment.totalBathrooms} ${l10n.bathrooms}',
                ),
                AppSpacing.gapW8,
                _InfoChip(
                  icon: Icons.square_foot_rounded,
                  label: '${apartment.totalSizeSquareFeet.toInt()} sqft',
                ),
              ],
            ),
            if (apartment.monthlyRent != null) ...[
              AppSpacing.gapH12,
              Text(
                '${l10n.monthlyRent}: RM ${apartment.monthlyRent!.toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Status Chip Widget
class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.status,
  });

  final ApartmentStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    Color getStatusColor() {
      switch (status) {
        case ApartmentStatus.vacant:
          return AppColors.success;
        case ApartmentStatus.occupied:
          return AppColors.info;
        case ApartmentStatus.maintenance:
          return AppColors.warning;
        case ApartmentStatus.reserved:
          return theme.colorScheme.tertiary;
      }
    }

    String getStatusLabel() {
      switch (status) {
        case ApartmentStatus.vacant:
          return l10n.vacant;
        case ApartmentStatus.occupied:
          return l10n.occupied;
        case ApartmentStatus.maintenance:
          return l10n.maintenance;
        case ApartmentStatus.reserved:
          return l10n.reserved;
      }
    }

    final color = getStatusColor();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.p8,
        vertical: AppSpacing.p4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        getStatusLabel(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// Info Chip Widget
class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.p8,
        vertical: AppSpacing.p4,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
          AppSpacing.gapW4,
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
