import 'package:flutter/material.dart';

class AuthRedirect extends StatelessWidget {

  const AuthRedirect({
    required this.text, required this.buttonText, required this.onPressed, super.key,
  });
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: theme.textTheme.bodyMedium),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
