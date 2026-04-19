import 'package:flutter/material.dart';

class ThemeSelector extends StatelessWidget {
  final Function(ThemeMode) onThemeChanged;

  const ThemeSelector({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ThemeMode>(
      initialSelection: ThemeMode.system,
      label: const Text('Theme'),
      onSelected: (ThemeMode? mode) {
        if (mode != null) {
          onThemeChanged(mode);
        }
      },
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: ThemeMode.light,
          label: 'Light',
          leadingIcon: Icon(Icons.light_mode),
        ),
        DropdownMenuEntry(
          value: ThemeMode.dark,
          label: 'Dark',
          leadingIcon: Icon(Icons.dark_mode),
        ),
        DropdownMenuEntry(
          value: ThemeMode.system,
          label: 'System',
          leadingIcon: Icon(Icons.settings_suggest),
        ),
      ],
    );
  }
}
