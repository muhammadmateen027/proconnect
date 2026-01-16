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
    this.condoId,
    this.initialName,
    this.initialAddress,
  });

  final String? condoId;
  final String? initialName;
  final String? initialAddress;

  bool get isEditing => condoId != null;

  @override
  State<CreateEditCondoPage> createState() => _CreateEditCondoPageState();
}

class _CreateEditCondoPageState extends State<CreateEditCondoPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _addressController = TextEditingController(text: widget.initialAddress);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
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

    if (widget.isEditing) {
      bloc.add(
        CondoManagementEvent.updateCondo(
          condo: Condo(
            id: widget.condoId!,
            name: _nameController.text.trim(),
            address: _addressController.text.trim(),
          ),
        ),
      );
    } else {
      bloc.add(
        CondoManagementEvent.createCondo(
          name: _nameController.text.trim(),
          address: _addressController.text.trim(),
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
                      textInputAction: TextInputAction.done,
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return l10n.condoAddressRequired;
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => _handleSubmit(),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.gapH24,
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
