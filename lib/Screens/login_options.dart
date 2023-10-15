import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orc_application/Screens/login_screen.dart';
import 'package:orc_application/Screens/signUp_screen.dart';
import 'package:orc_application/Styles/colors.dart';
import 'package:orc_application/Widgets/custom_button.dart';

class LoginOptionScreen extends StatefulWidget {
  const LoginOptionScreen({super.key});

  @override
  State<LoginOptionScreen> createState() => _LoginOptionScreenState();
}

class _LoginOptionScreenState extends State<LoginOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors.white,
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Welcome to orc",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomButton(onpress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  buttonColor: ProjectColors.pink,
                  buttonText: "Create an account",
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomButton(onpress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  buttonColor: ProjectColors.pink,
                  buttonText: "Login",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
