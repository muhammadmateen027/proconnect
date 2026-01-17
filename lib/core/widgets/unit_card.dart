import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/theme.dart';
import 'package:proconnect/domain/models/unit.dart';
import 'package:proconnect/l10n/l10n.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({
    required this.unit,
    super.key,
    this.onTap,
    this.onDelete,
  });

  final Unit unit;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final isDark = theme.brightness == Brightness.dark;
    final isVacant = unit.isVacant;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        Colors.white.withValues(alpha: 0.12),
                        Colors.white.withValues(alpha: 0.04),
                      ]
                    : [
                        Colors.white.withValues(alpha: 0.7),
                        Colors.white.withValues(alpha: 0.4),
                      ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              onTap: onTap,
              title: Text(
                '${l10n.unit} ${unit.unitNo}',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              subtitle: Text(
                unit.condoName,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isVacant
                          ? AppColors.success.withValues(alpha: 0.1)
                          : AppColors.info.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isVacant
                            ? AppColors.success.withValues(alpha: 0.3)
                            : AppColors.info.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      isVacant ? l10n.vacant : l10n.occupied,
                      style: TextStyle(
                        color: isVacant
                            ? (isDark
                                  ? Colors.greenAccent
                                  : Colors.green.shade800)
                            : (isDark
                                  ? Colors.lightBlueAccent
                                  : Colors.blue.shade800),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  if (onDelete != null && !unit.isAssigned) ...[
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.delete_rounded,
                        color: theme.colorScheme.error,
                      ),
                      onPressed: onDelete,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
