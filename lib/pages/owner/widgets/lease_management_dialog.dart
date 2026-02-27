import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/owner/bloc/apartment_detail/owner_apartment_detail_bloc.dart';

class LeaseManagementDialog extends StatefulWidget {
  const LeaseManagementDialog({
    required this.apartment,
    super.key,
  });

  final Apartment apartment;

  @override
  State<LeaseManagementDialog> createState() => _LeaseManagementDialogState();
}

class _LeaseManagementDialogState extends State<LeaseManagementDialog> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _leaseStartDate;
  late DateTime _leaseEndDate;
  late final TextEditingController _monthlyRentController;
  late final TextEditingController _securityDepositController;
  late final TextEditingController _rentDueDayController;

  @override
  void initState() {
    super.initState();
    _leaseStartDate = widget.apartment.leaseStartDate ?? DateTime.now();
    _leaseEndDate =
        widget.apartment.leaseEndDate ??
        DateTime.now().add(const Duration(days: 365));
    _monthlyRentController = TextEditingController(
      text: widget.apartment.monthlyRent?.toStringAsFixed(2) ?? '',
    );
    _securityDepositController = TextEditingController(
      text: widget.apartment.securityDeposit?.toStringAsFixed(2) ?? '',
    );
    _rentDueDayController = TextEditingController(
      text: widget.apartment.rentDueDay?.toString() ?? '1',
    );
  }

  @override
  void dispose() {
    _monthlyRentController.dispose();
    _securityDepositController.dispose();
    _rentDueDayController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final initialDate = isStartDate ? _leaseStartDate : _leaseEndDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _leaseStartDate = picked;
        } else {
          _leaseEndDate = picked;
        }
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final monthlyRent = double.tryParse(_monthlyRentController.text) ?? 0;
      final securityDeposit =
          double.tryParse(_securityDepositController.text) ?? 0;
      final rentDueDay = int.tryParse(_rentDueDayController.text) ?? 1;

      context.read<OwnerApartmentDetailBloc>().add(
        OwnerApartmentDetailEvent.startLease(
          apartmentId: widget.apartment.id,
          leaseStartDate: _leaseStartDate,
          leaseEndDate: _leaseEndDate,
          monthlyRent: monthlyRent,
          securityDeposit: securityDeposit,
          rentDueDay: rentDueDay,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
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
            initialChildSize: 0.8,
            minChildSize: 0.6,
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
                            l10n.startLease,
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
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.calendar_today_rounded),
                            title: Text(l10n.leaseStart),
                            subtitle: Text(_formatDate(_leaseStartDate)),
                            onTap: () => _selectDate(context, true),
                          ),
                          AppSpacing.gapH8,
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.event_rounded),
                            title: Text(l10n.leaseEnd),
                            subtitle: Text(_formatDate(_leaseEndDate)),
                            onTap: () => _selectDate(context, false),
                          ),
                          AppSpacing.gapH16,
                          CustomTextField(
                            controller: _monthlyRentController,
                            labelText: l10n.monthlyRent,
                            prefixIcon: const Icon(Icons.attach_money_rounded),
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Monthly rent is required';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid amount';
                              }
                              return null;
                            },
                          ),
                          AppSpacing.gapH16,
                          CustomTextField(
                            controller: _securityDepositController,
                            labelText: l10n.securityDeposit,
                            prefixIcon: const Icon(
                              Icons.account_balance_wallet_rounded,
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Security deposit is required';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid amount';
                              }
                              return null;
                            },
                          ),
                          AppSpacing.gapH16,
                          CustomTextField(
                            controller: _rentDueDayController,
                            labelText: 'Rent Due Day (1-31)',
                            prefixIcon: const Icon(Icons.payment_rounded),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Rent due day is required';
                              }
                              final day = int.tryParse(value);
                              if (day == null || day < 1 || day > 31) {
                                return 'Please enter a day between 1 and 31';
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
