import 'package:bmi_calculator/widgets/custom_background_container.dart';
import 'package:flutter/material.dart';

class ResultBmiView extends StatelessWidget {
  const ResultBmiView(
      {super.key,
      required this.age,
      required this.result,
      required this.gender});
  final int age;
  final double result;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7ECEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7ECEF),
        leading: const BackButton(
          color: Colors.black54,
        ),
        elevation: 0,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
              fontSize: 22,
              color: Colors.black54,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 38,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CustombackgroundContainer(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getHealthiness(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      result.round().toString(),
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'You are $gender, $age years old',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const CustombackgroundContainer(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black54,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  String getHealthiness() {
    String healthiness;
    if (result < 18.5) {
      healthiness = 'UnderWeight';
    } else if (result >= 18.5 && result <= 24.9) {
      healthiness = 'Normal';
    } else if (result >= 25 && result <= 29.9) {
      healthiness = 'OverWeight';
    } else {
      healthiness = 'Obese';
    }
    return healthiness;
  }
}
