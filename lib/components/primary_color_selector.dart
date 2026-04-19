import 'package:flutter/material.dart';

class ColorThemeSelector extends StatelessWidget {
  final Function(int) onPrimaryColorChanged;
  final List<MaterialColor> colors;
  final List<String> names;

  const ColorThemeSelector({
    super.key,
    required this.onPrimaryColorChanged,
    required this.colors,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      initialSelection: 0,
      label: const Text('Primary Color'),
      onSelected: (int? index) {
        if (index != null) {
          onPrimaryColorChanged(index);
        }
      },
      dropdownMenuEntries: colors.asMap().entries.map((entry) {
        final index = entry.key;
        final color = entry.value;
        return DropdownMenuEntry(
          value: index,
          label: names[index],
          leadingIcon: Icon(Icons.circle, color: color),
        );
      }).toList(),
    );
  }
}
