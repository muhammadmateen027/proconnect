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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.tertiary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.4),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.shield_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
        AppSpacing.gapH24,
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
            letterSpacing: -0.5,
          ),
        ),
        AppSpacing.gapH8,
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
