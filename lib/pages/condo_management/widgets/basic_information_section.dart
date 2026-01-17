import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

/// Widget for basic condominium information
/// Includes name and address fields (both required)
class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({
    required this.nameController,
    required this.addressController,
    this.isEnabled = true,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController addressController;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormSectionCard(
      title: l10n.condoDetails,
      children: [
        CustomTextField(
          controller: nameController,
          labelText: l10n.condoName,
          enabled: isEnabled,
          prefixIcon: const Icon(Icons.apartment_rounded),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.condoNameRequired;
            }
            return null;
          },
        ),
        AppSpacing.gapH20,
        CustomTextField(
          controller: addressController,
          labelText: l10n.condoAddress,
          enabled: isEnabled,
          maxLines: 3,
          prefixIcon: const Icon(Icons.location_on_rounded),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.condoAddressRequired;
            }
            return null;
          },
        ),
      ],
    );
  }
}
