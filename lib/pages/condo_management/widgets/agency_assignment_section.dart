import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/custom_dropdown_field.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/condo_management/bloc/agency_selection_bloc.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

class AgencyAssignmentSection extends StatelessWidget {
  const AgencyAssignmentSection({
    required this.selectedAgencyId,
    required this.selectedAgencyName,
    required this.onAgencyChanged,
    super.key,
  });

  final String? selectedAgencyId;
  final String? selectedAgencyName;
  final ValueChanged<AppUser?> onAgencyChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return authState.maybeWhen(
          authenticated: (currentUser) {
            if (currentUser.role != UserRole.super_admin) {
              return const SizedBox.shrink();
            }

            return FormSectionCard(
              title: l10n.assignAgency,
              children: [
                BlocBuilder<AgencySelectionBloc, AgencySelectionState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(AppSpacing.p16),
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.all(AppSpacing.p16),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      failure: (errorKey) => ListTile(
                        leading: Icon(
                          Icons.error_outline_rounded,
                          color: theme.colorScheme.error,
                        ),
                        title: Text(
                          l10n.loadAgenciesFailed,
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                        subtitle: const Text('Check internet connection'),
                        trailing: IconButton(
                          icon: const Icon(Icons.refresh_rounded),
                          onPressed: () =>
                              context.read<AgencySelectionBloc>().add(
                                const AgencySelectionEvent.fetchAgencyAdmins(),
                              ),
                        ),
                      ),
                      success: (agencyAdmins) {
                        if (agencyAdmins.isEmpty) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(AppSpacing.p16),
                                child: Text(
                                  l10n.noAgenciesFound,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.outline,
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () =>
                                    context.read<AgencySelectionBloc>().add(
                                      const AgencySelectionEvent.fetchAgencyAdmins(),
                                    ),
                                icon: const Icon(Icons.refresh_rounded),
                                label: Text(l10n.retry),
                              ),
                            ],
                          );
                        }

                        return CustomDropdownField<String>(
                          value: selectedAgencyId,
                          labelText: l10n.selectAgency,
                          hintText: l10n.noAgency,
                          items: [
                            DropdownMenuItem<String>(
                              child: Text(l10n.noAgency),
                            ),
                            ...agencyAdmins.map((agencyAdmin) {
                              final value =
                                  agencyAdmin.agencyId ?? agencyAdmin.uid;
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(agencyAdmin.fullName),
                              );
                            }),
                          ],
                          onChanged: (String? value) {
                            if (value == null) {
                              onAgencyChanged(null);
                            } else {
                              final agencyAdmin = agencyAdmins.firstWhere(
                                (user) =>
                                    user.agencyId == value || user.uid == value,
                              );
                              onAgencyChanged(
                                agencyAdmin.copyWith(
                                  agencyId:
                                      agencyAdmin.agencyId ?? agencyAdmin.uid,
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
