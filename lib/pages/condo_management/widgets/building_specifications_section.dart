import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/utils/validators.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

/// Widget for building specifications form fields
/// Includes total units, total floors, and year built
class BuildingSpecificationsSection extends StatelessWidget {
  const BuildingSpecificationsSection({
    required this.totalUnitsController,
    required this.totalFloorsController,
    required this.yearBuiltController,
    super.key,
  });

  final TextEditingController totalUnitsController;
  final TextEditingController totalFloorsController;
  final TextEditingController yearBuiltController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormSectionCard(
      title: l10n.buildingSpecifications,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: totalUnitsController,
                decoration: InputDecoration(
                  labelText: l10n.totalUnits,
                  hintText: l10n.totalUnitsHint,
                  prefixIcon: const Icon(Icons.home_work),
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            AppSpacing.gapW16,
            Expanded(
              child: TextFormField(
                controller: totalFloorsController,
                decoration: InputDecoration(
                  labelText: l10n.totalFloors,
                  hintText: l10n.totalFloorsHint,
                  prefixIcon: const Icon(Icons.layers),
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
        AppSpacing.gapH16,
        TextFormField(
          controller: yearBuiltController,
          decoration: InputDecoration(
            labelText: l10n.yearBuilt,
            hintText: l10n.yearBuiltHint,
            prefixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (!Validators.isValidYearString(value)) {
              return l10n.invalidYear;
            }
            return null;
          },
        ),
      ],
    );
  }
}
