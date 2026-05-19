import 'package:basic_app/components/calc_button.dart';
import 'package:basic_app/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultDisplay(),
        Expanded(child: ChoosePad(type: 'calc', prov: 'calc')),
      ],
    );
  }
}

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    String result = context.watch<CalculatorProvider>().equation;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.23,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerRight,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(result, style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
