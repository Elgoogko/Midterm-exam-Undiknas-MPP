import 'package:basic_app/components/light_dark_mode.dart';
import 'package:basic_app/components/primary_color_selector.dart';
import 'package:basic_app/screens/calculator.dart';
import 'package:basic_app/screens/investement_tools.dart';
import 'package:basic_app/screens/specific_tools.dart';
import 'package:flutter/material.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key,});

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
                              ThemeSelector(),
                              const SizedBox(height: 12),
                              ColorThemeSelector(),
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
                      child: ThemeSelector(),
                    ),
                    Expanded(
                      child: ColorThemeSelector(),
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
