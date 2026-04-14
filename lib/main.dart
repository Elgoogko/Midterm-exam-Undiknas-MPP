import 'package:basic_app/Pages/Calculator.dart';
import 'package:basic_app/Pages/specific_tools.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: RootShell(),
    );
  }
}

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _currentIndex = 0;

  // Toutes tes pages ici — sans Scaffold, sans SafeArea
  final List<Widget> _pages = const [Calculator(), SpecificTools()];

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
                  icon: const Icon(Icons.settings),
                  onPressed: () => setState(() => _currentIndex = 1),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () => setState(() => _currentIndex = 1),
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
