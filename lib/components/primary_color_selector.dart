import 'package:basic_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorThemeSelector extends StatelessWidget {
  const ColorThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final colors = themeProvider.colors;

    return PopupMenuButton<int>(
      icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: colors[themeProvider.currentColorIndex],
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
        ),
      ),
      tooltip: 'Change color',
      onSelected: (int index) {
        themeProvider.changePrimaryColor(index);
      },
      itemBuilder: (BuildContext context) {
        return colors.asMap().entries.map((entry) {
          final index = entry.key;
          final color = entry.value;

          return PopupMenuItem<int>(
            value: index,
            child: Row(
              children: [
                Icon(Icons.circle, color: color),
                const SizedBox(width: 10),
                Text(themeProvider.colorNames[index]),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
