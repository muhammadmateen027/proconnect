import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

/// Widget for basic condominium information
/// Includes name and address fields (both required)
class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({
    required this.nameController,
    required this.addressController,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormSectionCard(
      title: l10n.condoDetails,
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: l10n.condoName,
            hintText: l10n.enterCondoName,
            prefixIcon: const Icon(Icons.apartment),
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.condoNameRequired;
            }
            return null;
          },
        ),
        AppSpacing.gapH16,
        TextFormField(
          controller: addressController,
          decoration: InputDecoration(
            labelText: l10n.condoAddress,
            hintText: l10n.enterCondoAddress,
            prefixIcon: const Icon(Icons.location_on),
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          maxLines: 3,
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
