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
                  RadioGroup<ThemeMode>(
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<ThemeBloc>().add(ThemeChanged(value));
                      }
                    },
                    child: const Column(
                      children: [
                        _ThemeRadioTile(
                          label: 'System Default',
                          value: ThemeMode.system,
                        ),
                        _ThemeRadioTile(
                          label: 'Light',
                          value: ThemeMode.light,
                        ),
                        _ThemeRadioTile(
                          label: 'Dark',
                          value: ThemeMode.dark,
                        ),
                      ],
                    ),
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

/// A reusable radio tile widget for theme selection.
class _ThemeRadioTile extends StatelessWidget {
  const _ThemeRadioTile({
    required this.label,
    required this.value,
  });

  final String label;
  final ThemeMode value;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<ThemeMode>(
      title: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      value: value,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
    );
  }
}
