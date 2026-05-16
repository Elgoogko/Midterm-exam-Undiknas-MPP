import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  int _currentColorIndex = 0;

  final List<MaterialColor> _colors = [
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.teal,
  ];

  final List<String> _colorNames = [
    'Orange',
    'Blue',
    'Green',
    'Purple',
    'Teal',
  ];

  ThemeMode get themeMode => _themeMode;
  int get currentColorIndex => _currentColorIndex;
  List<MaterialColor> get colors => _colors;
  List<String> get colorNames => _colorNames;
  MaterialColor get currentPrimaryColor => _colors[_currentColorIndex];

  void changeTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void changePrimaryColor(int colorIndex) {
    _currentColorIndex = colorIndex;
    notifyListeners();
  }
}
