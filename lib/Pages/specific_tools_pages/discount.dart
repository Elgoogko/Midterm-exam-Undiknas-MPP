import 'package:basic_app/components/calc_button.dart';
import 'package:basic_app/components/common_app_bar.dart';
import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonAppBar(title: 'Discount Calculator'),
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
            style: TextStyle(
              fontSize: (screenWidth * 0.04).clamp(4, 38),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(flex: 3, child: ChoosePad(type: 'classic')),
        ],
      ),
    );
  }

  Row _buildRow(BuildContext context, String rText, String lText) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rText,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          lText,
          style: TextStyle(
            fontSize: (screenWidth * 0.04).clamp(4, 38),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          lText,
          style: TextStyle(
            fontSize: (screenWidth * 0.04).clamp(4, 38),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
