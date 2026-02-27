import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/widgets/auth_header.dart';
import 'package:proconnect/core/widgets/auth_redirect.dart';
import 'package:proconnect/core/widgets/custom_auth_button.dart';
import 'package:proconnect/core/widgets/custom_text_field.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _getErrorMessage(String? errorKey, AppLocalizations l10n) {
    switch (errorKey) {
      case 'loginFailed':
        return l10n.loginFailed;
      case 'signUpFailed':
        return l10n.signUpFailed;
      case 'invalidCredentials':
        return l10n.invalidCredentials;
      case 'emailAlreadyInUse':
        return l10n.emailAlreadyInUse;
      case 'weakPassword':
        return l10n.weakPassword;
      default:
        return l10n.unknownError;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ProConnectLayout(
      centerContent: true,
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
                  title: l10n.welcomeBack,
                  subtitle: l10n.signInToContinue,
                ),
                AppSpacing.gapH48,
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
                      value!.isEmpty ? l10n.passwordIsRequired : null,
                ),
                AppSpacing.gapH32,
                CustomAuthButton(
                  text: l10n.login,
                  isLoading: isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        AuthEvent.login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                ),
                AppSpacing.gapH24,
                AuthRedirect(
                  text: l10n.dontHaveAnAccount,
                  buttonText: l10n.signUp,
                  onPressed: () => context.go(AppRoutes.register),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
