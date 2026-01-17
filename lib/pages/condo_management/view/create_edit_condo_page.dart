import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';
import 'package:proconnect/pages/condo_management/widgets/amenities_selection_section.dart';
import 'package:proconnect/pages/condo_management/widgets/basic_information_section.dart';
import 'package:proconnect/pages/condo_management/widgets/building_specifications_section.dart';
import 'package:proconnect/pages/condo_management/widgets/contact_information_section.dart';
import 'package:proconnect/pages/condo_management/widgets/description_section.dart';
import 'package:proconnect/core/widgets/app_button.dart';

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
            // Basic Information
            BasicInformationSection(
              nameController: _nameController,
              addressController: _addressController,
            ),
            AppSpacing.gapH16,

            // Building Specifications
            BuildingSpecificationsSection(
              totalUnitsController: _totalUnitsController,
              totalFloorsController: _totalFloorsController,
              yearBuiltController: _yearBuiltController,
            ),
            AppSpacing.gapH16,

            // Description
            DescriptionSection(
              descriptionController: _descriptionController,
            ),
            AppSpacing.gapH16,

            // Contact Information
            ContactInformationSection(
              contactEmailController: _contactEmailController,
              contactPhoneController: _contactPhoneController,
            ),
            AppSpacing.gapH16,

            // Amenities
            AmenitiesSelectionSection(
              selectedAmenities: _selectedAmenities,
              onAmenitiesChanged: (amenities) {
                setState(() {
                  _selectedAmenities = amenities;
                });
              },
            ),
            AppSpacing.gapH24,

            // Submit Button
            AppButton(
              onPressed: _handleSubmit,
              label: widget.isEditing ? l10n.saveChanges : l10n.createCondo,
              icon: widget.isEditing ? Icons.save : Icons.add,
              isLoading: _isSubmitting,
              expand: true,
            ),
          ],
        ),
      ),
    );
  }
}
