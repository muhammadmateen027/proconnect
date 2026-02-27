import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_dropdown_field.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/domain/models/apartment.dart';
import 'package:proconnect/domain/models/guest_invitation.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/pages/owner/bloc/apartment/owner_apartment_bloc.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_bloc.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_event.dart';
import 'package:proconnect/pages/owner/bloc/guest/guest_state.dart';
import 'package:proconnect/pages/owner/widgets/guest_pass_card.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_bloc.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_event.dart';
import 'package:proconnect/pages/tenant/bloc/apartment/tenant_apartment_state.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

class CreateEditGuestInvitationPage extends StatefulWidget {
  const CreateEditGuestInvitationPage({
    this.invitation,
    super.key,
  });

  final GuestInvitation? invitation;

  @override
  State<CreateEditGuestInvitationPage> createState() =>
      _CreateEditGuestInvitationPageState();
}

class _CreateEditGuestInvitationPageState
    extends State<CreateEditGuestInvitationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _purposeController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _expiryTimeController = TextEditingController();
  final _screenshotController = ScreenshotController();

  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _selectedTime = const TimeOfDay(hour: 12, minute: 0);
  Apartment? _selectedApartment;
  GuestInvitation? _currentInvitation;

  @override
  void initState() {
    super.initState();
    _currentInvitation = widget.invitation;
    if (_currentInvitation != null) {
      _nameController.text = _currentInvitation!.guestName;
      _purposeController.text = _currentInvitation!.purpose;
      _selectedDate = _currentInvitation!.expiryDate;
      _selectedTime = TimeOfDay.fromDateTime(_currentInvitation!.expiryDate);
    }

    // Trigger apartment load
    final authState = context.read<AuthBloc>().state;
    authState.whenOrNull(
      authenticated: (user) {
        if (user.role == UserRole.owner) {
          context.read<OwnerApartmentBloc>().add(
            OwnerApartmentEvent.loadApartments(user.uid),
          );
        } else if (user.role == UserRole.tenant) {
          context.read<TenantApartmentBloc>().add(
            TenantApartmentEvent.load(user.uid),
          );
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateDateTimeControllers();
  }

  void _updateDateTimeControllers() {
    _expiryDateController.text = DateFormat.yMMMd().format(_selectedDate);
    _expiryTimeController.text = _selectedTime.format(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _purposeController.dispose();
    _expiryDateController.dispose();
    _expiryTimeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _updateDateTimeControllers();
      });
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _updateDateTimeControllers();
      });
    }
  }

  void _saveInvitation() {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    if (_selectedApartment == null && _currentInvitation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.selectApartment)),
      );
      return;
    }

    final expiry = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    final user = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );

    if (user == null) return;

    final invitation =
        _currentInvitation?.copyWith(
          guestName: _nameController.text,
          purpose: _purposeController.text,
          expiryDate: expiry,
        ) ??
        GuestInvitation(
          id: const Uuid().v4(),
          ownerId: user.uid,
          apartmentId: _selectedApartment!.id,
          apartmentNumber: _selectedApartment!.apartmentNumber,
          condoName: _selectedApartment!.condoName,
          guestName: _nameController.text,
          purpose: _purposeController.text,
          expiryDate: expiry,
          createdAt: DateTime.now(),
          isUsed: false,
        );

    setState(() {
      _currentInvitation = invitation;
    });

    if (widget.invitation != null) {
      context.read<GuestBloc>().add(GuestEvent.updateInvitation(invitation));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.invitationUpdatedSuccess)),
      );
    } else {
      context.read<GuestBloc>().add(GuestEvent.createInvitation(invitation));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.qrCodeGeneratedSuccess)),
      );
    }
  }

  Future<void> _shareQR() async {
    if (_currentInvitation == null) return;

    final l10n = context.l10n;
    final expiryStr = DateFormat.yMMMd().add_Hm().format(
      _currentInvitation!.expiryDate,
    );
    final shareText =
        '${l10n.qrPassFor(_currentInvitation!.guestName)}\n'
        '${l10n.building}: ${_currentInvitation!.condoName ?? ""}\n'
        '${l10n.apartment}: ${_currentInvitation!.apartmentNumber ?? ""}\n'
        '${l10n.purpose}: ${_currentInvitation!.purpose}\n'
        '${l10n.expires}: $expiryStr\n'
        '${l10n.id}: ${_currentInvitation!.id}';

    if (kIsWeb) {
      await Share.share(shareText);
      return;
    }

    try {
      final image = await _screenshotController.capture();
      if (image == null) return;

      final directory = await getTemporaryDirectory();
      final imagePath = await File('${directory.path}/guest_qr.png').create();
      await imagePath.writeAsBytes(image);

      await Share.shareXFiles(
        [XFile(imagePath.path)],
        text: shareText,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.failedToShare(e))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ProConnectLayout(
      useGlass: true,
      appBar: AppBar(
        title: Text(
          _currentInvitation == null ? l10n.inviteGuest : l10n.editDetails,
        ),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<OwnerApartmentBloc, OwnerApartmentState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (apartments) {
                  _onApartmentsLoaded(apartments);
                },
              );
            },
          ),
          BlocListener<TenantApartmentBloc, TenantApartmentState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (apartments) {
                  _onApartmentsLoaded(apartments);
                },
              );
            },
          ),
          BlocListener<GuestBloc, GuestState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                },
              );
            },
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_currentInvitation != null) ...[
                Center(
                  child: Screenshot(
                    controller: _screenshotController,
                    child: GuestPassCard(invitation: _currentInvitation!),
                  ),
                ),
                AppSpacing.gapH24,
                AppButton(
                  onPressed: _shareQR,
                  icon: Icons.share_rounded,
                  label: l10n.shareQRCode,
                  expand: true,
                ),
                AppSpacing.gapH32,
                const Divider(),
                AppSpacing.gapH24,
              ],
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.invitationDetails,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSpacing.gapH24,
                    if (_currentInvitation == null) ...[
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, authState) {
                          final role = authState.maybeWhen(
                            authenticated: (user) => user.role,
                            orElse: () => null,
                          );

                          if (role == UserRole.owner) {
                            return BlocBuilder<
                              OwnerApartmentBloc,
                              OwnerApartmentState
                            >(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  loaded: (apartments) =>
                                      _buildApartmentDropdown(apartments, l10n),
                                  orElse: () => const LinearProgressIndicator(),
                                );
                              },
                            );
                          } else if (role == UserRole.tenant) {
                            return BlocBuilder<
                              TenantApartmentBloc,
                              TenantApartmentState
                            >(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  loaded: (apartments) =>
                                      _buildApartmentDropdown(apartments, l10n),
                                  orElse: () => const LinearProgressIndicator(),
                                );
                              },
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      AppSpacing.gapH16,
                    ],
                    CustomTextField(
                      controller: _nameController,
                      labelText: l10n.guestName,
                      prefixIcon: const Icon(Icons.person_outline_rounded),
                      validator: (value) => value?.isEmpty ?? true
                          ? l10n.fullNameIsRequired
                          : null,
                    ),
                    AppSpacing.gapH16,
                    CustomTextField(
                      controller: _purposeController,
                      labelText: l10n.purposeOfVisit,
                      prefixIcon: const Icon(Icons.description_outlined),
                      maxLines: 2,
                    ),
                    AppSpacing.gapH16,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: _selectDate,
                            borderRadius: BorderRadius.circular(AppSpacing.p16),
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: _expiryDateController,
                                labelText: l10n.expiryDate,
                                prefixIcon: const Icon(
                                  Icons.calendar_today_rounded,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.gapW16,
                        Expanded(
                          child: InkWell(
                            onTap: _selectTime,
                            borderRadius: BorderRadius.circular(AppSpacing.p16),
                            child: AbsorbPointer(
                              child: CustomTextField(
                                controller: _expiryTimeController,
                                labelText: l10n.expiryTime,
                                prefixIcon: const Icon(
                                  Icons.access_time_rounded,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.gapH32,
                    AppButton(
                      onPressed: _saveInvitation,
                      label: _currentInvitation == null
                          ? l10n.generateQRCode
                          : l10n.updateDetails,
                      expand: true,
                    ),
                    if (_currentInvitation != null) ...[
                      AppSpacing.gapH16,
                      AppButton(
                        onPressed: () => context.pop(),
                        label: l10n.done,
                        expand: true,
                        type: AppButtonType.text,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onApartmentsLoaded(List<Apartment> apartments) {
    if (_selectedApartment == null && apartments.isNotEmpty) {
      setState(() {
        if (_currentInvitation != null) {
          _selectedApartment = apartments.firstWhere(
            (a) => a.id == _currentInvitation!.apartmentId,
            orElse: () => apartments.first,
          );
        } else {
          _selectedApartment = apartments.first;
        }
      });
    }
  }

  Widget _buildApartmentDropdown(
    List<Apartment> apartments,
    AppLocalizations l10n,
  ) {
    return CustomDropdownField<Apartment>(
      labelText: l10n.selectApartment,
      value: _selectedApartment,
      items: apartments.map((a) {
        return DropdownMenuItem(
          value: a,
          child: Text(
            '${a.apartmentNumber} (${a.condoName ?? ''})',
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedApartment = value;
        });
      },
      validator: (value) => value == null ? l10n.selectApartment : null,
      prefixIcon: const Icon(Icons.apartment_rounded),
    );
  }
}
