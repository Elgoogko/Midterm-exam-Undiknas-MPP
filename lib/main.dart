import 'package:basic_app/Pages/Calculator.dart';
import 'package:basic_app/Pages/investement_tools.dart';
import 'package:basic_app/Pages/specific_tools.dart';
import 'package:basic_app/components/light_dark_mode.dart';
import 'package:basic_app/components/primary_color_selector.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark, system }

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // TODO Change this in order to use a map instead of two separate lists
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

  var _currentColorIndex = 0;

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  void _changePrimaryColor(int colorIndex) {
    setState(() {
      _currentColorIndex = colorIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming app',
      theme: ThemeData(
        primarySwatch: _colors[_currentColorIndex],
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.grey[800]),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            surface: Color(0xFFF0F0F0),
            onSurface: Colors.black,
            primary: _colors[_currentColorIndex],
          ),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        primarySwatch: _colors[_currentColorIndex],
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.grey[400]),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(
            primary: _colors[_currentColorIndex],
            surface: const Color.fromARGB(221, 44, 44, 44),
            onSurface: Colors.white,
          ),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      themeMode: _themeMode,
      home: RootShell(
        onThemeChanged: _changeTheme,
        onPrimaryColorChanged: _changePrimaryColor,
        colors: _colors,
        names: _colorNames,
      ),
    );
  }
}

class RootShell extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  final Function(int) onPrimaryColorChanged;
  final List<MaterialColor> colors;
  final List<String> names;

  const RootShell({
    super.key,
    required this.onThemeChanged,
    required this.onPrimaryColorChanged,
    required this.colors,
    required this.names,
  });

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Calculator(),
    SpecificTools(),
    InvestementTools(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.calculate,
                    color: _currentIndex == 0
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () => setState(() => _currentIndex = 0),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.bolt,
                    color: _currentIndex == 1
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () => setState(() => _currentIndex = 1),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.money_sharp),
                  color: _currentIndex == 2
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).iconTheme.color,
                  onPressed: () => setState(() => _currentIndex = 2),
                ),
              ),
              Expanded(
                child: ThemeSelector(onThemeChanged: widget.onThemeChanged),
              ),
              Expanded(
                child: ColorThemeSelector(
                  onPrimaryColorChanged: widget.onPrimaryColorChanged,
                  colors: widget.colors,
                  names: widget.names,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
