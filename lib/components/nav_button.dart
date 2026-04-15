import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  final IconData icon;

  const NavButton({
    super.key,
    required this.text,
    this.textColor = Colors.black, //TODO Change this hard coded value
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onTap,
            child: Ink(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: screenWidth * 0.07, color: textColor),
                    const SizedBox(height: 4),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildPanel extends StatelessWidget {
  final List<List<(String, IconData, Widget)>> rows;
  final BuildContext context;
  const BuildPanel({super.key, required this.rows, required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rows.map((row) {
        return Expanded(
          child: Row(
            children: row.map((btnText) {
              return NavButton(
                text: btnText.$1,
                icon: btnText.$2,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => btnText.$3),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
