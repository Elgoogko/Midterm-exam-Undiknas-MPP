import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;

  const CalcButton({
    super.key,
    required this.text,
    this.bgColor = const Color(0xFFF0F0F0),
    this.textColor = Colors.black,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          margin: const EdgeInsets.all(6),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: Ink(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: screenWidth * 0.07,
                        fontWeight: screenWidth > 400
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NumericPad extends StatelessWidget {
  final List<List<String>> rows;

  const NumericPad({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rows.map((row) {
        return Expanded(
          child: Row(
            children: row.map((btnText) {
              return btnText == ''
                  ? Spacer()
                  : CalcButton(
                      text: btnText,
                      textColor:
                          (btnText == '=' ||
                              btnText == 'DEL' ||
                              btnText == 'AC')
                          ? Color(0xFFF0F0F0)
                          : Theme.of(
                                  context,
                                ).buttonTheme.colorScheme?.onSurface ??
                                Colors.black,
                      bgColor:
                          (btnText == '=' ||
                              btnText == 'DEL' ||
                              btnText == 'AC')
                          ? Theme.of(
                                  context,
                                ).buttonTheme.colorScheme?.primary ??
                                Colors.orange
                          : Theme.of(
                                  context,
                                ).buttonTheme.colorScheme?.surface ??
                                Color(0xFFF0F0F0),
                      onTap: () => print('Appui sur $btnText'),
                    );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

final List<List<String>> calcPad = [
  ['AC', 'DEL', '%', '/'],
  ['7', '8', '9', 'X'],
  ['4', '5', '6', '-'],
  ['1', '2', '3', '+'],
  ['0', ',', '.', '='],
];

final List<List<String>> classicPad = [
  ['7', '8', '9', 'AC'],
  ['4', '5', '6', 'DEL'],
  ['1', '2', '3', ''],
  ['', '0', '.', ''],
];

class ChoosePad extends StatelessWidget {
  final String type;

  const ChoosePad({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return NumericPad(rows: type == 'calc' ? calcPad : classicPad);
  }
}
