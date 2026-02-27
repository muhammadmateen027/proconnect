import 'package:flutter/material.dart';

/// Custom color palette for the ProConnect application.
/// Provides semantic color definitions for consistent theming.
class AppColors {
  AppColors._();

  // Primary colors - Blue Whale scheme
  static const Color primaryLight = Color(0xFF00296B);
  static const Color primaryDark = Color(0xFF5C9EFF);

  static const Color secondaryLight = Color(0xFF00509E);
  static const Color secondaryDark = Color(0xFF82B1FF);

  static const Color tertiaryLight = Color(0xFF0091EA);
  static const Color tertiaryDark = Color(0xFF448AFF);

  // Semantic colors for business logic
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);

  static const Color warning = Color(0xFFFFA726);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);

  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFEF5350);
  static const Color errorDark = Color(0xFFC62828);

  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  // Status colors for units/tenants
  static const Color occupied = Color(0xFF4CAF50);
  static const Color vacant = Color(0xFFFF9800);
  static const Color maintenance = Color(0xFFF44336);
  static const Color reserved = Color(0xFF2196F3);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryLight, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primaryGradientDark = LinearGradient(
    colors: [primaryDark, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow colors
  static Color shadowLight = Colors.black.withValues(alpha: 0.1);
  static Color shadowDark = Colors.black.withValues(alpha: 0.3);

  // Overlay colors
  static Color overlayLight = Colors.black.withValues(alpha: 0.5);
  static Color overlayDark = Colors.black.withValues(alpha: 0.7);

  // Helper method to get status color
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'occupied':
        return occupied;
      case 'vacant':
        return vacant;
      case 'maintenance':
        return maintenance;
      case 'reserved':
        return reserved;
      default:
        return grey500;
    }
  }

  // Helper method to get semantic color based on context
  static Color getSemanticColor(String type, {bool isDark = false}) {
    switch (type.toLowerCase()) {
      case 'success':
        return isDark ? successDark : success;
      case 'warning':
        return isDark ? warningDark : warning;
      case 'error':
        return isDark ? errorDark : error;
      case 'info':
        return isDark ? infoDark : info;
      default:
        return isDark ? grey700 : grey500;
    }
  }
}
