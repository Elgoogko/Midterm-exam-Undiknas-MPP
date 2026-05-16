import 'package:basic_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ThemeSelector extends StatelessWidget {

  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final currentMode = themeProvider.themeMode;
    IconData themeIcon;
    switch (currentMode) {
      case ThemeMode.light:
        themeIcon = Icons.light_mode;
        break;
      case ThemeMode.dark:
        themeIcon = Icons.dark_mode;
        break;
      case ThemeMode.system:
        themeIcon = Icons.settings_suggest;
        break;
    }

    return IconButton(
      icon: Icon(themeIcon),
      onPressed: () {
        if (currentMode == ThemeMode.system) {
          themeProvider.changeTheme(ThemeMode.light);
        } else if (currentMode == ThemeMode.light) {
          themeProvider.changeTheme(ThemeMode.dark);
        } else {
          themeProvider.changeTheme(ThemeMode.system);
        }
      },
      tooltip: 'Change theme',
    );
  }
}
