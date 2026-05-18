import 'package:basic_app/models/history_entry.dart';
import 'package:basic_app/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    List<HistoryEntry> history = context.watch<HistoryProvider>().history;

    return Container(
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return ListTile(
            style: ListTileStyle.drawer,
            leading: Text(
              item.timestamp.toLocal().toString().substring(11, 19),
            ),
            title: Text(item.componentName),
            subtitle: Text(item.result),
          );
        },
      ),
    );
  }
}
