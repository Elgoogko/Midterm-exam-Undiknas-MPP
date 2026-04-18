import 'package:basic_app/components/calc_button.dart';
import 'package:flutter/material.dart';

final List<List<String>> rows = [
  ['AC', 'DEL', '%', '/'],
  ['7', '8', '9', 'X'],
  ['4', '5', '6', '-'],
  ['1', '2', '3', '+'],
  ['0', ',', '.', '='],
];

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultDisplay(),
        Expanded(child: NumericPad(rows: rows)),
      ],
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerRight,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          _result,
          style: TextStyle(
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
