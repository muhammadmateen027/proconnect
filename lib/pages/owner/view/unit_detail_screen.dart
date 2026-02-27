import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
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
      child: ProConnectLayout(
        useGlass: false,
        useScrolling: false,
        appBar: AppBar(
          title: Text('Unit ${unit.unitNo}'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BlocProvider.value(
                value: context.read<UnitBloc>(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(alpha: 0.8),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    child: TenantAssignmentSheet(unit: unit),
                  ),
                ),
              ),
            );
          },
          label: const Text('Assign Tenant'),
          icon: const Icon(Icons.person_add_alt_1_rounded),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(24),
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
                              Colors.white.withValues(alpha: 0.7),
                              Colors.white.withValues(alpha: 0.35),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white.withValues(alpha: 0.15)
                          : Colors.white.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rental Summary',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 2,
                        width: 40,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      const SizedBox(height: 24),
                      UnitDetailRow(
                        icon: Icons.attach_money_rounded,
                        label: 'Monthly Rent',
                        value: unit.monthlyRent != null
                            ? NumberFormat.currency(
                                symbol: 'RM ',
                              ).format(unit.monthlyRent)
                            : 'Not set',
                      ),
                      UnitDetailRow(
                        icon: Icons.calendar_today_rounded,
                        label: 'Lease Period',
                        value: _formatLeasePeriod(unit),
                      ),
                      UnitDetailRow(
                        icon: Icons.person_rounded,
                        label: 'Tenant Name',
                        value: unit.tenantName ?? 'Not Occupied',
                      ),
                      UnitDetailRow(
                        icon: Icons.phone_rounded,
                        label: 'Tenant Phone',
                        value: unit.tenantPhone ?? 'Not set',
                      ),
                      UnitDetailRow(
                        icon: Icons.email_rounded,
                        label: 'Tenant Email',
                        value: unit.tenantEmail ?? 'Not set',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 20),
          ),
          AppSpacing.gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    letterSpacing: 0.2,
                  ),
                ),
                Text(
                  value,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
