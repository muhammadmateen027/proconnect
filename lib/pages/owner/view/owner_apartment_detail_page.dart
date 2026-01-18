import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/glass_card.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/owner/bloc/apartment_detail/owner_apartment_detail_bloc.dart';
import 'package:proconnect/pages/owner/widgets/assign_tenant_dialog.dart';
import 'package:proconnect/pages/owner/widgets/lease_management_dialog.dart';
import 'package:proconnect/pages/owner/widgets/rental_price_dialog.dart';

class OwnerApartmentDetailPage extends StatelessWidget {
  const OwnerApartmentDetailPage({
    required this.apartment,
    super.key,
  });

  final Apartment apartment;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ProConnectLayout(
      useGlass: false,
      appBar: AppBar(
        title: Text('${l10n.unit} ${apartment.apartmentNumber}'),
      ),
      child: BlocConsumer<OwnerApartmentDetailBloc, OwnerApartmentDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: theme.colorScheme.error,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final currentApartment = state.maybeWhen(
            loaded: (apt) => apt,
            orElse: () => apartment,
          );

          final isLoading = state.maybeWhen(
            loading: () => true,
            updating: () => true,
            orElse: () => false,
          );

          if (state.maybeWhen(loading: () => true, orElse: () => false)) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.p32),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ApartmentInfoSection(apartment: currentApartment),
                AppSpacing.gapH16,
                _TenantSection(
                  apartment: currentApartment,
                  isLoading: isLoading,
                ),
                AppSpacing.gapH16,
                _LeaseSection(
                  apartment: currentApartment,
                  isLoading: isLoading,
                ),
                AppSpacing.gapH16,
                _RentalSection(
                  apartment: currentApartment,
                  isLoading: isLoading,
                ),
                AppSpacing.gapH16,
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ApartmentInfoSection extends StatelessWidget {
  const _ApartmentInfoSection({required this.apartment});

  final Apartment apartment;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.apartmentDetails,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.gapH16,
          _InfoRow(
            icon: Icons.bed_rounded,
            label: l10n.bedrooms,
            value: '${apartment.totalBedrooms}',
          ),
          AppSpacing.gapH12,
          _InfoRow(
            icon: Icons.bathtub_rounded,
            label: l10n.bathrooms,
            value: '${apartment.totalBathrooms}',
          ),
          AppSpacing.gapH12,
          _InfoRow(
            icon: Icons.square_foot_rounded,
            label: l10n.apartmentSize,
            value: '${apartment.totalSizeSquareFeet.toInt()} sqft',
          ),
          AppSpacing.gapH12,
          _InfoRow(
            icon: Icons.chair_rounded,
            label: l10n.furnishingStatus,
            value: _getFurnishingLabel(context, apartment.furnishing),
          ),
          if (apartment.condoName != null) ...[
            AppSpacing.gapH12,
            _InfoRow(
              icon: Icons.business_rounded,
              label: 'Condominium',
              value: apartment.condoName!,
            ),
          ],
        ],
      ),
    );
  }

  String _getFurnishingLabel(BuildContext context, FurnishingStatus status) {
    final l10n = context.l10n;
    switch (status) {
      case FurnishingStatus.unfurnished:
        return l10n.unfurnished;
      case FurnishingStatus.partiallyFurnished:
        return l10n.partiallyFurnished;
      case FurnishingStatus.fullyFurnished:
        return l10n.fullyFurnished;
    }
  }
}

class _TenantSection extends StatelessWidget {
  const _TenantSection({
    required this.apartment,
    required this.isLoading,
  });

