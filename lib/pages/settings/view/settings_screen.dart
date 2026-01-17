import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:proconnect/app/app_routes.dart';
import 'package:proconnect/core/l10n/bloc/l10n_bloc.dart';
import 'package:proconnect/core/theme/app_spacing.dart';
import 'package:proconnect/core/theme/bloc/theme_bloc.dart';
import 'package:proconnect/core/widgets/pro_connect_layout.dart';
import 'package:proconnect/l10n/l10n.dart';
import 'package:proconnect/pages/auth/bloc/auth_bloc.dart';
import 'package:proconnect/pages/owner/bloc/unit/unit_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ProConnectLayout(
      useGlass: false,
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      child: Column(
        children: [
          // Theme selection
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return _SettingsSection(
                title: l10n.theme,
                children: [
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
          AppSpacing.gapH24,
          // Language selection
          BlocBuilder<L10nBloc, L10nState>(
            builder: (context, state) {
              final currentLocale =
                  state.locale ?? Localizations.localeOf(context);

              return _SettingsSection(
                title: l10n.language,
                children: [
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
          AppSpacing.gapH24,
          _SettingsSection(
            title: 'Developer Tools',
            children: [
              ListTile(
                leading: const Icon(Icons.auto_fix_high_rounded),
                title: Text(l10n.seedData),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(AppRoutes.seedData),
              ),
            ],
          ),
          AppSpacing.gapH24,
          _SettingsSection(
            children: [
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: theme.colorScheme.error,
                ),
                title: Text(
                  l10n.logout,
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  context.read<UnitBloc>().add(const UnitEvent.clear());
                  context.read<AuthBloc>().add(const AuthEvent.logout());
                },
              ),
            ],
          ),
          AppSpacing.gapH48,
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.children, this.title});
  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 12),
              child: Text(
                title!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          ],
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
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
                            Colors.white.withValues(alpha: 0.35),
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
                child: Column(children: children),
              ),
            ),
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
    final isSelected = value == groupValue;
    final theme = Theme.of(context);

    return RadioListTile<ThemeMode>(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
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
    final isSelected = value == groupValue;
    final theme = Theme.of(context);

    return RadioListTile<Locale>(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}
