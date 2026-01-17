import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';
import 'package:proconnect/pages/condo_management/widgets/condo_card_widget.dart';

class AgencyAdminDashboard extends StatelessWidget {
  const AgencyAdminDashboard({super.key});

  String _getErrorMessage(String errorKey, AppLocalizations l10n) {
    switch (errorKey) {
      case 'loadCondosFailed':
        return l10n.loadCondosFailed;
      default:
        return l10n.unknownError;
    }
  }

  String? _getAgencyId(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    return authState.maybeWhen(
      authenticated: (user) {
        final id = (user.agencyId?.isNotEmpty ?? false)
            ? user.agencyId
            : user.uid;
        debugPrint('DEBUG: AgencyAdminDashboard - Extracted agencyId: $id');
        return id;
      },
      orElse: () {
        debugPrint('DEBUG: AgencyAdminDashboard - AuthState not authenticated');
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) {
        final agencyId = _getAgencyId(context);
        return DependencyInjector.instance.resolve<CondoManagementBloc>()
          ..add(CondoManagementEvent.loadCondos(agencyId: agencyId));
      },
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
                    l10n.agencyAdminDashboard,
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
            child: BlocBuilder<CondoManagementBloc, CondoManagementState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: () =>
                      const Center(child: CircularProgressIndicator()),
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
                          onEdit: () async {
                            final result = await context.push<bool>(
                              AppRoutes.editCondo,
                              extra: condo,
                            );
                            if ((result ?? false) && context.mounted) {
                              context.read<CondoManagementBloc>().add(
                                CondoManagementEvent.loadCondos(
                                  agencyId: _getAgencyId(context),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  failure: (errorKey) => Center(
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
                          l10n.errorPrefix + _getErrorMessage(errorKey, l10n),
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                        AppSpacing.gapH16,
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<CondoManagementBloc>().add(
                              CondoManagementEvent.loadCondos(
                                agencyId: _getAgencyId(context),
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
            ),
          );
        },
      ),
    );
  }
}
