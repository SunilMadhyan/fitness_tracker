// ignore_for_file: prefer_const_constructors

import 'package:fitness_tracker/screens/bmi_screen.dart';
import 'package:fitness_tracker/screens/intro_screen.dart';
import 'package:fitness_tracker/screens/sessions_screen.dart';
import 'package:fitness_tracker/screens/weather_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MogambooApp());
}

class MogambooApp extends StatelessWidget {
  const MogambooApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
        '/weather': (context) => WeatherScreen(),
        '/training': (context) => SessionsScreen(),
      },
      initialRoute: '/',
      // home: IntroScreen()
    );
  }
}
