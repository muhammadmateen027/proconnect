import 'package:flutter/material.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

/// Widget for description form field
/// Provides a multi-line text field for detailed condominium description
class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    required this.descriptionController,
    super.key,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormSectionCard(
      title: l10n.description,
      children: [
        TextFormField(
          controller: descriptionController,
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
