import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';
import 'package:uuid/uuid.dart';

class AddUnitPage extends StatefulWidget {
  const AddUnitPage({super.key});

  @override
  State<AddUnitPage> createState() => _AddUnitPageState();
}

class _AddUnitPageState extends State<AddUnitPage> {
  final _formKey = GlobalKey<FormState>();
  final _unitNoController = TextEditingController();
  final _condoNameController = TextEditingController();
  RentStatus _selectedStatus = RentStatus.vacant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Unit')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _unitNoController,
                labelText: 'Unit Number (e.g., A-12-03)',
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a unit number' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _condoNameController,
                labelText: 'Condominium Name',
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a condominium name' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<RentStatus>(
                value: _selectedStatus,
                onChanged: (status) =>
                    setState(() => _selectedStatus = status!),
                items: RentStatus.values
                    .map(
                      (status) => DropdownMenuItem(
                        value: status,
                        child: Text(status.name),
                      ),
                    )
                    .toList(),
                decoration: const InputDecoration(labelText: 'Rent Status'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().state.whenOrNull(
                      authenticated: (user) {
                        final newUnit = Unit(
                          id: const Uuid().v4(),
                          unitNo: _unitNoController.text,
                          condoName: _condoNameController.text,
                          rentStatus: _selectedStatus,
                          ownerId: user.uid,
                        );
                        context.read<UnitBloc>().add(
                          UnitEvent.addUnit(newUnit),
                        );
                        context.pop();
                      },
                    );
                  }
                },
                child: const Text('Add Unit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
