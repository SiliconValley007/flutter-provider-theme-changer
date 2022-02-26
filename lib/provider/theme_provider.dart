import 'package:flutter/material.dart';
import 'package:provider_theme_changer/constants/constants.dart';
import 'package:provider_theme_changer/services/theme_service.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemePreference _themePreference;
  late final ThemeService _service;

  ThemeMode get themeMode => getTheme(_themePreference);

  ThemeProvider() {
    _themePreference = ThemePreference.system;
    setPersistentTheme();
    _service = ThemeService();
  }

  setPersistentTheme() async {
    final value = await ThemeService().getTheme();
    _themePreference = ThemePreference.values[value];
    notifyListeners();
  }

  ThemeMode getTheme(ThemePreference themePreference) {
    switch (themePreference) {
      case ThemePreference.light:
        return ThemeMode.light;
      case ThemePreference.dark:
        return ThemeMode.dark;
      case ThemePreference.system:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  void setLight() {
    _themePreference = ThemePreference.light;
    _service.setTheme(ThemePreference.light);
    notifyListeners();
  }

  void setDark() {
    _themePreference = ThemePreference.dark;
    _service.setTheme(ThemePreference.dark);
    notifyListeners();
  }

  void setSystem() {
    _themePreference = ThemePreference.system;
    _service.setTheme(ThemePreference.system);
    notifyListeners();
  }
}
