import 'package:flutter/material.dart';
import 'package:proconnect/l10n/l10n.dart';

class CondoManagementPage extends StatelessWidget {
  const CondoManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.manageCondominiums),
      ),
      body: const Center(
        child: Text('Condo Management Page'),
      ),
    );
  }
}
