import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';
import 'package:proconnect/pages/condo_management/widgets/condo_card_widget.dart';

class CondoManagementPage extends StatefulWidget {
  const CondoManagementPage({super.key});

  @override
  State<CondoManagementPage> createState() => _CondoManagementPageState();
}

class _CondoManagementPageState extends State<CondoManagementPage> {
  @override
  void initState() {
    super.initState();
    _loadCondos();
  }

  void _loadCondos() {
    context.read<CondoManagementBloc>().add(
      const CondoManagementEvent.loadCondos(),
    );
  }

  Future<void> _navigateToCreateCondo() async {
    final result = await context.push<bool>(AppRoutes.createCondo);

    if ((result ?? false) && mounted) {
      _loadCondos();
    }
  }

  Future<void> _navigateToEditCondo(
    String id,
    String name,
    String address,
  ) async {
    final result = await context.push<bool>(
      AppRoutes.editCondo,
      extra: {
        'id': id,
        'name': name,
        'address': address,
      },
    );

    if ((result ?? false) && mounted) {
      _loadCondos();
    }
  }

  Future<void> _deleteCondo(String id, String name) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteCondo),
        content: Text(l10n.deleteCondoConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if ((confirmed ?? false) && mounted) {
      context.read<CondoManagementBloc>().add(
        CondoManagementEvent.deleteCondo(id: id),
      );
    }
  }

  // Debug only: Seed sample condominiums
  Future<void> _seedSampleCondos() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Seed Sample Data'),
        content: const Text(
          'This will create 10 sample condominiums for testing.\n\n'
          'This is a debug-only feature and should be removed before production.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Seed Data'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final bloc = context.read<CondoManagementBloc>();

    // Sample condominium data - Malaysian condominiums
    final sampleCondos = [
      {
        'name': 'Pavilion Residences',
        'address': 'Jalan Bukit Bintang, 55100 Kuala Lumpur, Malaysia',
      },
      {
        'name': 'The Face Suites',
        'address': 'Jalan Sultan Ismail, 50250 Kuala Lumpur, Malaysia',
      },
      {
        'name': 'Tropicana Gardens',
        'address':
            'Persiaran Surian, Kota Damansara, 47810 Petaling Jaya, Selangor',
      },
      {
        'name': 'Setia Sky Residences',
        'address': 'Jalan Tun Razak, 50400 Kuala Lumpur, Malaysia',
      },
      {
        'name': 'The Light Collection',
        'address': 'Jalan Gereja, 10300 George Town, Penang, Malaysia',
      },
      {
        'name': 'Molek Regency',
        'address': 'Jalan Molek 1/8, Taman Molek, 81100 Johor Bahru, Johor',
      },
      {
        'name': 'Sunway Velocity',
        'address': 'Lingkaran SV, 55100 Kuala Lumpur, Malaysia',
      },
      {
        'name': 'Verticas Residensi',
        'address': 'Jalan Bukit Gambier, 11950 Bayan Lepas, Penang, Malaysia',
      },
      {
        'name': 'KL Eco City',
        'address': 'Jalan Bangsar, 59200 Kuala Lumpur, Malaysia',
      },
      {
        'name': 'Desa ParkCity',
        'address': 'Jalan Intisari Perdana, 52200 Kuala Lumpur, Malaysia',
      },
    ];

    // Show progress
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Creating sample condominiums...'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    // Create each condo
    for (final condo in sampleCondos) {
      bloc.add(
        CondoManagementEvent.createCondo(
          name: condo['name']!,
          address: condo['address']!,
        ),
      );
      // Small delay to avoid overwhelming the backend
      await Future<void>.delayed(const Duration(milliseconds: 300));
    }

    // Reload the list after a delay
    await Future<void>.delayed(const Duration(seconds: 2));
    if (mounted) {
      _loadCondos();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Created ${sampleCondos.length} sample condominiums!'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.condoManagement),
        actions: [
          // Debug only: Seed button
          if (kDebugMode)
            IconButton(
              icon: const Icon(Icons.science),
              tooltip: 'Seed Sample Data (Debug Only)',
              onPressed: _seedSampleCondos,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToCreateCondo,
        icon: const Icon(Icons.add),
        label: Text(l10n.addCondo),
      ),
      body: BlocConsumer<CondoManagementBloc, CondoManagementState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.operationSuccess),
                  backgroundColor: theme.colorScheme.primary,
                ),
              );
              _loadCondos();
            },
            failure: (errorKey) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.errorPrefix + errorKey),
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
            success: () => const Center(child: CircularProgressIndicator()),
            loaded: (condos) {
              if (condos.isEmpty) {
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
                        l10n.noCondosFound,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      AppSpacing.gapH8,
                      Text(
                        l10n.addCondoToGetStarted,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.p16),
                itemCount: condos.length,
                separatorBuilder: (context, index) => AppSpacing.gapH12,
                itemBuilder: (context, index) {
                  final condo = condos[index];
                  return CondoCardWidget(
                    condo: condo,
                    onEdit: () => _navigateToEditCondo(
                      condo.id,
                      condo.name,
                      condo.address,
                    ),
                    onDelete: () => _deleteCondo(condo.id, condo.name),
                  );
                },
              );
            },
            failure: (message) => Center(
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
                    l10n.errorPrefix + message,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                  AppSpacing.gapH16,
                  FilledButton.icon(
                    onPressed: _loadCondos,
                    icon: const Icon(Icons.refresh),
                    label: Text(l10n.retry),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
