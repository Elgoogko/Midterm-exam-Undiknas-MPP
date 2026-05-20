import 'package:basic_app/providers/calculator_provider.dart';
import 'package:basic_app/providers/discount_provider.dart';
import 'package:basic_app/providers/history_provider.dart';
import 'package:basic_app/providers/length_converter_provider.dart';
import 'package:basic_app/providers/theme_provider.dart';
import 'package:basic_app/screens/root_shell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProxyProvider<HistoryProvider, CalculatorProvider>(
          create: (context) => CalculatorProvider(
            historyProvider: Provider.of<HistoryProvider>(
              context,
              listen: false,
            ),
          ),
          update: (context, history, previousCalculator) {
            previousCalculator!.updateHistoryProvider(history);
            return previousCalculator;
          },
        ),
        ChangeNotifierProxyProvider<HistoryProvider, LengthConverterProvider>(
          create: (context) => LengthConverterProvider(
            historyProvider: Provider.of<HistoryProvider>(
              context,
              listen: false,
            ),
          ),
          update: (context, history, previousLengthConverter) {
            previousLengthConverter!.updateHistoryProvider(history);
            return previousLengthConverter; // ← on garde la même instance
          },
        ),
        ChangeNotifierProxyProvider<HistoryProvider, DiscountProvider>(
          create: (context) => DiscountProvider(
            historyProvider: Provider.of<HistoryProvider>(
              context,
              listen: false,
            ),
          ),
          update: (context, history, previousDiscount) {
            previousDiscount!.updateHistoryProvider(history);
            return previousDiscount; // ← on garde la même instance
          },
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming app',
      theme: ThemeData(
        primaryColor: Provider.of<ThemeProvider>(context).currentPrimaryColor,
        primarySwatch: Provider.of<ThemeProvider>(context).currentPrimaryColor,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.grey[800]),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            surface: Color(0xFFF0F0F0),
            onSurface: Colors.black,
            primary: Provider.of<ThemeProvider>(context).currentPrimaryColor,
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
        primaryColor: Provider.of<ThemeProvider>(context).currentPrimaryColor,
        primarySwatch: Provider.of<ThemeProvider>(context).currentPrimaryColor,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.grey[400]),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(
            primary: Provider.of<ThemeProvider>(context).currentPrimaryColor,
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
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: const RootShell(),
    );
  }
}
