import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';

import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_state.dart';

/// Floor List Tab showing all floors in a condominium
class FloorListTab extends StatelessWidget {
  const FloorListTab({
    required this.condo,
    super.key,
  });

  final Condo condo;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocConsumer<FloorBloc, FloorState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            if (message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            }
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
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
          loaded: (floors) {
            if (floors.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.layers_outlined,
                      size: 64,
                      color: theme.colorScheme.outline,
                    ),
                    AppSpacing.gapH16,
                    Text(
                      l10n.noFloorsFound,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    AppSpacing.gapH8,
                    Text(
                      'Tap the + button to add a floor',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.p16),
              itemCount: floors.length,
              separatorBuilder: (context, index) => AppSpacing.gapH12,
              itemBuilder: (context, index) {
                final floor = floors[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: theme.brightness == Brightness.dark
                                ? [
                                    Colors.white.withValues(alpha: 0.1),
                                    Colors.white.withValues(alpha: 0.05),
                                  ]
                                : [
                                    Colors.white.withValues(alpha: 0.7),
                                    Colors.white.withValues(alpha: 0.4),
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: theme.brightness == Brightness.dark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.white.withValues(alpha: 0.4),
                            width: 1.5,
                          ),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primary,
                                  theme.colorScheme.secondary,
                                ],
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                floor.floorNumber.toString(),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            floor.floorName ?? 'Floor ${floor.floorNumber}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: floor.totalApartments != null
                              ? Text('${floor.totalApartments} apartments')
                              : null,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_rounded),
                                color: theme.colorScheme.primary,
                                onPressed: () {
                                  // TODO: Navigate to edit floor
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_rounded),
                                color: theme.colorScheme.error,
                                onPressed: () {
                                  _showDeleteDialog(
                                    context,
                                    floor.id,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          success: (_) => const SizedBox.shrink(),
          failure: (message) => Center(
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
                  message,
                  style: TextStyle(color: theme.colorScheme.error),
                  textAlign: TextAlign.center,
                ),
                AppSpacing.gapH16,
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<FloorBloc>().add(
                      FloorEvent.loadFloors(condominiumId: condo.id),
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
    );
  }

  static void showAddFloorDialog(BuildContext context, Condo condo) {
    final l10n = context.l10n;
    final floorNumberController = TextEditingController();
    final floorNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.addFloor),
        titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: floorNumberController,
              labelText: l10n.floorNumber,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.numbers_rounded),
            ),
            AppSpacing.gapH16,
            CustomTextField(
              controller: floorNameController,
              labelText: l10n.floorName,
              prefixIcon: const Icon(Icons.label_rounded),
            ),
          ],
        ),
        actions: [
          AppButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            label: l10n.cancel,
            type: AppButtonType.text,
          ),
          AppButton(
            onPressed: () {
              final floorNumber = int.tryParse(floorNumberController.text);
              if (floorNumber != null) {
                context.read<FloorBloc>().add(
                  FloorEvent.createFloor(
                    condominiumId: condo.id,
                    agencyId: condo.agencyId ?? '',
                    floorNumber: floorNumber,
                    floorName: floorNameController.text.isEmpty
                        ? null
                        : floorNameController.text,
                  ),
                );
                Navigator.of(dialogContext).pop();
              }
            },
            label: l10n.addFloor,
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String floorId) {
    final l10n = context.l10n;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Floor'),
        content: const Text(
          'Are you sure you want to delete this floor? This action cannot be undone.',
        ),
        actions: [
          AppButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            label: l10n.cancel,
            type: AppButtonType.text,
          ),
          AppButton(
            onPressed: () {
              context.read<FloorBloc>().add(
                FloorEvent.deleteFloor(
                  condominiumId: condo.id,
                  floorId: floorId,
                ),
              );
              Navigator.of(dialogContext).pop();
            },
            label: l10n.delete,
            // Custom red color for delete
          ),
        ],
      ),
    );
  }
}
