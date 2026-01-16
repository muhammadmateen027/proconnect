import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom text styles for the ProConnect application.
/// Provides additional text styles beyond the standard Material theme.
class AppTextStyles {
  AppTextStyles._();

  // Display styles for large headings
  static TextStyle displayLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    color: color,
  );

  static TextStyle displayMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle displaySmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: color,
  );

  // Headline styles
  static TextStyle headlineLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle headlineMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle headlineSmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color,
  );

  // Title styles
  static TextStyle titleLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: color,
  );

  static TextStyle titleMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: color,
  );

  static TextStyle titleSmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: color,
  );

  // Body styles
  static TextStyle bodyLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: color,
  );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: color,
  );

  // Label styles
  static TextStyle labelLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: color,
  );

  static TextStyle labelMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle labelSmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: color,
  );

  // Custom styles for specific use cases
  static TextStyle button({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle caption({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: color,
  );

  static TextStyle overline({Color? color}) => GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: color,
  );

  // Specialized styles for the app
  static TextStyle currency({Color? color}) => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: color,
  );

  static TextStyle currencySmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: color,
  );

  static TextStyle unitNumber({Color? color}) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle statusLabel({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
    color: color,
  );

  static TextStyle cardTitle({Color? color}) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: color,
  );

  static TextStyle cardSubtitle({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: color,
  );

  static TextStyle sectionHeader({Color? color}) => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: color,
  );

  static TextStyle inputLabel({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: color,
  );

  static TextStyle inputText({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle inputHint({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: color?.withOpacity(0.6),
  );

  static TextStyle errorText({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: color,
  );

  static TextStyle link({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    decoration: TextDecoration.underline,
    color: color,
  );

  static TextStyle tabLabel({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: color,
  );

  static TextStyle appBarTitle({Color? color}) => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: color,
  );
}
