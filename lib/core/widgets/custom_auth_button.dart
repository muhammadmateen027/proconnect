import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {

  const CustomAuthButton({
    required this.onPressed, required this.text, super.key,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 3),
              )
            : Text(text),
      ),
    );
  }
}
