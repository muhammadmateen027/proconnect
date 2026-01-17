import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class L10nRepository {
  static const String _localeKey = 'selected_locale';

  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  Future<Locale?> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeKey);
    if (languageCode != null) {
      return Locale(languageCode);
    }
    return null;
  }
}
