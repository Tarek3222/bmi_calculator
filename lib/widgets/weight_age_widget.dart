import 'package:bmi_calculator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomWeightAge extends StatelessWidget {
  const CustomWeightAge({
    super.key,  required this.title,  required this.value, required this.onPressedToAdd, required this.onPressedToRemove
  });
 final String title;
 final VoidCallback onPressedToAdd;
 final VoidCallback onPressedToRemove;
 final int value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff9E9E9E),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
            Text(title == 'age' ? value.toString() : value.toString(), style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
               CustomIconButton(
               onPressed: onPressedToRemove,
                icon: Icons.remove),
               CustomIconButton(
                onPressed: onPressedToAdd,
                icon: Icons.add),
           ],)
          ],
        ),
      ),
    );
  }
}