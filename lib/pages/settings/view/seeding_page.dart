import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/services/seeding_service.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_dropdown_field.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';

class SeedingPage extends StatefulWidget {
  const SeedingPage({super.key});

  @override
  State<SeedingPage> createState() => _SeedingPageState();
}

class _SeedingPageState extends State<SeedingPage> {
  Condo? _selectedCondo;
  bool _isSeeding = false;

  @override
  void initState() {
    super.initState();
    // Load condos if not already loaded
    context.read<CondoManagementBloc>().add(
      const CondoManagementEvent.loadCondos(),
    );
  }

  Future<void> _handleSeed() async {
    if (_selectedCondo == null) return;

    setState(() => _isSeeding = true);

    try {
      final seedingService = DependencyInjector.instance
          .resolve<SeedingService>();
      await seedingService.seedFloorsAndApartments(condo: _selectedCondo!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.seedingSuccess),
            backgroundColor: AppColors.success,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.seedingError(e.toString())),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSeeding = false);
      }
    }
  }

  Future<void> _handleClear() async {
    if (_selectedCondo == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.clearData),
        content: Text(context.l10n.clearDataConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(context.l10n.delete),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _isSeeding = true);

    try {
      final seedingService = DependencyInjector.instance
          .resolve<SeedingService>();
      await seedingService.deleteCondoData(_selectedCondo!.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.clearDataSuccess),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.seedingError(e.toString())),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSeeding = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ProConnectLayout(
      appBar: AppBar(
        title: Text(l10n.seedData),
      ),
      child: BlocBuilder<CondoManagementBloc, CondoManagementState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (condos) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.seedFloorsAndApartments,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.gapH12,
                  Text(
                    l10n.seedingDescription,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.gapH32,
                  CustomDropdownField<Condo>(
                    labelText: l10n.selectCondoToSeed,
                    value: _selectedCondo,
                    items: condos.map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c.name),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedCondo = val),
                    prefixIcon: const Icon(Icons.business_rounded),
                  ),
                  AppSpacing.gapH32,
                  AppButton(
                    onPressed: _selectedCondo == null || _isSeeding
                        ? null
                        : _handleSeed,
                    label: l10n.seedData,
                    icon: Icons.auto_fix_high_rounded,
                    isLoading: _isSeeding,
                    expand: true,
                  ),
                  AppSpacing.gapH16,
                  AppButton(
                    onPressed: _selectedCondo == null || _isSeeding
                        ? null
                        : _handleClear,
                    label: l10n.clearData,
                    icon: Icons.delete_sweep_rounded,
                    isLoading: _isSeeding,
                    expand: true,
                    type: AppButtonType.outlined,
                  ),
                ],
              );
            },
            failure: (message) => Center(child: Text(message)),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
