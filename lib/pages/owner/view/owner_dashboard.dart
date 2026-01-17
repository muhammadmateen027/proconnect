import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/unit_card.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';

class OwnerDashboard extends StatefulWidget {
  const OwnerDashboard({super.key});

  @override
  State<OwnerDashboard> createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().state.whenOrNull(
      authenticated: (user) {
        context.read<UnitBloc>().add(UnitEvent.loadUnits(user.uid));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final fullName = authState.maybeWhen(
          authenticated: (user) => user.fullName,
          orElse: () => '',
        );

        return Scaffold(
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
          body: BlocBuilder<UnitBloc, UnitState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (units) {
                  if (units.isEmpty) {
                    return Center(child: Text(l10n.ownerDashboardEmpty));
                  }
                  return ListView.builder(
                    itemCount: units.length,
                    itemBuilder: (context, index) {
                      final unit = units[index];
                      return UnitCard(
                        unit: unit,
                        onTap: () =>
                            context.push(AppRoutes.unitDetail, extra: unit),
                        onDelete: () {
                          context.read<UnitBloc>().add(
                            UnitEvent.deleteUnit(unit.id),
                          );
                        },
                      );
                    },
                  );
                },
                unitUpdateSuccess: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (message) =>
                    Center(child: Text('${l10n.errorPrefix}$message')),
              );
            },
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  // TODO: Implement guest invitation logic
                },
                label: Text(l10n.inviteGuest),
                icon: const Icon(Icons.person_add),
                heroTag: 'invite_guest',
              ),
              AppSpacing.gapH16,
              FloatingActionButton(
                onPressed: () => context.push(AppRoutes.addUnit),
                heroTag: 'add_unit',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}
