import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight, color: Colors.black), label: "bmi"),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight,color: Colors.black), label: "weather"),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight, color: Colors.black), label: "training"),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/");
            break;
          case 1:
            Navigator.pushNamed(context, "/bmi");
            break;
          case 2:
            Navigator.pushNamed(context, "/weather");
            break;
          case 3:
            Navigator.pushNamed(context, "/training");
            break;
        }
      },
    );
  }
}
