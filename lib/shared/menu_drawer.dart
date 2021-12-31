// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker/data/sp_helper.dart';
import 'package:fitness_tracker/screens/authentication.dart';
import 'package:fitness_tracker/screens/sessions_screen.dart';
import 'package:fitness_tracker/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  bool isLoggedIn = false;
  List<String> menuTitles = [];
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((_) {
      updateScreen();
    });
    super.initState();
  }

  @override
  void dispose() {
    isLoggedIn = FirebaseAuth.instance.currentUser != null ? true : false;
    menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
      isLoggedIn ? 'Sign Out' : 'Sign In'
    ];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: buildMenuItems(context),
    ));
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('Mogamboo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 28))));

    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pop();
            if (isLoggedIn == false &&
                element != 'Sign Out' &&
                element != 'Sign In') {
              _showToast('Please login first.');
              return;
            }
            switch (element) {
              case 'Home':
                screen = IntroScreen();
                break;
              case 'BMI Calculator':
                screen = BmiScreen();
                break;
              case 'Weather':
                screen = WeatherScreen();
                break;
              case 'Training':
                screen = SessionsScreen();
                break;
              case 'Sign In':
                screen = Authentication();
                break;
              case 'Sign Out':
                FirebaseAuth.instance
                    .signOut()
                    .then((_) => _showToast('Successfuly signed out.'));
                updateScreen();
                screen = IntroScreen();
                break;
            }
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    }
    return menuItems;
  }

  void updateScreen() {
    isLoggedIn = FirebaseAuth.instance.currentUser != null ? true : false;
    menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
      isLoggedIn ? 'Sign Out' : 'Sign In'
    ];
    setState(() {});
  }

  void _showToast(String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'okie!', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
