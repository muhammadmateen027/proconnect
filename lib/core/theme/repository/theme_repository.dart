import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  static const String _themeKey = 'theme_mode';

  Future<void> saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeMode.name);
  }

  Future<ThemeMode> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_themeKey);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == themeName,
      orElse: () => ThemeMode.system,
    );
  }
}
