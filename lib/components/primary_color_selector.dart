import 'package:flutter/material.dart';

class ColorThemeSelector extends StatelessWidget {
  final Function(int) onPrimaryColorChanged;
  final List<MaterialColor> colors;
  final List<String> names;
  final int currentIndex; 

  const ColorThemeSelector({
    super.key,
    required this.onPrimaryColorChanged,
    required this.colors,
    required this.names,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      // 1. Le cercle qui s'affiche à l'écran
      icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: colors[currentIndex], // Affiche la couleur primaire actuelle
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
        ),
      ),
      tooltip: 'Changer la couleur',
      onSelected: (int index) {
        onPrimaryColorChanged(index);
      },
      // 2. Ce qui apparaît après le clic
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
                Text(names[index]),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}