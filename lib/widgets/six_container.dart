import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.icon,
    required this.gender,
  });
  final IconData icon;
  final String gender;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  final Color defaultColor = Colors.blueGrey[600]!;
  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (widget.gender == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (isMale && widget.gender == 'Male') ||
                    (!isMale && widget.gender == 'Female')
                ? defaultColor
                : Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 90,
              ),
              Text(
                widget.gender,
                style:
                    const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
