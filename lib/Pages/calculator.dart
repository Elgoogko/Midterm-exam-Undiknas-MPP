import 'package:basic_app/components/calc_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultDisplay(),
        Expanded(child: ChoosePad(type: 'calc')),
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
