import 'package:basic_app/models/history_entry.dart';
import 'package:flutter/material.dart';

class HistoryProvider extends ChangeNotifier {
  final List<HistoryEntry> _history = [];

  List<HistoryEntry> get history => _history;

  void addToHistory(String name, String result) {
    _history.add(HistoryEntry(componentName: name, result: result));
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }
}
