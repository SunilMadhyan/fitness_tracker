import 'package:fitness_tracker/shared/menu_bottom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fitness App"),),
      body: Container(
        child: Center(child: Text("Commit to be fit, dare to be great with fitness app"),),
      ),
      bottomNavigationBar: MenuBottom()
    );
  }
}
