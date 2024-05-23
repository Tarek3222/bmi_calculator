import 'package:bmi_calculator/pages/bmi_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalc());
}

class BmiCalc extends StatelessWidget {
  const BmiCalc({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
