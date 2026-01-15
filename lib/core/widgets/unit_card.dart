import 'package:flutter/material.dart';
import 'package:proconnect/domain/models/unit.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({required this.unit, super.key, this.onTap, this.onDelete});
  final Unit unit;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isVacant = unit.isVacant;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          'Unit ${unit.unitNo}',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(unit.condoName, style: theme.textTheme.titleMedium),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chip(
              label: Text(isVacant ? 'Vacant' : 'Occupied'),
              backgroundColor: isVacant
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
              labelStyle: TextStyle(
                color: isVacant
                    ? Colors.green.shade800
                    : Colors.orange.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
