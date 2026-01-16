import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proconnect/core/theme/app_colors.dart';
import 'package:proconnect/core/theme/app_decorations.dart';
import 'package:proconnect/core/theme/app_text_styles.dart';

/// Application theme configuration using FlexColorScheme for Material 3.
/// Provides both light and dark themes with comprehensive customization.
class AppTheme {
  AppTheme._();

  // Common theme configurations (using AppDecorations for consistency)
  static const double _borderRadius = AppDecorations.radiusMedium;
  static const double _cardElevation = 2;
  static const double _buttonElevation = 1;

  /// Light theme configuration
  static ThemeData get lightTheme {
    final baseTheme = FlexThemeData.light(
      scheme: FlexScheme.blueWhale,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        useMaterial3Typography: true, // Fixed: replaced useTextTheme
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,

        // Input decoration theme
        inputDecoratorRadius: _borderRadius,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorFillColor: AppColors.grey50,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedBorderIsColored: false,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,

        // Button themes
        elevatedButtonRadius: _borderRadius,
        elevatedButtonElevation: _buttonElevation,
        elevatedButtonSchemeColor: SchemeColor.primary,

        outlinedButtonRadius: _borderRadius,
        outlinedButtonSchemeColor: SchemeColor.primary,

        textButtonRadius: _borderRadius,
        textButtonSchemeColor: SchemeColor.primary,

        // Card theme
        cardRadius: _borderRadius,
        cardElevation: _cardElevation,

        // AppBar theme
        appBarBackgroundSchemeColor: SchemeColor.surface,
        appBarScrolledUnderElevation: 2,

        // Navigation bar theme
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
        navigationBarBackgroundSchemeColor: SchemeColor.surface,
        navigationBarElevation: 0,
        navigationBarHeight: 80,
        navigationBarLabelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow,

        // Chip theme
        chipRadius: _borderRadius,
        chipSchemeColor: SchemeColor.primaryContainer,
        chipSelectedSchemeColor: SchemeColor.primary,

        // Dialog theme
        dialogRadius: _borderRadius,
        dialogElevation: 6,
        dialogBackgroundSchemeColor: SchemeColor.surface,

        // FAB theme
        fabRadius: _borderRadius,
        fabUseShape: true,
        fabSchemeColor: SchemeColor.primary,

        // Snackbar theme
        snackBarRadius: _borderRadius,
        snackBarElevation: 4,
        snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,

        // Bottom sheet theme
        bottomSheetRadius: AppDecorations.radiusLarge,
        bottomSheetElevation: 4,
        bottomSheetModalElevation: 8,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );

    // Additional customizations
    return baseTheme.copyWith(
      // Custom text theme using AppTextStyles
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme).copyWith(
        displayLarge: AppTextStyles.displayLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        displayMedium: AppTextStyles.displayMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        displaySmall: AppTextStyles.displaySmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        headlineLarge: AppTextStyles.headlineLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        headlineMedium: AppTextStyles.headlineMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        headlineSmall: AppTextStyles.headlineSmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        titleLarge: AppTextStyles.titleLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        titleMedium: AppTextStyles.titleMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        titleSmall: AppTextStyles.titleSmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        bodyLarge: AppTextStyles.bodyLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        bodyMedium: AppTextStyles.bodyMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        bodySmall: AppTextStyles.bodySmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        labelLarge: AppTextStyles.labelLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        labelMedium: AppTextStyles.labelMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        labelSmall: AppTextStyles.labelSmall(
          color: baseTheme.colorScheme.onSurface,
        ),
      ),

      // Custom divider theme
      dividerTheme: const DividerThemeData(
        space: 1,
        thickness: 1,
        indent: 0,
        endIndent: 0,
      ),

      // Custom list tile theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minLeadingWidth: 40,
      ),

      // Custom icon theme
      iconTheme: IconThemeData(
        size: 24,
        color: baseTheme.colorScheme.onSurface,
      ),

