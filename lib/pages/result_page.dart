import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.result, required this.age, required this.isMale});
  final double result;
  final int age;
  final bool isMale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: const Text('BMI Result',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 38,
          color: Colors.white
        ),
        ),
        backgroundColor: kColor,
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
           const Spacer(),
            Text('Gender : ${isMale? 'Male' : 'Female'}',
            style:const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            ),
            const Spacer(),
            Text('Result: ${result.round()}',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            ),
            const Spacer(),
           const Text('Healthiness:',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            ),
            Text(getHealthiness(),
            style:const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
             const Spacer(),
             Text('Age : $age',
            style:const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  String getHealthiness(){
    String healthiness;
    if(result<18.5){
      healthiness='UnderWeight';
    }else if(result>=18.5&&result<=24.9){
      healthiness='Normal';
    }else if(result>=25&&result<=29.9){
      healthiness='OverWeight';
    }else{
      healthiness='Obese';
    }
    return healthiness;
  }
}