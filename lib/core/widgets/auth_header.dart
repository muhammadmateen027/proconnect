import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_spacing.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({required this.title, required this.subtitle, super.key});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.gapH8,
        Text(
          subtitle,
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
