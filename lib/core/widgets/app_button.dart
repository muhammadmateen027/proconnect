import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';

/// A versatile, reusable button widget that can be used throughout the app
/// Supports different button types, loading states, icons, and styling
class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.label,
    super.key,
    this.icon,
    this.isLoading = false,
    this.type = AppButtonType.filled,
    this.expand = false,
    this.padding,
  });

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button label text
  final String label;

  /// Optional icon to display before the label
  final IconData? icon;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Button type (filled, outlined, text)
  final AppButtonType type;

  /// Whether the button should expand to fill available width
  final bool expand;

  /// Custom padding for the button
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final buttonChild = _buildButtonChild();
    final effectiveOnPressed = isLoading ? null : onPressed;
    final effectivePadding =
        padding ??
        const EdgeInsets.symmetric(
          vertical: AppSpacing.p16,
          horizontal: AppSpacing.p24,
        );

    Widget button;

    switch (type) {
      case AppButtonType.filled:
        button = icon != null
            ? FilledButton.icon(
                onPressed: effectiveOnPressed,
                icon: buttonChild.icon!,
                label: buttonChild.label,
                style: FilledButton.styleFrom(padding: effectivePadding),
              )
            : FilledButton(
                onPressed: effectiveOnPressed,
                style: FilledButton.styleFrom(padding: effectivePadding),
                child: buttonChild.label,
              );
        break;

      case AppButtonType.outlined:
        button = icon != null
            ? OutlinedButton.icon(
                onPressed: effectiveOnPressed,
                icon: buttonChild.icon!,
                label: buttonChild.label,
                style: OutlinedButton.styleFrom(padding: effectivePadding),
              )
            : OutlinedButton(
                onPressed: effectiveOnPressed,
                style: OutlinedButton.styleFrom(padding: effectivePadding),
                child: buttonChild.label,
              );
        break;

      case AppButtonType.text:
        button = icon != null
            ? TextButton.icon(
                onPressed: effectiveOnPressed,
                icon: buttonChild.icon!,
                label: buttonChild.label,
                style: TextButton.styleFrom(padding: effectivePadding),
              )
            : TextButton(
                onPressed: effectiveOnPressed,
                style: TextButton.styleFrom(padding: effectivePadding),
                child: buttonChild.label,
              );
        break;

      case AppButtonType.elevated:
        button = icon != null
            ? ElevatedButton.icon(
                onPressed: effectiveOnPressed,
                icon: buttonChild.icon!,
                label: buttonChild.label,
                style: ElevatedButton.styleFrom(padding: effectivePadding),
              )
            : ElevatedButton(
                onPressed: effectiveOnPressed,
                style: ElevatedButton.styleFrom(padding: effectivePadding),
                child: buttonChild.label,
              );
        break;
    }

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }

  /// Builds the button child (icon and label) based on loading state
  _ButtonChild _buildButtonChild() {
    if (isLoading) {
      return _ButtonChild(
        icon: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        label: Text(label),
      );
    }

    return _ButtonChild(
      icon: icon != null ? Icon(icon) : null,
      label: Text(label),
    );
  }
}

/// Helper class to hold button child widgets
class _ButtonChild {
  const _ButtonChild({
    required this.label,
    this.icon,
  });

  final Widget? icon;
  final Widget label;
}

/// Enum for different button types
enum AppButtonType {
  /// Filled button (primary action)
  filled,

  /// Outlined button (secondary action)
  outlined,

  /// Text button (tertiary action)
  text,

  /// Elevated button (legacy, use filled instead)
  elevated,
}
