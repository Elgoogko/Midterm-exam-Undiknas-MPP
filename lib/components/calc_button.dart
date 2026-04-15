import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;

  const CalcButton({
    super.key,
    required this.text,
    this.bgColor = const Color(0xFFF0F0F0), //TODO Chnage this hard coded value
    this.textColor = Colors.black, //TODO Change this hard coded value
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
                boxShadow: [
                  //TODO Chnage this style to fit theme app
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
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
