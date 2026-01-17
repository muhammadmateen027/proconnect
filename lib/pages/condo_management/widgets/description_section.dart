import 'package:flutter/material.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

/// Widget for description form field
/// Provides a multi-line text field for detailed condominium description
class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    required this.descriptionController,
    this.isEnabled = true,
    super.key,
  });

  final TextEditingController descriptionController;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormSectionCard(
      title: l10n.description,
      children: [
        TextFormField(
          controller: descriptionController,
          enabled: isEnabled,
          decoration: InputDecoration(
            labelText: l10n.description,
            hintText: l10n.descriptionHint,
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          maxLines: 5,
        ),
      ],
    );
  }
}
