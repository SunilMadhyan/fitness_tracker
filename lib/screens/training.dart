import 'package:fitness_tracker/shared/menu_bottom.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Fitness App"),),
        body: Container(
          child: Center(child: Text("Training Page"),),
        ),
        bottomNavigationBar: MenuBottom()
    );
  }
}
