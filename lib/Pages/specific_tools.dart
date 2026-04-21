import 'package:basic_app/Pages/specific_tools_pages/data_conversion.dart';
import 'package:basic_app/Pages/specific_tools_pages/discount.dart';
import 'package:basic_app/Pages/specific_tools_pages/length_conversion.dart';
import 'package:basic_app/components/nav_button.dart';
import 'package:flutter/material.dart';

final List<List<(String, IconData, Widget)>> rows = [
  [
    ('Discount', Icons.discount, Discount()),
    ('Length', Icons.rule, LengthConversion()),
    ('Data', Icons.data_array, DataConversion()),
  ],
];

class SpecificTools extends StatelessWidget {
  const SpecificTools({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildPanel(rows: rows, context: context);
  }
}