  final Apartment apartment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final hasTenant = apartment.tenantName != null;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.tenantInformation,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (hasTenant)
                IconButton(
                  icon: const Icon(Icons.delete_outline_rounded),
                  onPressed: isLoading
                      ? null
                      : () => _showRemoveTenantDialog(context),
                  color: theme.colorScheme.error,
                ),
            ],
          ),
          AppSpacing.gapH16,
          if (hasTenant) ...[
            _InfoRow(
              icon: Icons.person_rounded,
              label: l10n.tenant,
              value: apartment.tenantName!,
            ),
            if (apartment.tenantEmail != null) ...[
              AppSpacing.gapH12,
              _InfoRow(
                icon: Icons.email_rounded,
                label: l10n.email,
                value: apartment.tenantEmail!,
              ),
            ],
            if (apartment.tenantPhone != null) ...[
              AppSpacing.gapH12,
              _InfoRow(
                icon: Icons.phone_rounded,
                label: 'Phone',
                value: apartment.tenantPhone!,
              ),
            ],
          ] else ...[
            Text(
              l10n.noTenant,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          AppSpacing.gapH16,
          AppButton(
            onPressed: isLoading
                ? null
                : () => _showAssignTenantDialog(context),
            label: hasTenant ? 'Update Tenant' : l10n.assignTenant,
            icon: hasTenant ? Icons.edit_rounded : Icons.person_add_rounded,
            type: AppButtonType.outlined,
            expand: true,
          ),
        ],
      ),
    );
  }

  void _showAssignTenantDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: context.read<OwnerApartmentDetailBloc>(),
        child: AssignTenantDialog(apartment: apartment),
      ),
    );
  }

  void _showRemoveTenantDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.removeTenant),
        content: const Text(
          'Are you sure you want to remove the current tenant?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            child: Text(context.l10n.removeTenant),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed ?? false) {
        context.read<OwnerApartmentDetailBloc>().add(
          OwnerApartmentDetailEvent.removeTenant(apartment.id),
        );
      }
    });
  }
}

class _LeaseSection extends StatelessWidget {
  const _LeaseSection({
    required this.apartment,
    required this.isLoading,
  });

  final Apartment apartment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final hasLease = apartment.leaseStartDate != null;

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.leaseInformation,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.gapH16,
          if (hasLease) ...[
            _InfoRow(
              icon: Icons.calendar_today_rounded,
              label: l10n.leaseStart,
              value: _formatDate(apartment.leaseStartDate!),
            ),
            if (apartment.leaseEndDate != null) ...[
              AppSpacing.gapH12,
              _InfoRow(
                icon: Icons.event_rounded,
                label: l10n.leaseEnd,
                value: _formatDate(apartment.leaseEndDate!),
              ),
            ],
            if (apartment.rentDueDay != null) ...[
              AppSpacing.gapH12,
              _InfoRow(
                icon: Icons.payment_rounded,
                label: 'Rent Due Day',
                value: 'Day ${apartment.rentDueDay}',
              ),
            ],
          ] else ...[
            Text(
              l10n.noLease,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          AppSpacing.gapH16,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: isLoading ? null : () => _showLeaseDialog(context),
                  label: hasLease ? 'Update Lease' : l10n.startLease,
                  icon: Icons.description_rounded,
                  type: AppButtonType.outlined,
                  expand: true,
                ),
              ),
              if (hasLease) ...[
                AppSpacing.gapW12,
                Expanded(
                  child: AppButton(
                    onPressed: isLoading
                        ? null
                        : () => _showEndLeaseDialog(context),
                    label: l10n.endLease,
                    icon: Icons.cancel_rounded,
                    type: AppButtonType.outlined,
                    expand: true,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showLeaseDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: context.read<OwnerApartmentDetailBloc>(),
        child: LeaseManagementDialog(apartment: apartment),
      ),
    );
  }

  void _showEndLeaseDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.endLease),
        content: const Text('Are you sure you want to end the current lease?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            child: Text(context.l10n.endLease),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed ?? false) {
        context.read<OwnerApartmentDetailBloc>().add(
          OwnerApartmentDetailEvent.endLease(apartment.id),
        );
      }
    });
  }
}

class _RentalSection extends StatelessWidget {
  const _RentalSection({
    required this.apartment,
    required this.isLoading,
  });

  final Apartment apartment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.rentalInformation,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.gapH16,
          if (apartment.monthlyRent != null) ...[
            _InfoRow(
              icon: Icons.attach_money_rounded,
              label: l10n.monthlyRent,
              value: 'RM ${apartment.monthlyRent!.toStringAsFixed(2)}',
            ),
          ],
          if (apartment.securityDeposit != null) ...[
            AppSpacing.gapH12,
            _InfoRow(
              icon: Icons.account_balance_wallet_rounded,
              label: l10n.securityDeposit,
              value: 'RM ${apartment.securityDeposit!.toStringAsFixed(2)}',
            ),
          ],
          if (apartment.monthlyRent == null &&
              apartment.securityDeposit == null) ...[
            Text(
              'No rental information set',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          AppSpacing.gapH16,
          AppButton(
            onPressed: isLoading ? null : () => _showRentalPriceDialog(context),
            label: l10n.updateRentalPrice,
            icon: Icons.edit_rounded,
            type: AppButtonType.outlined,
            expand: true,
          ),
        ],
      ),
    );
  }

  void _showRentalPriceDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: context.read<OwnerApartmentDetailBloc>(),
        child: RentalPriceDialog(apartment: apartment),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
        AppSpacing.gapW12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
