import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthRedirect extends StatelessWidget {

  const AuthRedirect({
    required this.text, required this.buttonText, required this.onPressed, super.key,
  });
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(color: Colors.white70),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
