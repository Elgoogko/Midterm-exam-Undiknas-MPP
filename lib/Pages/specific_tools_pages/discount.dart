import 'package:basic_app/components/calc_button.dart';
import 'package:flutter/material.dart';

final List<List<String>> pad = [
  ['7', '8', '9', 'AC'],
  ['4', '5', '6', 'DEL'],
  ['1', '2', '3', ''],
  ['', '0', '.', ''],
];

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Discount Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
              child: Column(
                children: [
                  _buildRow(context, 'Origin price', '0'),
                  _buildRow(context, 'Discount', '0%'),
                  _buildRow(context, 'Final price', '0'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'You save 0',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Expanded(flex: 3, child: NumericPad(rows: pad)),
        ],
      ),
    );
  }

  Row _buildRow(BuildContext context, String rText, String lText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(rText, style: Theme.of(context).textTheme.headlineMedium),
        Text(lText, style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
