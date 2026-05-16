import 'package:basic_app/components/common_app_bar.dart';
import 'package:flutter/material.dart';

class DataConversion extends StatelessWidget {
  const DataConversion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Data Conversion'),
      body: const Center(
        child: Text(
          'Data Conversion Tool Coming Soon!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
