class HistoryEntry {
  final String componentName;
  final String result;
  final DateTime timestamp = DateTime.now();

  HistoryEntry({required this.componentName, required this.result});

}