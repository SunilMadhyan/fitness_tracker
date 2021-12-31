// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSeleted;
  String heightMessage = '';
  String weightMessage = '';
  @override
  void initState() {
    isSeleted = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');

    weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'kilos' : 'ponds');

    return Scaffold(
        appBar: AppBar(title: Text('BMI Calculator')),
        drawer: MenuDrawer(),
        bottomNavigationBar: MenuBottom(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Metric', style: TextStyle(fontSize: fontSize)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  )
                ],
                isSelected: isSeleted,
                onPressed: toggleMeasure,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage),
                ),
              ),
              ElevatedButton(
                  onPressed: findBMI,
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: fontSize),
                  )),
              Text(
                result,
                style: TextStyle(fontSize: fontSize),
              )
            ],
          ),
        ));
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'Your BMI score is ' + bmi.toStringAsFixed(2);
    });
  }

  void toggleMeasure(int index) {
    switch (index) {
      case 0:
        isMetric = true;
        isImperial = false;
        break;
      case 1:
        isMetric = false;
        isImperial = true;
        break;
    }
    setState(() {
      isSeleted = [isMetric, isImperial];
    });
  }
}
