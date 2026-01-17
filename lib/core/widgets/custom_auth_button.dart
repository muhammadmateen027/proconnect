import 'package:flutter/material.dart';
import 'package:proconnect/core/widgets/app_button.dart';

/// Authentication button widget
/// A specialized button for auth screens that expands to full width
/// This is a convenience wrapper around AppButton for auth flows
class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      label: text,
      isLoading: isLoading,
      expand: true,
      type: AppButtonType.elevated,
    );
  }
}
