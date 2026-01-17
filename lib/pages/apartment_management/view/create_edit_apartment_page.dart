import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_dropdown_field.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/models/condo.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_event.dart';
import 'package:proconnect/pages/apartment_management/bloc/apartment/apartment_state.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_bloc.dart';
import 'package:proconnect/pages/apartment_management/bloc/floor/floor_state.dart'
    as floor_state;

class CreateEditApartmentPage extends StatefulWidget {
  const CreateEditApartmentPage({
    required this.condo,
    this.apartment,
    super.key,
  });

  final Condo condo;
  final Apartment? apartment;

  bool get isEditing => apartment != null;

  @override
  State<CreateEditApartmentPage> createState() =>
      _CreateEditApartmentPageState();
}

class _CreateEditApartmentPageState extends State<CreateEditApartmentPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _numberController;
  late TextEditingController _sizeController;
  late TextEditingController _rentController;
  late TextEditingController _depositController;
  late TextEditingController _bedroomsController;
  late TextEditingController _bathroomsController;
  late TextEditingController _descriptionController;
  late TextEditingController _notesController;

  String? _selectedFloorId;
  ApartmentStatus _selectedStatus = ApartmentStatus.vacant;
  FurnishingStatus _selectedFurnishing = FurnishingStatus.unfurnished;

  @override
  void initState() {
    super.initState();
    final ap = widget.apartment;
    _numberController = TextEditingController(text: ap?.apartmentNumber);
    _sizeController = TextEditingController(
      text: ap?.totalSizeSquareFeet.toString(),
    );
    _rentController = TextEditingController(text: ap?.monthlyRent?.toString());
    _depositController = TextEditingController(
      text: ap?.securityDeposit?.toString(),
    );
    _bedroomsController = TextEditingController(
      text: ap?.totalBedrooms.toString(),
    );
    _bathroomsController = TextEditingController(
      text: ap?.totalBathrooms.toString(),
    );
    _descriptionController = TextEditingController(text: ap?.description);
    _notesController = TextEditingController(text: ap?.notes);

    _selectedFloorId = ap?.floorId;
    _selectedStatus = ap?.status ?? ApartmentStatus.vacant;
    _selectedFurnishing = ap?.furnishing ?? FurnishingStatus.unfurnished;
  }

  @override
  void dispose() {
    _numberController.dispose();
    _sizeController.dispose();
    _rentController.dispose();
    _depositController.dispose();
    _bedroomsController.dispose();
    _bathroomsController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      final apartment =
          widget.apartment?.copyWith(
            floorId: _selectedFloorId!,
            apartmentNumber: _numberController.text,
            totalSizeSquareFeet: double.tryParse(_sizeController.text) ?? 0.0,
            totalBedrooms: int.tryParse(_bedroomsController.text) ?? 0,
            totalBathrooms: int.tryParse(_bathroomsController.text) ?? 0,
            monthlyRent: double.tryParse(_rentController.text),
            securityDeposit: double.tryParse(_depositController.text),
            description: _descriptionController.text.isEmpty
                ? null
                : _descriptionController.text,
            notes: _notesController.text.isEmpty ? null : _notesController.text,
            status: _selectedStatus,
            furnishing: _selectedFurnishing,
            updatedAt: now,
          ) ??
          Apartment(
            id: '',
            condominiumId: widget.condo.id,
            agencyId: widget.condo.agencyId ?? '',
            floorId: _selectedFloorId!,
            apartmentNumber: _numberController.text,
            totalSizeSquareFeet: double.tryParse(_sizeController.text) ?? 0.0,
            totalBedrooms: int.tryParse(_bedroomsController.text) ?? 0,
            totalBathrooms: int.tryParse(_bathroomsController.text) ?? 0,
            monthlyRent: double.tryParse(_rentController.text),
            securityDeposit: double.tryParse(_depositController.text),
            description: _descriptionController.text.isEmpty
                ? null
                : _descriptionController.text,
            notes: _notesController.text.isEmpty ? null : _notesController.text,
            status: _selectedStatus,
            furnishing: _selectedFurnishing,
            createdAt: now,
            updatedAt: now,
          );

      final bloc = context.read<ApartmentBloc>();
      if (widget.isEditing) {
        bloc.add(ApartmentEvent.updateApartment(apartment: apartment));
      } else {
        bloc.add(ApartmentEvent.createApartment(apartment: apartment));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocListener<ApartmentBloc, ApartmentState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            context.pop(true);
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: theme.colorScheme.error,
              ),
            );
          },
        );
      },
      child: ProConnectLayout(
        useGlass: false,
        useScrolling: true,
        centerContent: false,
        appBar: AppBar(
          title: Text(
            widget.isEditing ? l10n.editApartment : l10n.addApartment,
          ),
        ),
        child: BlocBuilder<FloorBloc, floor_state.FloorState>(
          builder: (context, floorState) {
            return floorState.maybeWhen(
              loaded: (floors) {
                if (floors.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.p24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.layers_rounded,
                            size: 64,
                            color: theme.colorScheme.outline,
                          ),
                          AppSpacing.gapH16,
                          Text(
                            l10n.pleaseAddFloorFirst,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium,
                          ),
                          AppSpacing.gapH24,
                          AppButton(
                            onPressed: () => context.pop(),
                            label: l10n.cancel,
                            type: AppButtonType.outlined,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.p24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildSectionTitle(theme, l10n.basicInformation),
                        AppSpacing.gapH16,
                        CustomDropdownField<String>(
                          labelText: l10n.floor,
                          value: _selectedFloorId,
                          items: floors.map((f) {
                            return DropdownMenuItem(
                              value: f.id,
                              child: Text(
                                f.floorName ?? 'Floor ${f.floorNumber}',
                              ),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _selectedFloorId = val),
                          validator: (val) => val == null ? 'Required' : null,
                          prefixIcon: const Icon(Icons.layers_rounded),
                        ),
                        AppSpacing.gapH16,
                        CustomTextField(
                          controller: _numberController,
                          labelText: l10n.apartmentNumber,
                          prefixIcon: const Icon(Icons.numbers_rounded),
                          validator: (val) =>
                              val == null || val.isEmpty ? 'Required' : null,
                        ),
                        AppSpacing.gapH24,
                        _buildSectionTitle(theme, l10n.buildingSpecifications),
                        AppSpacing.gapH16,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _bedroomsController,
                                labelText: l10n.bedrooms,
                                keyboardType: TextInputType.number,
                                prefixIcon: const Icon(Icons.bed_rounded),
                              ),
                            ),
                            AppSpacing.gapW16,
                            Expanded(
                              child: CustomTextField(
                                controller: _bathroomsController,
                                labelText: l10n.bathrooms,
                                keyboardType: TextInputType.number,
                                prefixIcon: const Icon(Icons.bathtub_rounded),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.gapH16,
                        CustomTextField(
                          controller: _sizeController,
                          labelText: l10n.sizeSqft,
                          keyboardType: TextInputType.number,
                          prefixIcon: const Icon(Icons.square_foot_rounded),
                        ),
                        AppSpacing.gapH16,
                        CustomDropdownField<FurnishingStatus>(
                          labelText: l10n.furnished,
                          value: _selectedFurnishing,
                          items: FurnishingStatus.values.map((s) {
                            String label;
                            switch (s) {
                              case FurnishingStatus.unfurnished:
                                label = l10n.unfurnished;
                                break;
                              case FurnishingStatus.partiallyFurnished:
                                label = l10n.partiallyFurnished;
                                break;
                              case FurnishingStatus.fullyFurnished:
                                label = l10n.fullyFurnished;
                                break;
                            }
                            return DropdownMenuItem(
                              value: s,
                              child: Text(label),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _selectedFurnishing = val!),
                          prefixIcon: const Icon(Icons.chair_rounded),
                        ),
                        AppSpacing.gapH24,
                        _buildSectionTitle(theme, l10n.status),
                        AppSpacing.gapH16,
                        CustomDropdownField<ApartmentStatus>(
                          labelText: l10n.status,
                          value: _selectedStatus,
                          items: ApartmentStatus.values.map((s) {
                            String label;
                            switch (s) {
                              case ApartmentStatus.vacant:
                                label = l10n.vacant;
                                break;
                              case ApartmentStatus.occupied:
                                label = l10n.occupied;
                                break;
                              case ApartmentStatus.maintenance:
                                label = l10n.maintenance;
                                break;
                              case ApartmentStatus.reserved:
                                label = l10n.reserved;
                                break;
                            }
                            return DropdownMenuItem(
                              value: s,
                              child: Text(label),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _selectedStatus = val!),
                          prefixIcon: const Icon(Icons.info_rounded),
                        ),
                        AppSpacing.gapH24,
                        _buildSectionTitle(
                          theme,
                          '${l10n.monthlyRent} & ${l10n.securityDeposit}',
                        ),
                        AppSpacing.gapH16,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _rentController,
                                labelText: l10n.monthlyRent,
                                keyboardType: TextInputType.number,
                                prefixIcon: const Icon(
                                  Icons.attach_money_rounded,
                                ),
                              ),
                            ),
                            AppSpacing.gapW16,
                            Expanded(
                              child: CustomTextField(
                                controller: _depositController,
                                labelText: l10n.securityDeposit,
                                keyboardType: TextInputType.number,
                                prefixIcon: const Icon(
                                  Icons.account_balance_wallet_rounded,
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.gapH24,
                        _buildSectionTitle(theme, l10n.description),
                        AppSpacing.gapH16,
                        CustomTextField(
                          controller: _descriptionController,
                          labelText: l10n.description,
                          maxLines: 3,
                          prefixIcon: const Icon(Icons.description_rounded),
                        ),
                        AppSpacing.gapH16,
                        CustomTextField(
                          controller: _notesController,
                          labelText: l10n.notes,
                          maxLines: 2,
                          prefixIcon: const Icon(Icons.note_rounded),
                        ),
                        AppSpacing.gapH32,
                        AppButton(
                          onPressed: _handleSubmit,
                          label: widget.isEditing
                              ? l10n.saveChanges
                              : l10n.createApartment,
                          icon: widget.isEditing
                              ? Icons.save_rounded
                              : Icons.add_rounded,
                          expand: true,
                        ),
                        AppSpacing.gapH8,
                      ],
                    ),
                  ),
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        AppSpacing.gapH4,
        Container(
          height: 2,
          width: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }
}
