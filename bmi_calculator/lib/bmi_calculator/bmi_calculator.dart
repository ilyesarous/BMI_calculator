import 'dart:math';

import 'package:bmi_calculator/bmi_calculator/resultat.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

  bool isMale = true;
  String hight = '120';
  double nb = 120;
  int age = 21;
  int Weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                       setState(() {
                         isMale = false;
                       });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.grey[300] : Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hight',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      hight,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                        value: nb,
                        onChanged: (value) {
                          setState(() {
                            nb = value;
                            hight = value.round().toString();
                          });
                        },
                      max: 220,
                      min: 80,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                 elevation: 10,
                                 mini: true,
                                 child: Icon(
                                   Icons.add,
                                 ),
                                 onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                               ),
                              FloatingActionButton(
                                elevation: 10,
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${Weight}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                elevation: 10,
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                                onPressed: () {
                                  setState(() {
                                    Weight++;
                                  });
                                },
                              ),
                              FloatingActionButton(
                                elevation: 10,
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                                onPressed: () {
                                  setState(() {
                                    Weight--;
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
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MaterialButton(
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: (){
                        var result = Weight / (pow(nb/100, 2));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Resultat(
                                    isMale: isMale,
                                    age: age,
                                    result: result.round(),
                                ),
                            ),
                        );
                      }
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
