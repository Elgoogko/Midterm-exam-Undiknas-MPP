import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discount Calculator')),
      body: const Center(
        child: Text(
          'This is the Discount Calculator page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
