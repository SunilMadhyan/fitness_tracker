import 'package:fitness_tracker/data/fireauth_helper.dart';
import 'package:fitness_tracker/data/sp_helper.dart';
import 'package:fitness_tracker/screens/intro_screen.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final SPHelper helper = SPHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //decoration: BoxDecoration(color: Colors.blueAccent),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.blueGrey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: txtPassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.blueGrey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blueGrey,
                    ),
                    child: MaterialButton(
                      onPressed: registerUser,
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blueGrey,
                    ),
                    child: MaterialButton(
                      onPressed: signInUser,
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  void registerUser() async {
    bool shouldNavigate = await register(txtEmail.text, txtPassword.text);
    if (shouldNavigate) {
      helper.setEmailLink(txtEmail.text);
      Navigator.of(context).pop();
      _showToast("Registration Success.\nYour are now logged in");
    } else {
      _showToast("Registration Failed. Please retry.");
    }
  }

  void signInUser() async {
    bool shouldNavigate = await signIn(txtEmail.text, txtPassword.text);
    if (shouldNavigate) {
      helper.setEmailLink(txtEmail.text);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => IntroScreen()));

      _showToast("Your are now logged in");
    } else {
      _showToast("Please retry.");
    }
  }

  void _showToast(String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'Cool!', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
