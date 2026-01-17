import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/utils/validators.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/widgets/form_section_card.dart';

/// Widget for contact information form fields
/// Includes email and phone number fields with validation
class ContactInformationSection extends StatelessWidget {
  const ContactInformationSection({
    required this.contactEmailController,
    required this.contactPhoneController,
    super.key,
  });

  final TextEditingController contactEmailController;
  final TextEditingController contactPhoneController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormSectionCard(
      title: l10n.contactInformation,
      children: [
        TextFormField(
          controller: contactEmailController,
          decoration: InputDecoration(
            labelText: l10n.contactEmail,
            hintText: l10n.contactEmailHint,
            prefixIcon: const Icon(Icons.email),
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (!Validators.isValidEmail(value)) {
              return l10n.invalidEmail;
            }
            return null;
          },
        ),
        AppSpacing.gapH16,
        TextFormField(
          controller: contactPhoneController,
          decoration: InputDecoration(
            labelText: l10n.contactPhone,
            hintText: l10n.contactPhoneHint,
            prefixIcon: const Icon(Icons.phone),
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
