import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';

class TenantAssignmentSheet extends StatefulWidget {
  const TenantAssignmentSheet({required this.unit, super.key});

  final Unit unit;

  @override
  State<TenantAssignmentSheet> createState() => _TenantAssignmentSheetState();
}

class _TenantAssignmentSheetState extends State<TenantAssignmentSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _rentController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.unit.tenantName);
    _phoneController = TextEditingController(text: widget.unit.tenantPhone);
    _emailController = TextEditingController(text: widget.unit.tenantEmail);
    _rentController = TextEditingController(
      text: widget.unit.monthlyRent?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _rentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Assign Tenant',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: _nameController,
              labelText: 'Tenant Name',
              validator: (v) => v!.isEmpty ? 'Name cannot be empty' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _phoneController,
              labelText: 'Tenant Phone',
              keyboardType: TextInputType.phone,
              validator: (v) => v!.isEmpty ? 'Phone cannot be empty' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              labelText: 'Tenant Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _rentController,
              labelText: 'Monthly Rent',
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? 'Rent cannot be empty' : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<UnitBloc>().add(
                    UnitEvent.updateUnitTenantInfo(
                      unitId: widget.unit.id,
                      tenantName: _nameController.text,
                      tenantPhone: _phoneController.text,
                      tenantEmail: _emailController.text,
                      monthlyRent: double.tryParse(_rentController.text),
                    ),
                  );
                  Navigator.pop(context); // Close the bottom sheet
                }
              },
              child: const Text('Save Details'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
