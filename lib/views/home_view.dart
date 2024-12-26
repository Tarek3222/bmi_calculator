import 'package:bmi_calculator/views/result_view.dart';
import 'package:bmi_calculator/widgets/build_child_gender.dart';
import 'package:bmi_calculator/widgets/custom_background_container.dart';
import 'package:bmi_calculator/widgets/custom_background_gender_container.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  bool isSelected = false;
  String gender = 'MALE';
  double height = 80;
  int weight = 30;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7ECEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7ECEF),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (index != 0) {
                          setState(() {
                            index = 0;
                            gender = 'MALE';
                          });
                        }
                      },
                      child: CustomBackgroundGenderContainer(
                        gender: gender,
                        isSelected: index == 0,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: const BuildChildGender(
                          gender: 'MALE',
                          genderIcon: Icons.male,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (index != 1) {
                          setState(() {
                            index = 1;
                            gender = 'FEMALE';
                          });
                        }
                      },
                      child: CustomBackgroundGenderContainer(
                        gender: gender,
                        isSelected: index == 1,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: const BuildChildGender(
                          gender: 'FEMALE',
                          genderIcon: Icons.female,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustombackgroundContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black54,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.black54,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black54,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height.round().toDouble(),
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value.round().toDouble();
                        });
                      },
                      activeColor: Colors.black,
                      inactiveColor: Colors.black12,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustombackgroundContainer(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  weight.toString(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black54,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text(
                                ' kg',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'weight-',
                                shape: const CircleBorder(),
                                mini: true,
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (weight > 10) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                              ),
                              FloatingActionButton(
                                heroTag: 'weight+',
                                shape: const CircleBorder(),
                                mini: true,
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustombackgroundContainer(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              age.toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black54,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                shape: const CircleBorder(),
                                mini: true,
                                heroTag: null,
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (age > 10) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                },
                              ),
                              FloatingActionButton(
                                shape: const CircleBorder(),
                                heroTag: null,
                                mini: true,
                                backgroundColor: Colors.black54,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                double result = weight / ((height / 100) * (height / 100));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultBmiView(
                      gender: gender,
                      result: result,
                      age: age,
                    ),
                  ),
                );
              },
              child: const CustombackgroundContainer(
                child: Center(
                  child: Text(
                    'CALCULATE',
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
          ],
        ),
      ),
    );
  }
}
