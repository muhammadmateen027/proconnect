import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/auth_background.dart';
import 'package:proconnect/core/widgets/auth_header.dart';
import 'package:proconnect/core/widgets/auth_redirect.dart';
import 'package:proconnect/core/widgets/custom_auth_button.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/domain/models/app_user.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  UserRole _selectedRole = UserRole.tenant;

  String _getErrorMessage(String? errorKey, AppLocalizations l10n) {
    switch (errorKey) {
      case 'loginFailed':
        return l10n.loginFailed;
      case 'signUpFailed':
        return l10n.signUpFailed;
      default:
        return l10n.unknownError;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AuthBackground(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: (_) => context.go(AppRoutes.home),
            unauthenticated: (errorKey) {
              if (errorKey != null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text(_getErrorMessage(errorKey, l10n))),
                  );
              }
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthHeader(
                  title: l10n.createAccount,
                  subtitle: l10n.getStarted,
                ),
                AppSpacing.gapH48,
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
                  initialValue: _selectedRole,
                  onChanged: (role) => setState(() => _selectedRole = role!),
                  items: UserRole.values
                      .map(
                        (role) => DropdownMenuItem(
                          value: role,
                          child: Text(role.name),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: l10n.iAmA,
                    labelStyle: GoogleFonts.poppins(
                      color: Colors.grey.shade700,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue.shade700,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: GoogleFonts.poppins(color: Colors.black87),
                  dropdownColor: Colors.white,
                ),
                AppSpacing.gapH32,
                CustomAuthButton(
                  text: l10n.signUp,
                  isLoading: isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        AuthEvent.signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                          fullName: _fullNameController.text,
                          role: _selectedRole,
                          condominiumId: 'default-site',
                          agencyId: 'default-org',
                        ),
                      );
                    }
                  },
                ),
                AppSpacing.gapH24,
                AuthRedirect(
                  text: l10n.alreadyHaveAnAccount,
                  buttonText: l10n.login,
                  onPressed: () => context.go(AppRoutes.login),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
