import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/admin/bloc/user_management/user_management_bloc.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/core/theme/app_spacing.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.createUser),
      ),
      body: BlocListener<UserManagementBloc, UserManagementState>(
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
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
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
                DropdownButtonFormField<UserRole>(
                  value: _selectedRole,
                  decoration: InputDecoration(labelText: l10n.role),
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
                ElevatedButton(
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
                  child: Text(l10n.createUser),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
