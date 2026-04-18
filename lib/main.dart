import 'package:basic_app/Pages/Calculator.dart';
import 'package:basic_app/Pages/investement_tools.dart';
import 'package:basic_app/Pages/specific_tools.dart';
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

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(primary: Color(0xFFF0F0F0)),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(
            primary: const Color.fromARGB(221, 44, 44, 44),
          ),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      themeMode: _themeMode,
      home: RootShell(onThemeChanged: _changeTheme),
    );
  }
}

class RootShell extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;

  const RootShell({super.key, required this.onThemeChanged});

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
                  icon: const Icon(Icons.calculate),
                  onPressed: () => setState(() => _currentIndex = 0),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.bolt),
                  onPressed: () => setState(() => _currentIndex = 1),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.money_sharp),
                  onPressed: () => setState(() => _currentIndex = 2),
                ),
              ),
              Expanded(
                child: ThemeSelector(onThemeChanged: widget.onThemeChanged),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}

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
