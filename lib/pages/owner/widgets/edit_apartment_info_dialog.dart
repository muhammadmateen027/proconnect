import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_dropdown_field.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/owner/bloc/apartment_detail/owner_apartment_detail_bloc.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'dart:ui';

class EditApartmentInfoDialog extends StatefulWidget {
  const EditApartmentInfoDialog({
    required this.apartment,
    super.key,
  });

  final Apartment apartment;

  @override
  State<EditApartmentInfoDialog> createState() =>
      _EditApartmentInfoDialogState();
}

class _EditApartmentInfoDialogState extends State<EditApartmentInfoDialog> {
  late ApartmentStatus _selectedStatus;
  late FurnishingStatus _selectedFurnishing;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.apartment.status;
    _selectedFurnishing = widget.apartment.furnishing;
  }

  void _handleSave() {
    context.read<OwnerApartmentDetailBloc>().add(
      OwnerApartmentDetailEvent.updateApartmentDetails(
        apartmentId: widget.apartment.id,
        updates: {
          'status': _selectedStatus,
          'furnishing': _selectedFurnishing,
        },
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withValues(alpha: 0.8),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppSpacing.p24),
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  AppSpacing.gapH24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.apartmentDetails,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor: theme
                              .colorScheme
                              .surfaceContainerHighest
                              .withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.gapH24,
                  CustomDropdownField<ApartmentStatus>(
                    enabled: !context.read<AuthBloc>().state.maybeWhen(
                      authenticated: (u) => u.role == UserRole.agency_admin,
                      orElse: () => false,
                    ),
                    labelText: l10n.status,
                    value: _selectedStatus,
                    items: ApartmentStatus.values.map((s) {
                      String label;
                      switch (s) {
                        case ApartmentStatus.vacant:
                          label = l10n.vacant;
                        case ApartmentStatus.occupied:
                          label = l10n.occupied;
                        case ApartmentStatus.maintenance:
                          label = l10n.maintenance;
                        case ApartmentStatus.reserved:
                          label = l10n.reserved;
                      }
                      return DropdownMenuItem(
                        value: s,
                        child: Text(label),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => _selectedStatus = val);
                    },
                    prefixIcon: const Icon(Icons.info_rounded),
                  ),
                  AppSpacing.gapH16,
                  CustomDropdownField<FurnishingStatus>(
                    labelText: l10n.furnishingStatus,
                    value: _selectedFurnishing,
                    items: FurnishingStatus.values.map((s) {
                      String label;
                      switch (s) {
                        case FurnishingStatus.unfurnished:
                          label = l10n.unfurnished;
                        case FurnishingStatus.partiallyFurnished:
                          label = l10n.partiallyFurnished;
                        case FurnishingStatus.fullyFurnished:
                          label = l10n.fullyFurnished;
                      }
                      return DropdownMenuItem(
                        value: s,
                        child: Text(label),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null)
                        setState(() => _selectedFurnishing = val);
                    },
                    prefixIcon: const Icon(Icons.chair_rounded),
                  ),
                  AppSpacing.gapH32,
                  AppButton(
                    onPressed: _handleSave,
                    label: l10n.saveChanges,
                    expand: true,
                  ),
                  AppSpacing.gapH16,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
