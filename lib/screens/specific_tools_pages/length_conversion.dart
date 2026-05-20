import 'package:basic_app/components/calc_button.dart';
import 'package:basic_app/components/common_app_bar.dart';
import 'package:basic_app/providers/length_converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LengthConversion extends StatelessWidget {
  const LengthConversion({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final dropdownWidth = (screenWidth * 0.45).clamp(120.0, 250.0);

    String convertedValue = context
        .watch<LengthConverterProvider>()
        .convertedValue
        .toString();
    String equation = context.watch<LengthConverterProvider>().equation;

    return Scaffold(
      appBar: CommonAppBar(title: 'Length Conversion'),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ConversionRow(
                    dropdownWidth: dropdownWidth,
                    displayText: equation,
                    onSelected: (value) => context
                        .read<LengthConverterProvider>()
                        .setFromUnit(value),
                  ),
                  _ConversionRow(
                    dropdownWidth: dropdownWidth,
                    displayText: convertedValue,
                    onSelected: (value) => context
                        .read<LengthConverterProvider>()
                        .setToUnit(value),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ChoosePad(
              type: 'classic',
              onButtonTap: (btnText) =>
                  context.read<LengthConverterProvider>().handleTap(btnText),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConversionRow extends StatelessWidget {
  final double dropdownWidth;
  final String displayText;
  final void Function(String) onSelected;

  const _ConversionRow({
    required this.dropdownWidth,
    required this.displayText,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    double screenShortest = MediaQuery.of(context).size.shortestSide;
    return Row(
      children: [
        DropdownMenu<String>(
          onSelected: (String? value) {
            if (value != null) onSelected(value);
          },
          width: dropdownWidth,
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 'meters', label: 'Meters'),
            DropdownMenuEntry(value: 'kilometers', label: 'Kilometers'),
            DropdownMenuEntry(value: 'miles', label: 'Miles'),
          ],
          initialSelection: context.watch<LengthConverterProvider>().fromUnit,
        ),
        const SizedBox(width: 8),
        Expanded(
          // ← prend tout l'espace restant
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              displayText,
              style: TextStyle(
                fontSize: screenShortest * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
