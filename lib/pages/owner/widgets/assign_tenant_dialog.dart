import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/core/utils/validators.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/owner/bloc/apartment_detail/owner_apartment_detail_bloc.dart';

class AssignTenantDialog extends StatefulWidget {
  const AssignTenantDialog({
    required this.apartment,
    super.key,
  });

  final Apartment apartment;

  @override
  State<AssignTenantDialog> createState() => _AssignTenantDialogState();
}

class _AssignTenantDialogState extends State<AssignTenantDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.apartment.tenantName);
    _emailController = TextEditingController(
      text: widget.apartment.tenantEmail,
    );
    _phoneController = TextEditingController(
      text: widget.apartment.tenantPhone,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<OwnerApartmentDetailBloc>().add(
        OwnerApartmentDetailEvent.assignTenant(
          apartmentId: widget.apartment.id,
          tenantName: _nameController.text.trim(),
          tenantEmail: _emailController.text.trim(),
          tenantPhone: _phoneController.text.trim(),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark
                ? Colors.black.withValues(alpha: 0.6)
                : Colors.white.withValues(alpha: 0.8),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            border: Border.all(
              color: theme.brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.4),
              width: 1.5,
            ),
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            expand: false,
            builder: (context, scrollController) {
              return Column(
                children: [
                  // Handle bar
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.p24,
                      vertical: AppSpacing.p16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.assignTenant,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  // Content
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.all(AppSpacing.p24),
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            labelText: 'Tenant Name',
                            prefixIcon: const Icon(Icons.person_rounded),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Tenant name is required';
                              }
                              return null;
                            },
                          ),
                          AppSpacing.gapH16,
                          CustomTextField(
                            controller: _emailController,
                            labelText: l10n.email,
                            prefixIcon: const Icon(Icons.email_rounded),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              if (!Validators.isValidEmail(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          AppSpacing.gapH16,
                          CustomTextField(
                            controller: _phoneController,
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone_rounded),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Phone number is required';
                              }
                              if (!Validators.isValidPhone(value)) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                          AppSpacing.gapH24,
                          Row(
                            children: [
                              Expanded(
                                child: AppButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  label: l10n.cancel,
                                  type: AppButtonType.outlined,
                                  expand: true,
                                ),
                              ),
                              AppSpacing.gapW12,
                              Expanded(
                                child: AppButton(
                                  onPressed: _handleSubmit,
                                  label: l10n.save,
                                  expand: true,
                                ),
                              ),
                            ],
                          ),
                          AppSpacing.gapH8,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
