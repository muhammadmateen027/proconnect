import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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

  // Controllers
  final _unitNoController = TextEditingController();
  final _condoNameController = TextEditingController();
  final _bedroomsController = TextEditingController();
  final _bathroomsController = TextEditingController();
  final _sqftController = TextEditingController();
  final _floorLevelController = TextEditingController();
  final _parkingSpacesController = TextEditingController();
  final _rentAmountController = TextEditingController();
  final _securityDepositController = TextEditingController();
  final _rentDueDateController = TextEditingController();

  // State variables
  RentStatus _selectedStatus = RentStatus.vacant;
  FurnishingStatus _furnishingStatus = FurnishingStatus.none;
  DateTime? _leaseStartDate;
  DateTime? _leaseEndDate;
  final List<String> _utilities = ['Water', 'Electric', 'Internet'];
  final List<String> _selectedUtilities = [];

  @override
  void dispose() {
    _unitNoController.dispose();
    _condoNameController.dispose();
    _bedroomsController.dispose();
    _bathroomsController.dispose();
    _sqftController.dispose();
    _floorLevelController.dispose();
    _parkingSpacesController.dispose();
    _rentAmountController.dispose();
    _securityDepositController.dispose();
    _rentDueDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final initialDate = isStartDate
        ? (_leaseStartDate ?? DateTime.now())
        : (_leaseEndDate ?? _leaseStartDate ?? DateTime.now());
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (newDate != null) {
      setState(() {
        if (isStartDate) {
          _leaseStartDate = newDate;
        } else {
          _leaseEndDate = newDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Unit')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // --- Basic Unit Details ---
            Text(
              'Unit Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _unitNoController,
              labelText: 'Unit Number (e.g., A-12-03)',
              validator: (v) => v!.isEmpty ? 'Unit number is required' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _condoNameController,
              labelText: 'Condominium Name',
              validator: (v) => v!.isEmpty ? 'Condo name is required' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<RentStatus>(
              value: _selectedStatus,
              onChanged: (status) => setState(() => _selectedStatus = status!),
              items: RentStatus.values
                  .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                  .toList(),
              decoration: const InputDecoration(labelText: 'Rent Status'),
            ),
            const Divider(height: 32),

            // --- Unit Specifications ---
            Text(
              'Unit Specifications',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _bedroomsController,
                    labelText: 'Bedrooms',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    controller: _bathroomsController,
                    labelText: 'Bathrooms',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _sqftController,
              labelText: 'Square Feet',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _floorLevelController,
              labelText: 'Floor Level',
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<FurnishingStatus>(
              value: _furnishingStatus,
              onChanged: (status) =>
                  setState(() => _furnishingStatus = status!),
              items: FurnishingStatus.values
                  .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                  .toList(),
              decoration: const InputDecoration(labelText: 'Furnishing'),
            ),
            const Divider(height: 32),

            // --- Parking Details ---
            Text('Parking', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _parkingSpacesController,
              labelText: 'Allowed Parking Spaces (comma-separated)',
            ),
            const Divider(height: 32),

            // --- Rental Details ---
            Text(
              'Rental Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _rentAmountController,
              labelText: 'Monthly Rent Amount',
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? 'Rent amount is required' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _securityDepositController,
              labelText: 'Security Deposit',
              keyboardType: TextInputType.number,
              validator: (v) =>
                  v!.isEmpty ? 'Security deposit is required' : null,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _rentDueDateController,
              labelText: 'Rent Due Day of Month (e.g., 1)',
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? 'Due date is required' : null,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Lease Start: ${_leaseStartDate == null ? 'Not set' : DateFormat.yMd().format(_leaseStartDate!)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context, true),
                  child: const Text('Select'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Lease End:   ${_leaseEndDate == null ? 'Not set' : DateFormat.yMd().format(_leaseEndDate!)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context, false),
                  child: const Text('Select'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Utilities Included ---
            Text(
              'Utilities Included',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            ..._utilities.map((utility) {
              return CheckboxListTile(
                title: Text(utility),
                value: _selectedUtilities.contains(utility),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedUtilities.add(utility);
                    } else {
                      _selectedUtilities.remove(utility);
                    }
                  });
                },
              );
            }).toList(),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().state.whenOrNull(
                    authenticated: (user) {
                      final parkingSpaces = _parkingSpacesController.text
                          .split(',')
                          .map((e) => e.trim())
                          .where((e) => e.isNotEmpty)
                          .toList();

                      final newUnit = Unit(
                        id: const Uuid().v4(),
                        unitNo: _unitNoController.text,
                        condoName: _condoNameController.text,
                        rentStatus: _selectedStatus,
                        ownerId: user.uid,
                        rentAmount: double.parse(_rentAmountController.text),
                        rentDueDate: int.parse(_rentDueDateController.text),
                        securityDeposit: double.parse(
                          _securityDepositController.text,
                        ),
                        utilitiesIncluded: _selectedUtilities,
                        leaseStartDate: _leaseStartDate,
                        leaseEndDate: _leaseEndDate,
                        allowedParkingSpaces: parkingSpaces,
                        bedrooms: int.tryParse(_bedroomsController.text) ?? 0,
                        bathrooms: int.tryParse(_bathroomsController.text) ?? 0,
                        squareFeet: int.tryParse(_sqftController.text) ?? 0,
                        floorLevel: _floorLevelController.text,
                        furnishing: _furnishingStatus,
                      );
                      context.read<UnitBloc>().add(UnitEvent.addUnit(newUnit));
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
    );
  }
}