      // Custom bottom sheet theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDecorations.borderRadiusTopLarge,
        ),
      ),

      // Dropdown menu theme
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
          color: baseTheme.colorScheme.onSurface,
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(
            baseTheme.colorScheme.surface,
          ),
        ),
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    final baseTheme = FlexThemeData.dark(
      scheme: FlexScheme.blueWhale,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useMaterial3Typography: true, // Fixed: replaced useTextTheme
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,

        // Input decoration theme
        inputDecoratorRadius: _borderRadius,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorFillColor: AppColors.grey900,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedBorderIsColored: false,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,

        // Button themes
        elevatedButtonRadius: _borderRadius,
        elevatedButtonElevation: _buttonElevation,
        elevatedButtonSchemeColor: SchemeColor.primary,

        outlinedButtonRadius: _borderRadius,
        outlinedButtonSchemeColor: SchemeColor.primary,

        textButtonRadius: _borderRadius,
        textButtonSchemeColor: SchemeColor.primary,

        // Card theme
        cardRadius: _borderRadius,
        cardElevation: _cardElevation,

        // AppBar theme
        appBarBackgroundSchemeColor: SchemeColor.surface,
        appBarScrolledUnderElevation: 2,

        // Navigation bar theme
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarIndicatorSchemeColor: SchemeColor.primaryContainer,
        navigationBarBackgroundSchemeColor: SchemeColor.surface,
        navigationBarElevation: 0,
        navigationBarHeight: 80,
        navigationBarLabelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow,

        // Chip theme
        chipRadius: _borderRadius,
        chipSchemeColor: SchemeColor.primaryContainer,
        chipSelectedSchemeColor: SchemeColor.primary,

        // Dialog theme
        dialogRadius: _borderRadius,
        dialogElevation: 6,
        dialogBackgroundSchemeColor: SchemeColor.surface,

        // FAB theme
        fabRadius: _borderRadius,
        fabUseShape: true,
        fabSchemeColor: SchemeColor.primary,

        // Snackbar theme
        snackBarRadius: _borderRadius,
        snackBarElevation: 4,
        snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,

        // Bottom sheet theme
        bottomSheetRadius: AppDecorations.radiusLarge,
        bottomSheetElevation: 4,
        bottomSheetModalElevation: 8,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );

    // Additional customizations
    return baseTheme.copyWith(
      // Custom text theme using AppTextStyles
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme).copyWith(
        displayLarge: AppTextStyles.displayLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        displayMedium: AppTextStyles.displayMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        displaySmall: AppTextStyles.displaySmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        headlineLarge: AppTextStyles.headlineLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        headlineMedium: AppTextStyles.headlineMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        headlineSmall: AppTextStyles.headlineSmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        titleLarge: AppTextStyles.titleLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        titleMedium: AppTextStyles.titleMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        titleSmall: AppTextStyles.titleSmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        bodyLarge: AppTextStyles.bodyLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        bodyMedium: AppTextStyles.bodyMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        bodySmall: AppTextStyles.bodySmall(
          color: baseTheme.colorScheme.onSurface,
        ),
        labelLarge: AppTextStyles.labelLarge(
          color: baseTheme.colorScheme.onSurface,
        ),
        labelMedium: AppTextStyles.labelMedium(
          color: baseTheme.colorScheme.onSurface,
        ),
        labelSmall: AppTextStyles.labelSmall(
          color: baseTheme.colorScheme.onSurface,
        ),
      ),

      // Custom divider theme
      dividerTheme: const DividerThemeData(
        space: 1,
        thickness: 1,
        indent: 0,
        endIndent: 0,
      ),

      // Custom list tile theme
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minLeadingWidth: 40,
      ),

      // Custom icon theme
      iconTheme: IconThemeData(
        size: 24,
        color: baseTheme.colorScheme.onSurface,
      ),

      // Custom bottom sheet theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDecorations.borderRadiusTopLarge,
        ),
      ),

      // Dropdown menu theme
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
          color: baseTheme.colorScheme.onSurface,
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(
            baseTheme.colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
