import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/auth/bloc/auth_bloc.dart';
import 'package:proconnect/l10n/gen/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(l10n.logout),
            onTap: () {
              // Add the logout event to the AuthBloc
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
          ),
        ],
      ),
    );
  }
}
