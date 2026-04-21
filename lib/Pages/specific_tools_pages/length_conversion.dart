import 'package:basic_app/components/calc_button.dart';
import 'package:basic_app/components/common_app_bar.dart';
import 'package:flutter/material.dart';

class LengthConversion extends StatelessWidget {
  const LengthConversion({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonAppBar(title: 'Length Conversion'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownMenu(
                          menuHeight: screenWidth * 0.1,
                          width: screenWidth * 0.4,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 'meters', label: 'Meters'),
                            DropdownMenuEntry(
                              value: 'kilometers',
                              label: 'Kilometers',
                            ),
                            DropdownMenuEntry(value: 'miles', label: 'Miles'),
                          ],
                        ),
                        Text(
                          "0",
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
                          menuHeight: screenWidth * 0.1,
                          width: screenWidth * 0.4,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 'meters', label: 'Meters'),
                            DropdownMenuEntry(
                              value: 'kilometers',
                              label: 'Kilometers',
                            ),
                            DropdownMenuEntry(value: 'miles', label: 'Miles'),
                          ],
                        ),
                        Text(
                          "0",
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
            const Expanded(flex: 3, child: ChoosePad(type: 'classic')),
          ],
        ),
      ),
    );
  }
}
