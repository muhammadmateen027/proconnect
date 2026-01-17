import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/custom_dropdown_field.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/owner_selection/owner_selection_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/owner_selection/owner_selection_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/owner_selection/owner_selection_state.dart';

class OwnerAssignmentSection extends StatelessWidget {
  const OwnerAssignmentSection({
    required this.selectedOwnerId,
    required this.onOwnerChanged,
    super.key,
  });

  final String? selectedOwnerId;
  final ValueChanged<AppUser?> onOwnerChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.owner,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.gapH12,
        BlocBuilder<OwnerSelectionBloc, OwnerSelectionState>(
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
                  'Failed to load owners',
                  style: TextStyle(color: theme.colorScheme.error),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  onPressed: () => context.read<OwnerSelectionBloc>().add(
                    const OwnerSelectionEvent.fetchOwners(),
                  ),
                ),
              ),
              success: (owners) {
                if (owners.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.p16,
                    ),
                    child: Text(
                      'No owners found',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  );
                }

                return CustomDropdownField<String>(
                  value: selectedOwnerId,
                  labelText: l10n.selectOwner,
                  itemHeight: 64, // Height for the menu items
                  items: [
                    DropdownMenuItem<String>(
                      value: null,
                      child: Text(l10n.noOwner),
                    ),
                    ...owners.map((owner) {
                      return DropdownMenuItem<String>(
                        value: owner.uid,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              owner.fullName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              owner.email,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                  // Show only name in the field when selected to prevent overflow
                  selectedItemBuilder: (context) {
                    return [
                      Text(l10n.noOwner),
                      ...owners.map((owner) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            owner.fullName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }),
                    ];
                  },
                  onChanged: (String? value) {
                    if (value == null) {
                      onOwnerChanged(null);
                    } else {
                      final owner = owners.firstWhere((u) => u.uid == value);
                      onOwnerChanged(owner);
                    }
                  },
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
