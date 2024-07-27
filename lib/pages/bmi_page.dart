import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/weight_age_widget.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double height=80;
  int weightValue=45;
  int ageValue=20;
  bool isMale=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.red[100] ,
      appBar: AppBar(
        title: const Text('Body Mass Index',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
        backgroundColor:kColor ,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
               Expanded(
              child:  Row(
                children: [
                  customContainer(
                    context,
                   icon: Icons.female,
                   gender: 'Female', 
                 ),
                  const SizedBox(
                   width: 10,
                 ),
                  customContainer(
                    context,
                   icon: Icons.male,
                   gender: 'Male', 
                 ),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Column(
                  children: [
                   const Text('HEIGHT', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                       Text('${height.round()}', style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),),
                       const SizedBox(width: 5,),
                      const Text('cm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
                    ],),
                    Slider(
                      value: height,
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      activeColor: Colors.white.withOpacity(0.9),
                      inactiveColor: Colors.white.withOpacity(0.2),
                      thumbColor: Colors.white,
                    ),
                  ],
                ) ,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
             Expanded(
              child:  Row(children: [
                CustomWeightAge(
                  title: 'weight',
                  value: weightValue,
                     onPressedToRemove: (){
                  setState(() {
                      if(weightValue>0){
                        weightValue--;
                      }
                  });
                },
                onPressedToAdd: (){
                  setState(() {
                    weightValue++;
                  });
                },

                ),
                const SizedBox(width: 10,),
                CustomWeightAge(
                  title: 'age',
                  value: ageValue,
                  onPressedToAdd: (){
                    setState(() {
                      ageValue++;
                    });
                  },
                  onPressedToRemove: (){
                    setState(() {
                      if(ageValue>0){
                        ageValue--;
                      }
                    });
                  },
                ),
              ],),
            ),
            const SizedBox(
              height: 7,
            ),
            ElevatedButton(onPressed: (){
              double result=weightValue/ ((height/100)*(height/100));
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return  ResultPage(
                  result: result,
                  age: ageValue,
                  isMale: isMale
                );
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kSecondColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: const Size(double.infinity, 45),
            ),
             child: const Text('CALCULATE',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),),),
          ],
        ),
      ),
    );
  }

  Widget customContainer(BuildContext context,{required IconData icon, required String gender}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (gender == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (isMale && gender == 'Male') ||
                    (!isMale && gender == 'Female')
                ? kSecondColor
                : kColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: Colors.white,
              ),
              Text(
                gender,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

