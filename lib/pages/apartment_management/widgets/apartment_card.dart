import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_bloc.dart';
import 'package:proconnect/pages/apartment_management/widgets/apartment_dialogs.dart';

/// Apartment Card Widget
class ApartmentCard extends StatelessWidget {
  const ApartmentCard({
    required this.apartment,
    required this.condo,
    super.key,
  });

  final Apartment apartment;
  final Condo condo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: theme.brightness == Brightness.dark
                    ? [
                        Colors.white.withValues(alpha: 0.12),
                        Colors.white.withValues(alpha: 0.04),
                      ]
                    : [
                        Colors.white.withValues(alpha: 0.75),
                        Colors.white.withValues(alpha: 0.4),
                      ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: theme.brightness == Brightness.dark
                    ? Colors.white.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.p16,
                          vertical: AppSpacing.p8,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.primary,
                              theme.colorScheme.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          apartment.apartmentNumber,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AppSpacing.gapW16,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _StatusChip(status: apartment.status),
                            if (apartment.ownerName != null) ...[
                              AppSpacing.gapH4,
                              Text(
                                '${l10n.owner}: ${apartment.ownerName}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      _ActionMenu(apartment: apartment, condo: condo),
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
                    AppSpacing.gapH16,
                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.outlineVariant.withValues(
                              alpha: 0,
                            ),
                            theme.colorScheme.outlineVariant.withValues(
                              alpha: 0.5,
                            ),
                            theme.colorScheme.outlineVariant.withValues(
                              alpha: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
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
          ),
        ),
      ),
    );
  }
}

class _ActionMenu extends StatelessWidget {
  const _ActionMenu({
    required this.apartment,
    required this.condo,
  });

  final Apartment apartment;
  final Condo condo;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'edit') {
          context.push(
            AppRoutes.editApartment,
            extra: {'condo': condo, 'apartment': apartment},
          );
        } else if (value == 'delete') {
          showDialog<void>(
            context: context,
            builder: (dialogContext) => BlocProvider.value(
              value: context.read<ApartmentBloc>(),
              child: DeleteApartmentDialog(
                condominiumId: condo.id,
                apartmentId: apartment.id,
              ),
            ),
          );
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit',
          child: ListTile(
            leading: const Icon(Icons.edit_rounded, size: 20),
            title: Text(l10n.edit),
            contentPadding: EdgeInsets.zero,
            dense: true,
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: ListTile(
            leading: Icon(
              Icons.delete_outline_rounded,
              size: 20,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              l10n.delete,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            contentPadding: EdgeInsets.zero,
            dense: true,
          ),
        ),
      ],
      icon: const Icon(Icons.more_vert_rounded),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
