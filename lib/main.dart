import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_theme_changer/constants/constants.dart';
import 'package:provider_theme_changer/provider/theme_provider.dart';
import 'package:provider_theme_changer/screens/settings_screen.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Provider Theme Changer',
          themeMode: value.themeMode,
          theme: light,
          darkTheme: dark,
          home: const SettingsScreen(),
        ),
      ),
    );
  }
}
