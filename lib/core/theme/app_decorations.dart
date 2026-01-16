import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_colors.dart';

/// Common decorations used throughout the ProConnect application.
/// Provides consistent styling for containers, cards, and other widgets.
class AppDecorations {
  AppDecorations._();

  // Border radius values
  static const double radiusSmall = 8;
  static const double radiusMedium = 12;
  static const double radiusLarge = 16;
  static const double radiusXLarge = 20;
  static const double radiusRound = 999;

  // Border radius objects
  static const BorderRadius borderRadiusSmall = BorderRadius.all(
    Radius.circular(radiusSmall),
  );
  static const BorderRadius borderRadiusMedium = BorderRadius.all(
    Radius.circular(radiusMedium),
  );
  static const BorderRadius borderRadiusLarge = BorderRadius.all(
    Radius.circular(radiusLarge),
  );
  static const BorderRadius borderRadiusXLarge = BorderRadius.all(
    Radius.circular(radiusXLarge),
  );
  static const BorderRadius borderRadiusRound = BorderRadius.all(
    Radius.circular(radiusRound),
  );

  // Top-only border radius (for bottom sheets, etc.)
  static const BorderRadius borderRadiusTopSmall = BorderRadius.only(
    topLeft: Radius.circular(radiusSmall),
    topRight: Radius.circular(radiusSmall),
  );
  static const BorderRadius borderRadiusTopMedium = BorderRadius.only(
    topLeft: Radius.circular(radiusMedium),
    topRight: Radius.circular(radiusMedium),
  );
  static const BorderRadius borderRadiusTopLarge = BorderRadius.only(
    topLeft: Radius.circular(radiusLarge),
    topRight: Radius.circular(radiusLarge),
  );

  // Card decorations
  static BoxDecoration cardLight({Color? color}) => BoxDecoration(
    color: color ?? AppColors.white,
    borderRadius: borderRadiusMedium,
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowLight,
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration cardDark({Color? color}) => BoxDecoration(
    color: color ?? AppColors.grey800,
    borderRadius: borderRadiusMedium,
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowDark,
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  // Elevated card decorations
  static BoxDecoration elevatedCardLight({Color? color}) => BoxDecoration(
    color: color ?? AppColors.white,
    borderRadius: borderRadiusMedium,
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowLight,
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration elevatedCardDark({Color? color}) => BoxDecoration(
    color: color ?? AppColors.grey800,
    borderRadius: borderRadiusMedium,
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowDark,
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Input field decorations
  static InputDecoration inputDecoration({
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool filled = true,
    Color? fillColor,
  }) => InputDecoration(
    labelText: labelText,
    hintText: hintText,
    helperText: helperText,
    errorText: errorText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: filled,
    fillColor: fillColor,
    border: const OutlineInputBorder(
      borderRadius: borderRadiusMedium,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: borderRadiusMedium,
      borderSide: BorderSide(color: AppColors.grey300),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: borderRadiusMedium,
      borderSide: BorderSide(color: AppColors.primaryLight, width: 2),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: borderRadiusMedium,
      borderSide: BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: borderRadiusMedium,
      borderSide: BorderSide(color: AppColors.error, width: 2),
    ),
  );

  // Container decorations with borders
  static BoxDecoration containerWithBorder({
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 1,
    BorderRadius? borderRadius,
  }) => BoxDecoration(
    color: backgroundColor,
    borderRadius: borderRadius ?? borderRadiusMedium,
    border: Border.all(
      color: borderColor ?? AppColors.grey300,
      width: borderWidth,
    ),
  );

  // Gradient decorations
  static BoxDecoration gradientDecoration({
    required Gradient gradient,
    BorderRadius? borderRadius,
  }) => BoxDecoration(
    gradient: gradient,
    borderRadius: borderRadius ?? borderRadiusMedium,
  );

  // Status badge decorations
  static BoxDecoration statusBadge({
    required Color color,
    bool isOutlined = false,
  }) => BoxDecoration(
    color: isOutlined ? Colors.transparent : color.withValues(alpha: 0.1),
    borderRadius: borderRadiusSmall,
    border: isOutlined ? Border.all(color: color, width: 1.5) : null,
  );

  // Chip decoration
  static BoxDecoration chipDecoration({
    Color? backgroundColor,
    Color? borderColor,
    bool isSelected = false,
  }) => BoxDecoration(
    color:
        backgroundColor ??
        (isSelected ? AppColors.primaryLight : AppColors.grey100),
    borderRadius: borderRadiusRound,
    border: borderColor != null ? Border.all(color: borderColor) : null,
  );

  // Bottom sheet decoration
  static BoxDecoration bottomSheetDecoration({
    Color? backgroundColor,
    bool isDark = false,
  }) => BoxDecoration(
    color: backgroundColor ?? (isDark ? AppColors.grey900 : AppColors.white),
    borderRadius: borderRadiusTopLarge,
    boxShadow: [
      BoxShadow(
        color: isDark ? AppColors.shadowDark : AppColors.shadowLight,
        blurRadius: 24,
        offset: const Offset(0, -4),
      ),
    ],
  );

  // Dialog decoration
  static BoxDecoration dialogDecoration({
    Color? backgroundColor,
    bool isDark = false,
  }) => BoxDecoration(
    color: backgroundColor ?? (isDark ? AppColors.grey900 : AppColors.white),
    borderRadius: borderRadiusLarge,
    boxShadow: [
      BoxShadow(
        color: isDark ? AppColors.shadowDark : AppColors.shadowLight,
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ],
  );

  // Divider decoration
  static BoxDecoration dividerDecoration({
    Color? color,
    double thickness = 1,
  }) => BoxDecoration(
    color: color ?? AppColors.grey300,
    borderRadius: BorderRadius.circular(thickness / 2),
  );

  // Image container decoration
  static BoxDecoration imageContainerDecoration({
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
  }) => BoxDecoration(
    borderRadius: borderRadius ?? borderRadiusMedium,
    boxShadow:
        boxShadow ??
        [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
  );

  // Shimmer decoration (for loading states)
  static BoxDecoration shimmerDecoration({
    Color? baseColor,
    Color? highlightColor,
  }) => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        baseColor ?? AppColors.grey200,
        highlightColor ?? AppColors.grey100,
        baseColor ?? AppColors.grey200,
      ],
      stops: const [0.0, 0.5, 1.0],
    ),
    borderRadius: borderRadiusMedium,
  );
}
