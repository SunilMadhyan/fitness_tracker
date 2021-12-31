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
      home: BottonNavigationLayout(),
    );
  }
}

class BottonNavigationLayout extends StatefulWidget {
  const BottonNavigationLayout({Key? key}) : super(key: key);

  @override
  _BottonNavigationLayoutState createState() => _BottonNavigationLayoutState();
}

class _BottonNavigationLayoutState extends State<BottonNavigationLayout> {
  int _selectedIndex = 0;
  _handleItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BmiPage(),
    WeatherPage(),
    TrainingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness App"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate, color: Colors.black), label: "BMI"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud, color: Colors.black), label: "WEATHER"),
          BottomNavigationBarItem(
              icon: Icon(Icons.nordic_walking, color: Colors.black),
              label: "TRAINING")
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _handleItemTapped,
      ),
    );
  }
}
