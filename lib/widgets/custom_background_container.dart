import 'package:flutter/material.dart';

class CustombackgroundContainer extends StatelessWidget {
  const CustombackgroundContainer(
      {super.key, required this.child, this.margin});
  final Widget child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFE7ECEF),
        boxShadow: const [
          BoxShadow(
            blurRadius: 30,
            offset: Offset(-10, -10),
            color: Colors.white,
          ),
          BoxShadow(
            blurRadius: 30,
            offset: Offset(10, 10),
            color: Color(0xFFA7A9AF),
          ),
        ],
      ),
      child: child,
    );
  }
}
