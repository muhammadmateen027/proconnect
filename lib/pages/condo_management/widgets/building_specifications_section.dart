import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/utils/validators.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                controller: totalUnitsController,
                labelText: l10n.totalUnits,
                prefixIcon: const Icon(Icons.home_work_rounded),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            AppSpacing.gapW16,
            Expanded(
              child: CustomTextField(
                controller: totalFloorsController,
                labelText: l10n.totalFloors,
                prefixIcon: const Icon(Icons.layers_rounded),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
        AppSpacing.gapH20,
        CustomTextField(
          controller: yearBuiltController,
          labelText: l10n.yearBuilt,
          prefixIcon: const Icon(Icons.calendar_today_rounded),
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
