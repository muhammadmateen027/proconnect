import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/core/services/dependency_injector.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/condo_management/bloc/agency_selection_bloc.dart';
import 'package:proconnect/pages/condo_management/bloc/condo_management_bloc.dart';
import 'package:proconnect/pages/condo_management/widgets/agency_assignment_section.dart';
import 'package:proconnect/pages/condo_management/widgets/amenities_selection_section.dart';
import 'package:proconnect/pages/condo_management/widgets/basic_information_section.dart';
import 'package:proconnect/pages/condo_management/widgets/building_specifications_section.dart';
import 'package:proconnect/pages/condo_management/widgets/contact_information_section.dart';
import 'package:proconnect/pages/condo_management/widgets/description_section.dart';

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
  AppUser? _selectedAgencyAdmin;
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
    // Initialize selected agency admin if editing
    if (condo?.agencyId != null && condo?.agencyName != null) {
      _selectedAgencyAdmin = AppUser(
        uid: '', // Not needed for display
        email: '', // Not needed for display
        fullName: condo!.agencyName!,
        role: UserRole.agency_admin,
        agencyId: condo.agencyId,
      );
    }
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
      // Update condo
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
            agencyId: _selectedAgencyAdmin?.agencyId,
            agencyName: _selectedAgencyAdmin?.fullName,
          ),
        ),
      );

      // If agency was changed, dispatch assign agency event
      if (_selectedAgencyAdmin != null &&
          (_selectedAgencyAdmin!.agencyId != widget.condo?.agencyId)) {
        bloc.add(
          CondoManagementEvent.assignAgency(
            condoId: widget.condo!.id,
            agencyId: _selectedAgencyAdmin!.agencyId!,
            agencyName: _selectedAgencyAdmin!.fullName,
          ),
        );
      }
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
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final currentUser = authState.maybeWhen(
            authenticated: (user) => user,
            orElse: () => null,
          );
          final isSuperAdmin = currentUser?.role == UserRole.super_admin;

          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.p16),
              children: [
                // Basic Information
                BasicInformationSection(
                  nameController: _nameController,
                  addressController: _addressController,
                  isEnabled: isSuperAdmin,
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
                  isEnabled: isSuperAdmin,
                ),
                AppSpacing.gapH16,

                // Contact Information
                ContactInformationSection(
                  contactEmailController: _contactEmailController,
                  contactPhoneController: _contactPhoneController,
                  isEnabled: isSuperAdmin,
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
                AppSpacing.gapH16,

                // Agency Assignment (only for super_admin)
                if (isSuperAdmin)
                  BlocProvider(
                    create: (context) =>
                        DependencyInjector.instance
                            .resolve<AgencySelectionBloc>()
                          ..add(const AgencySelectionEvent.fetchAgencyAdmins()),
                    child: AgencyAssignmentSection(
                      selectedAgencyId: _selectedAgencyAdmin?.agencyId,
                      selectedAgencyName: _selectedAgencyAdmin?.fullName,
                      onAgencyChanged: (agencyAdmin) {
                        setState(() {
                          _selectedAgencyAdmin = agencyAdmin;
                        });
                      },
                    ),
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
          );
        },
      ),
    );
  }
}
