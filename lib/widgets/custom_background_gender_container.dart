import 'package:flutter/material.dart';

class CustomBackgroundGenderContainer extends StatelessWidget {
  const CustomBackgroundGenderContainer(
      {super.key,
      required this.child,
      this.margin,
      required this.isSelected,
      required this.gender});
  final Widget child;
  final EdgeInsets? margin;
  final bool isSelected;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSelected ? Colors.white : Colors.black54,
        boxShadow: [
          BoxShadow(
            blurRadius: isSelected ? 5 : 30,
            offset:
                isSelected ? const Offset(-10, -10) : const Offset(-15, -15),
            color: Colors.white,
          ),
          BoxShadow(
            blurRadius: isSelected ? 5 : 30,
            offset: isSelected ? const Offset(10, 10) : const Offset(15, 15),
            color: const Color(0xFFA7A9AF),
          ),
        ],
      ),
      child: child,
    );
  }
}
