import 'package:fitness_tracker/shared/menu_bottom.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Fitness App"),),
        body: Container(
          child: Center(child: Text("Weather Page"),),
        ),
        bottomNavigationBar: MenuBottom()
    );
  }
}