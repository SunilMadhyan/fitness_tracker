import 'package:fitness_tracker/screens/bmi.dart';
import 'package:fitness_tracker/screens/home.dart';
import 'package:fitness_tracker/screens/training.dart';
import 'package:fitness_tracker/screens/weather.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/bmi': (context) => BmiPage(),
        '/weather': (context) => WeatherPage(),
        '/training': (context) => TrainingPage()
      },
      initialRoute: "/",
    );
  }
}
