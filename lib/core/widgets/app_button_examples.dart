/// AppButton Usage Examples
///
/// This file demonstrates various ways to use the AppButton widget
/// throughout the application.
library;

import 'package:flutter/material.dart';
import 'package:proconnect/core/widgets/app_button.dart';

class AppButtonExamples extends StatelessWidget {
  const AppButtonExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppButton Examples')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Example 1: Basic filled button
          const Text('1. Basic Filled Button'),
          AppButton(
            onPressed: () {},
            label: 'Submit',
          ),
          const SizedBox(height: 24),

          // Example 2: Filled button with icon
          const Text('2. Filled Button with Icon'),
          AppButton(
            onPressed: () {},
            label: 'Save Changes',
            icon: Icons.save,
          ),
          const SizedBox(height: 24),

          // Example 3: Loading state
          const Text('3. Loading State'),
          const AppButton(
            onPressed: null,
            label: 'Processing...',
            icon: Icons.upload,
            isLoading: true,
          ),
          const SizedBox(height: 24),

          // Example 4: Outlined button
          const Text('4. Outlined Button'),
          AppButton(
            onPressed: () {},
            label: 'Cancel',
            type: AppButtonType.outlined,
          ),
          const SizedBox(height: 24),

          // Example 5: Text button
          const Text('5. Text Button'),
          AppButton(
            onPressed: () {},
            label: 'Skip',
            type: AppButtonType.text,
          ),
          const SizedBox(height: 24),

          // Example 6: Expanded button
          const Text('6. Expanded Button (Full Width)'),
          AppButton(
            onPressed: () {},
            label: 'Create Account',
            icon: Icons.person_add,
            expand: true,
          ),
          const SizedBox(height: 24),

          // Example 7: Disabled button
          const Text('7. Disabled Button'),
          const AppButton(
            onPressed: null,
            label: 'Disabled',
            icon: Icons.block,
          ),
          const SizedBox(height: 24),

          // Example 8: Custom padding
          const Text('8. Custom Padding'),
          AppButton(
            onPressed: () {},
            label: 'Compact Button',
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          const SizedBox(height: 24),

          // Example 9: Delete button (outlined with error color)
          const Text('9. Delete Action'),
          AppButton(
            onPressed: () {},
            label: 'Delete',
            icon: Icons.delete,
            type: AppButtonType.outlined,
          ),
          const SizedBox(height: 24),

          // Example 10: Multiple buttons in a row
          const Text('10. Multiple Buttons in a Row'),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () {},
                  label: 'Cancel',
                  type: AppButtonType.outlined,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  onPressed: () {},
                  label: 'Confirm',
                  icon: Icons.check,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Common button patterns used in the app
class CommonButtonPatterns {
  // Primary action button (e.g., Submit, Save, Create)
  static AppButton primaryAction({
    required VoidCallback onPressed,
    required String label,
    IconData? icon,
    bool isLoading = false,
  }) {
    return AppButton(
      onPressed: onPressed,
      label: label,
      icon: icon,
      isLoading: isLoading,
      expand: true,
    );
  }

  // Secondary action button (e.g., Cancel, Back)
  static AppButton secondaryAction({
    required VoidCallback onPressed,
    required String label,
    IconData? icon,
  }) {
    return AppButton(
      onPressed: onPressed,
      label: label,
      icon: icon,
      type: AppButtonType.outlined,
    );
  }

  // Tertiary action button (e.g., Skip, Learn More)
  static AppButton tertiaryAction({
    required VoidCallback onPressed,
    required String label,
    IconData? icon,
  }) {
    return AppButton(
      onPressed: onPressed,
      label: label,
      icon: icon,
      type: AppButtonType.text,
    );
  }

  // Delete/Destructive action button
  static AppButton destructiveAction({
    required VoidCallback onPressed,
    required String label,
    bool isLoading = false,
  }) {
    return AppButton(
      onPressed: onPressed,
      label: label,
      icon: Icons.delete,
      type: AppButtonType.outlined,
      isLoading: isLoading,
    );
  }
}
