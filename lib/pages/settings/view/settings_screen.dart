import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
          ),
          const Divider(),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Theme', // This should also be in your arb file
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('System Default'),
                    value: ThemeMode.system,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<ThemeBloc>().add(ThemeChanged(value));
                      }
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Light'),
                    value: ThemeMode.light,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<ThemeBloc>().add(ThemeChanged(value));
                      }
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Dark'),
                    value: ThemeMode.dark,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<ThemeBloc>().add(ThemeChanged(value));
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
