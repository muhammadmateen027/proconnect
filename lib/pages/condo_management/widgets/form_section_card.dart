import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';

/// A reusable card widget for form sections
/// Provides consistent styling and spacing for form sections
class FormSectionCard extends StatelessWidget {
  const FormSectionCard({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
            AppSpacing.gapH16,
            ...children,
          ],
        ),
      ),
    );
  }
}
