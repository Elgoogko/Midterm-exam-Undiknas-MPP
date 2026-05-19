import 'package:basic_app/components/calc_button.dart';
import 'package:basic_app/components/common_app_bar.dart';
import 'package:basic_app/providers/length_converter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LengthConversion extends StatelessWidget {
  const LengthConversion({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    String convertedValue = context
        .watch<LengthConverterProvider>()
        .convertedValue
        .toString();
    String equation = context.watch<LengthConverterProvider>().equation;

    return Scaffold(
      appBar: CommonAppBar(title: 'Length Conversion'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownMenu(
                        onSelected: (String? value) {
                          if (value != null) {
                            context.read<LengthConverterProvider>().setFromUnit(
                              value,
                            );
                          }
                        },

                        menuHeight: screenWidth * 0.1,
                        width: screenWidth * 0.4,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 'meters', label: 'Meters'),
                          DropdownMenuEntry(
                            value: 'kilometers',
                            label: 'Kilometers',
                          ),
                          DropdownMenuEntry(value: 'miles', label: 'Miles'),
                        ],
                      ),
                      Text(
                        equation,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownMenu(
                        onSelected: (String? value) {
                          if (value != null) {
                            context.read<LengthConverterProvider>().setToUnit(
                              value,
                            );
                          }
                        },
                        menuHeight: screenWidth * 0.1,
                        width: screenWidth * 0.4,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 'meters', label: 'Meters'),
                          DropdownMenuEntry(
                            value: 'kilometers',
                            label: 'Kilometers',
                          ),
                          DropdownMenuEntry(value: 'miles', label: 'Miles'),
                        ],
                      ),
                      Text(
                        convertedValue,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ChoosePad(type: 'classic', prov: 'length'),
          ),
        ],
      ),
    );
  }
}
