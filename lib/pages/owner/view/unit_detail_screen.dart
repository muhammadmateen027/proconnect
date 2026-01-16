import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';
import 'package:proconnect/pages/owner/view/widgets/tenant_assignment_sheet.dart';

class UnitDetailScreen extends StatelessWidget {
  const UnitDetailScreen({required this.unit, super.key});

  final Unit unit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<UnitBloc, UnitState>(
      listener: (context, state) {
        state.whenOrNull(
          unitUpdateSuccess: () {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Tenant Info Updated!')),
              );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Unit ${unit.unitNo}'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rental Summary', // Should be localized
                      style: theme.textTheme.headlineSmall,
                    ),
                    const Divider(height: 24),
                    UnitDetailRow(
                      icon: Icons.attach_money,
                      label: 'Monthly Rent',
                      value: unit.monthlyRent != null
                          ? NumberFormat.currency(
                              symbol: 'RM ',
                            ).format(unit.monthlyRent)
                          : 'Not set',
                    ),
                    UnitDetailRow(
                      icon: Icons.calendar_today,
                      label: 'Lease Period',
                      value: _formatLeasePeriod(unit),
                    ),
                    UnitDetailRow(
                      icon: Icons.person,
                      label: 'Tenant Name',
                      value: unit.tenantName ?? 'Not Occupied',
                    ),
                    UnitDetailRow(
                      icon: Icons.phone,
                      label: 'Tenant Phone',
                      value: unit.tenantPhone ?? 'Not set',
                    ),
                    UnitDetailRow(
                      icon: Icons.email,
                      label: 'Tenant Email',
                      value: unit.tenantEmail ?? 'Not set',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled:
                  true, // Ensures the sheet is above the keyboard
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (_) => BlocProvider.value(
                value: context.read<UnitBloc>(),
                child: TenantAssignmentSheet(unit: unit),
              ),
            );
          },
          label: const Text('Assign Tenant'), // This should also be localized
          icon: const Icon(Icons.person_add_alt_1),
        ),
      ),
    );
  }

  String _formatLeasePeriod(Unit unit) {
    if (unit.leaseStartDate == null) return 'Not set';
    final start = DateFormat.yMMMd().format(unit.leaseStartDate!);
    if (unit.leaseEndDate == null) return start;
    final end = DateFormat.yMMMd().format(unit.leaseEndDate!);
    return '$start - $end';
  }
}

class UnitDetailRow extends StatelessWidget {
  const UnitDetailRow({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 20),
          AppSpacing.gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.bodySmall),
                Text(value, style: theme.textTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
