import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';

class CreateEditCondoPage extends StatefulWidget {
  const CreateEditCondoPage({
    super.key,
    this.condo,
  });

  final Condo? condo;

  bool get isEditing => condo != null;

  @override
  State<CreateEditCondoPage> createState() => _CreateEditCondoPageState();
}

class _CreateEditCondoPageState extends State<CreateEditCondoPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _totalUnitsController;
  late final TextEditingController _totalFloorsController;
  late final TextEditingController _yearBuiltController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _contactEmailController;
  late final TextEditingController _contactPhoneController;
  late List<String> _selectedAmenities;
  bool _isSubmitting = false;

  // Common amenities list
  static const List<String> _availableAmenities = [
    'Swimming Pool',
    'Gym',
    'Parking',
    'Security',
    'Playground',
    'BBQ Area',
    'Function Room',
    'Sauna',
    'Tennis Court',
    'Basketball Court',
    'Jogging Track',
    'Mini Market',
    'Cafe',
    'Laundry',
  ];

  @override
  void initState() {
    super.initState();
    final condo = widget.condo;
    _nameController = TextEditingController(text: condo?.name);
    _addressController = TextEditingController(text: condo?.address);
    _totalUnitsController = TextEditingController(
      text: condo?.totalUnits?.toString(),
    );
    _totalFloorsController = TextEditingController(
      text: condo?.totalFloors?.toString(),
    );
    _yearBuiltController = TextEditingController(
      text: condo?.yearBuilt?.toString(),
    );
    _descriptionController = TextEditingController(text: condo?.description);
    _contactEmailController = TextEditingController(text: condo?.contactEmail);
    _contactPhoneController = TextEditingController(text: condo?.contactPhone);
    _selectedAmenities = List.from(condo?.amenities ?? []);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _totalUnitsController.dispose();
    _totalFloorsController.dispose();
    _yearBuiltController.dispose();
    _descriptionController.dispose();
    _contactEmailController.dispose();
    _contactPhoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final bloc = context.read<CondoManagementBloc>();

    // Parse numeric fields
    final totalUnits = int.tryParse(_totalUnitsController.text.trim());
    final totalFloors = int.tryParse(_totalFloorsController.text.trim());
    final yearBuilt = int.tryParse(_yearBuiltController.text.trim());

    if (widget.isEditing) {
      bloc.add(
        CondoManagementEvent.updateCondo(
          condo: Condo(
            id: widget.condo!.id,
            name: _nameController.text.trim(),
            address: _addressController.text.trim(),
            totalUnits: totalUnits,
            totalFloors: totalFloors,
            yearBuilt: yearBuilt,
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            contactEmail: _contactEmailController.text.trim().isEmpty
                ? null
                : _contactEmailController.text.trim(),
            contactPhone: _contactPhoneController.text.trim().isEmpty
                ? null
                : _contactPhoneController.text.trim(),
            amenities: _selectedAmenities,
          ),
        ),
      );
    } else {
      bloc.add(
        CondoManagementEvent.createCondo(
          name: _nameController.text.trim(),
          address: _addressController.text.trim(),
          totalUnits: totalUnits,
          totalFloors: totalFloors,
          yearBuilt: yearBuilt,
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          contactEmail: _contactEmailController.text.trim().isEmpty
              ? null
              : _contactEmailController.text.trim(),
          contactPhone: _contactPhoneController.text.trim().isEmpty
              ? null
              : _contactPhoneController.text.trim(),
          amenities: _selectedAmenities,
        ),
      );
    }

    // Wait a bit for the bloc to process
    await Future.delayed(const Duration(milliseconds: 500), () {});

    if (mounted) {
      setState(() {
        _isSubmitting = false;
      });
      context.pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? l10n.editCondo : l10n.addCondo,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.p16),
          children: [
            // Basic Information Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.condoDetails,
                      style: theme.textTheme.titleLarge,
                    ),
                    AppSpacing.gapH16,
                    TextFormField(
                      controller: _nameController,
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
                      controller: _addressController,
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
                ),
              ),
            ),
            AppSpacing.gapH16,

            // Building Specifications Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Building Specifications',
                      style: theme.textTheme.titleLarge,
                    ),
                    AppSpacing.gapH16,
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _totalUnitsController,
                            decoration: const InputDecoration(
                              labelText: 'Total Units',
                              hintText: 'e.g., 150',
                              prefixIcon: Icon(Icons.home_work),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        AppSpacing.gapW16,
                        Expanded(
                          child: TextFormField(
                            controller: _totalFloorsController,
                            decoration: const InputDecoration(
                              labelText: 'Total Floors',
                              hintText: 'e.g., 25',
                              prefixIcon: Icon(Icons.layers),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.gapH16,
                    TextFormField(
                      controller: _yearBuiltController,
                      decoration: const InputDecoration(
                        labelText: 'Year Built',
                        hintText: 'e.g., 2020',
                        prefixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value != null && value.trim().isNotEmpty) {
                          final year = int.tryParse(value.trim());
                          if (year == null) {
                            return 'Please enter a valid year';
                          }
                          if (year < 1900 || year > DateTime.now().year + 5) {
                            return 'Please enter a valid year';
                          }
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.gapH16,

            // Description Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: theme.textTheme.titleLarge,
                    ),
                    AppSpacing.gapH16,
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText:
                            'Enter a detailed description of the condominium',
                        border: OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.next,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.gapH16,

            // Contact Information Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: theme.textTheme.titleLarge,
                    ),
                    AppSpacing.gapH16,
                    TextFormField(
                      controller: _contactEmailController,
                      decoration: const InputDecoration(
                        labelText: 'Contact Email',
                        hintText: 'management@example.com',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value != null && value.trim().isNotEmpty) {
                          final emailRegex = RegExp(
                            r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Please enter a valid email address';
                          }
                        }
                        return null;
                      },
                    ),
                    AppSpacing.gapH16,
                    TextFormField(
                      controller: _contactPhoneController,
                      decoration: const InputDecoration(
                        labelText: 'Contact Phone',
                        hintText: '+60 12-345 6789',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.gapH16,

            // Amenities Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amenities',
                      style: theme.textTheme.titleLarge,
                    ),
                    AppSpacing.gapH8,
                    Text(
                      'Select all amenities available in this condominium',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    AppSpacing.gapH16,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _availableAmenities.map((amenity) {
                        final isSelected = _selectedAmenities.contains(amenity);
                        return FilterChip(
                          label: Text(amenity),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedAmenities.add(amenity);
                              } else {
                                _selectedAmenities.remove(amenity);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.gapH24,

            // Submit Button
            FilledButton.icon(
              onPressed: _isSubmitting ? null : _handleSubmit,
              icon: _isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : Icon(widget.isEditing ? Icons.save : Icons.add),
              label: Text(
                widget.isEditing ? l10n.saveChanges : l10n.createCondo,
              ),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.p16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
