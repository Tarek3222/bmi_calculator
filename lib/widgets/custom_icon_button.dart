import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon, required this.onPressed});
  
  final IconData icon;
 final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      style: IconButton.styleFrom(
        backgroundColor: Colors.blueGrey[600],
        foregroundColor: Colors.black,
      ),
      icon: Icon(icon));
  }
}