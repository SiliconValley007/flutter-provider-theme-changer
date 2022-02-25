import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_theme_changer/provider/theme_provider.dart';
import 'package:provider_theme_changer/widgets/radio_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text(
          'Check',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Center(
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRadioButton(
                onPressed: () => _themeProvider.setLight(),
                isSelected: value.themeMode == ThemeMode.light,
                buttonText: 'Light Theme',
              ),
              CustomRadioButton(
                onPressed: () => _themeProvider.setDark(),
                isSelected: value.themeMode == ThemeMode.dark,
                buttonText: 'Dark Theme',
              ),
              CustomRadioButton(
                onPressed: () => _themeProvider.setSystem(),
                isSelected: value.themeMode == ThemeMode.system,
                buttonText: 'System Theme',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
