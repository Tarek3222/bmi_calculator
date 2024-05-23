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
      backgroundColor: const Color(0xffB4B3B4),
      appBar: AppBar(
        title: const Text('Body Mass Index',
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor:const Color(0xff536C7C) ,
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
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Column(
                  children: [
                   const Text('HEIGHT', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                       Text('${height.round()}', style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                       const SizedBox(width: 5,),
                      const Text('cm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                      activeColor: Colors.blueGrey[800],
                      inactiveColor: Colors.blueGrey[400],
                      thumbColor: Colors.black,
                    ),
                  ],
                ) ,
              ),
            ),
            const SizedBox(
              height: 10,
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
              height: 10,
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
              backgroundColor: Colors.blueGrey[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
             child: const Text('CALCULATE',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),),),
          ],
        ),
      ),
    );
  }

  Widget customContainer(BuildContext context,{required IconData icon, required String gender}) {
    final Color defaultColor = Colors.blueGrey[600]!;
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
                ? defaultColor
                : Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 90,
              ),
              Text(
                gender,
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

