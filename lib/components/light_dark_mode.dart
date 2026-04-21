import 'package:flutter/material.dart';

class ThemeSelector extends StatelessWidget {
  final Function(ThemeMode) onThemeChanged;
  final ThemeMode currentMode;

  const ThemeSelector({
    super.key,
    required this.onThemeChanged,
    required this.currentMode,
  });

  @override
  Widget build(BuildContext context) {
    // On définit l'icône en fonction du mode actuel
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
      // Au clic, on fait défiler les modes : System -> Light -> Dark -> System
      onPressed: () {
        if (currentMode == ThemeMode.system) {
          onThemeChanged(ThemeMode.light);
        } else if (currentMode == ThemeMode.light) {
          onThemeChanged(ThemeMode.dark);
        } else {
          onThemeChanged(ThemeMode.system);
        }
      },
      tooltip: 'Changer le thème',
    );
  }
}
