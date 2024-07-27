import 'package:bmi_calculator/constants.dart';
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
          color: kColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),),
            Text(value.toString(), style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),),
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