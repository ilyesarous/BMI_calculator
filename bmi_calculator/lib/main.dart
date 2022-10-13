import 'package:bmi_calculator/bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/bmi_calculator/resultat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: BMICalculator(),
   );
  }
}
