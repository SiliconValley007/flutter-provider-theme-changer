import 'package:provider_theme_changer/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  Future<bool> setTheme(ThemePreference themePreference) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setInt(themeKey, themePreference.index);
  }

  Future<int> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(themeKey) ?? ThemePreference.values.length - 1;
  }
}
