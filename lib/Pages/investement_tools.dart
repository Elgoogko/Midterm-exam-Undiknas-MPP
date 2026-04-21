import 'package:basic_app/Pages/investement_tools/image_test.dart';
import 'package:basic_app/components/nav_button.dart';
import 'package:flutter/material.dart';

final List<List<(String, IconData, Widget)>> rows = [
  [('Image Test', Icons.image, ImageTest())],
];

class InvestementTools extends StatelessWidget {
  const InvestementTools({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildPanel(rows: rows, context: context);
  }
}
