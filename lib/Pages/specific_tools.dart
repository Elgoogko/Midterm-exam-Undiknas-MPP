import 'package:basic_app/Pages/specific_tools_pages/discount.dart';
import 'package:basic_app/components/nav_button.dart';
import 'package:flutter/material.dart';

final List<List<(String, IconData, Widget)>> rows = [
  [
    ('Discount', Icons.discount, Discount()),
    ('Length', Icons.rule, Discount()),
    ('Data', Icons.data_array, Discount()),
  ],
];

class SpecificTools extends StatelessWidget {
  const SpecificTools({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildPanel(rows: rows, context: context);
  }
}
