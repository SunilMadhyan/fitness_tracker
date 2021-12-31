// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key}) : super(key: key);
  static int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            selectedIndex = 0;
            break;
          case 1:
            Navigator.pushNamed(context, '/bmi');
            selectedIndex = 1;
            break;
          case 2:
            Navigator.pushNamed(context, '/weather');
            selectedIndex = 3;
            break;
          case 3:
            Navigator.pushNamed(context, '/training');
            selectedIndex = 4;
            break;
        }
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'BMI'),
        BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
        BottomNavigationBarItem(
            icon: Icon(Icons.nordic_walking), label: 'Training'),
      ],
    );
  }
}
