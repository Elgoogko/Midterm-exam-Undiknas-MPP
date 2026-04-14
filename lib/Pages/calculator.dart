import 'package:basic_app/components/calc_button.dart';
import 'package:flutter/material.dart';

final List<List<String>> rows = [
  ['AC', '()', '%', '/'],
  ['7', '8', '9', 'X'],
  ['4', '5', '6', '-'],
  ['1', '2', '3', '+'],
  ['0', ',', 'DEL', '='],
];

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ResultDisplay(),
            Expanded(child: NumericPad()),
          ],
        ),
      ),
    );
  }
}

class ResultDisplay extends StatefulWidget {
  const ResultDisplay({super.key});

  @override
  State<StatefulWidget> createState() => _ResultDisplayState();
}

class _ResultDisplayState extends State<ResultDisplay> {
  String _result = '0';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerRight,
      child: Text(
        _result,
        style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class NumericPad extends StatelessWidget {
  const NumericPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rows.map((row) {
        return Expanded(
          child: Row(
            children: row.map((btnText) {
              return CalcButton(
                text: btnText,
                bgColor: btnText == '='
                    ? Colors.orange
                    : const Color(0xFFF0F0F0),
                onTap: () => print('Appui sur $btnText'),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
