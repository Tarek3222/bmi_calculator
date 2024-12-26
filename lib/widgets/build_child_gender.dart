import 'package:flutter/material.dart';

class BuildChildGender extends StatelessWidget {
  const BuildChildGender(
      {super.key, required this.gender, required this.genderIcon});
  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
          color: Colors.black,
        ),
        Text(
          gender,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
