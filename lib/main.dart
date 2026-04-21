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
        primaryColor: _colors[_currentColorIndex],
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
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          headlineLarge: TextStyle(
            color: Colors.black,
            fontSize: 100,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[150],
          foregroundColor: Colors.grey[500],
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: _colors[_currentColorIndex],
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
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 100,
            fontWeight: FontWeight.w600,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.grey[400],
        ),
      ),
      themeMode: _themeMode,
      home: RootShell(
        onThemeChanged: _changeTheme,
        onPrimaryColorChanged: _changePrimaryColor,
        colors: _colors,
        names: _colorNames,
        currentColorIndex: _currentColorIndex,
        currentThemeMode: _themeMode,
      ),
    );
  }
}

class RootShell extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  final Function(int) onPrimaryColorChanged;
  final List<MaterialColor> colors;
  final List<String> names;
  final int currentColorIndex;
  final ThemeMode currentThemeMode;

  const RootShell({
    super.key,
    required this.onThemeChanged,
    required this.onPrimaryColorChanged,
    required this.colors,
    required this.names,
    required this.currentColorIndex,
    required this.currentThemeMode,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 600;

        if (isWideScreen) {
          return Scaffold(
            body: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: NavigationRail(
                              backgroundColor: Theme.of(
                                context,
                              ).appBarTheme.backgroundColor,
                              selectedIndex: _currentIndex,
                              onDestinationSelected: (index) {
                                setState(() => _currentIndex = index);
                              },
                              destinations: [
                                NavigationRailDestination(
                                  icon: Icon(
                                    Icons.calculate,
                                    color: _currentIndex == 0
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(
                                            context,
                                          ).appBarTheme.foregroundColor,
                                  ),
                                  label: const Text('Calc'),
                                ),
                                NavigationRailDestination(
                                  icon: Icon(
                                    Icons.bolt,
                                    color: _currentIndex == 1
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(
                                            context,
                                          ).appBarTheme.foregroundColor,
                                  ),
                                  label: const Text('Specific tools'),
                                ),
                                NavigationRailDestination(
                                  icon: Icon(
                                    Icons.money_sharp,
                                    color: _currentIndex == 2
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(
                                            context,
                                          ).appBarTheme.foregroundColor,
                                  ),
                                  label: const Text('Investement Tools'),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ThemeSelector(
                                onThemeChanged: widget.onThemeChanged,
                                currentMode: widget.currentThemeMode,
                              ),
                              const SizedBox(height: 12),
                              ColorThemeSelector(
                                onPrimaryColorChanged:
                                    widget.onPrimaryColorChanged,
                                colors: widget.colors,
                                names: widget.names,
                                currentIndex: widget.currentColorIndex,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: _pages[_currentIndex]),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: Size.zero,
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.calculate,
                          color: _currentIndex == 0
                              ? Theme.of(
                                  context,
                                ).buttonTheme.colorScheme?.primary
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
                              ? Theme.of(
                                  context,
                                ).buttonTheme.colorScheme?.primary
                              : Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () => setState(() => _currentIndex = 1),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.money_sharp),
                        color: _currentIndex == 2
                            ? Theme.of(context).buttonTheme.colorScheme?.primary
                            : Theme.of(context).iconTheme.color,
                        onPressed: () => setState(() => _currentIndex = 2),
                      ),
                    ),
                    Expanded(
                      child: ThemeSelector(
                        onThemeChanged: widget.onThemeChanged,
                        currentMode: ThemeMode.system,
                      ),
                    ),
                    Expanded(
                      child: ColorThemeSelector(
                        onPrimaryColorChanged: widget.onPrimaryColorChanged,
                        colors: widget.colors,
                        names: widget.names,
                        currentIndex: widget.currentColorIndex,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: _pages[_currentIndex],
          );
        }
      },
    );
  }
}
