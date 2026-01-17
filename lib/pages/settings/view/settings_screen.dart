import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proconnect/core/l10n/bloc/l10n_bloc.dart';
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
          // Theme selection
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      l10n.theme,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  _ThemeRadioTile(
                    label: l10n.themeSystem,
                    value: ThemeMode.system,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<ThemeBloc>().add(ThemeChanged(value));
                      }
                    },
                  ),
                  _ThemeRadioTile(
                    label: l10n.themeLight,
                    value: ThemeMode.light,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<ThemeBloc>().add(ThemeChanged(value));
                      }
                    },
                  ),
                  _ThemeRadioTile(
                    label: l10n.themeDark,
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
          const Divider(),
          // Language selection
          BlocBuilder<L10nBloc, L10nState>(
            builder: (context, state) {
              // Current locale (might be null if it's the first time and not yet loaded)
              // In that case, we can get it from the context or default to English.
              final currentLocale =
                  state.locale ?? Localizations.localeOf(context);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      l10n.language,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  _LanguageRadioTile(
                    label: l10n.english,
                    value: const Locale('en'),
                    groupValue: Locale(currentLocale.languageCode),
                    onChanged: (locale) {
                      if (locale != null) {
                        context.read<L10nBloc>().add(L10nChanged(locale));
                      }
                    },
                  ),
                  _LanguageRadioTile(
                    label: l10n.spanish,
                    value: const Locale('es'),
                    groupValue: Locale(currentLocale.languageCode),
                    onChanged: (locale) {
                      if (locale != null) {
                        context.read<L10nBloc>().add(L10nChanged(locale));
                      }
                    },
                  ),
                  _LanguageRadioTile(
                    label: l10n.malay,
                    value: const Locale('ms'),
                    groupValue: Locale(currentLocale.languageCode),
                    onChanged: (locale) {
                      if (locale != null) {
                        context.read<L10nBloc>().add(L10nChanged(locale));
                      }
                    },
                  ),
                ],
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(l10n.logout),
            onTap: () {
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
          ),
        ],
      ),
    );
  }
}

class _ThemeRadioTile extends StatelessWidget {
  const _ThemeRadioTile({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final ThemeMode value;
  final ThemeMode groupValue;
  final ValueChanged<ThemeMode?> onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<ThemeMode>(
      title: Text(label),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      visualDensity: VisualDensity.compact,
    );
  }
}

class _LanguageRadioTile extends StatelessWidget {
  const _LanguageRadioTile({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final Locale value;
  final Locale groupValue;
  final ValueChanged<Locale?> onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Locale>(
      title: Text(label),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      visualDensity: VisualDensity.compact,
    );
  }
}
