import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/app_button.dart';
import 'package:proconnect/core/widgets/custom_dropdown_field.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/super_admin/bloc/user_management/user_management_bloc.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  UserRole _selectedRole = UserRole.agency_admin;

  String _getErrorMessage(String errorKey, AppLocalizations l10n) {
    switch (errorKey) {
      case 'createUserFailed':
        return l10n.createUserFailed;
      default:
        return l10n.unknownError;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ProConnectLayout(
      useGlass: false,
      appBar: AppBar(
        title: Text(l10n.createUser),
      ),
      child: BlocListener<UserManagementBloc, UserManagementState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              Navigator.of(context).pop();
            },
            failure: (errorKey) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_getErrorMessage(errorKey, l10n)),
                  backgroundColor: theme.colorScheme.error,
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Form(
            key: _formKey,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: theme.brightness == Brightness.dark
                          ? [
                              Colors.white.withValues(alpha: 0.12),
                              Colors.white.withValues(alpha: 0.04),
                            ]
                          : [
                              Colors.white.withValues(alpha: 0.7),
                              Colors.white.withValues(alpha: 0.35),
                            ],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: theme.brightness == Brightness.dark
                          ? Colors.white.withValues(alpha: 0.15)
                          : Colors.white.withValues(alpha: 0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        controller: _fullNameController,
                        labelText: l10n.fullName,
                        validator: (value) =>
                            value!.isEmpty ? l10n.fullNameIsRequired : null,
                      ),
                      AppSpacing.gapH16,
                      CustomTextField(
                        controller: _emailController,
                        labelText: l10n.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            value!.isEmpty ? l10n.emailIsRequired : null,
                      ),
                      AppSpacing.gapH16,
                      CustomTextField(
                        controller: _passwordController,
                        labelText: l10n.password,
                        obscureText: true,
                        validator: (value) =>
                            value!.length < 6 ? l10n.passwordMinLength : null,
                      ),
                      AppSpacing.gapH16,
                      CustomDropdownField<UserRole>(
                        value: _selectedRole,
                        labelText: l10n.role,
                        items: UserRole.values.map((role) {
                          return DropdownMenuItem(
                            value: role,
                            child: Text(role.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedRole = value;
                            });
                          }
                        },
                      ),
                      AppSpacing.gapH32,
                      AppButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<UserManagementBloc>().add(
                              UserManagementEvent.adminCreateUser(
                                email: _emailController.text,
                                password: _passwordController.text,
                                fullName: _fullNameController.text,
                                role: _selectedRole,
                              ),
                            );
                          }
                        },
                        label: l10n.createUser,
                        expand: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
