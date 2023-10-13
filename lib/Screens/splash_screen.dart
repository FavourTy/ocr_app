import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orc_application/Screens/homepage.dart';
import 'package:orc_application/Screens/login_options.dart';
import 'package:orc_application/Styles/colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const LoginOptionScreen()),
            (route) => false);
      } else{
         Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    });

    return Scaffold(
      backgroundColor: ProjectColors.pink,
      body: const Center(
        child: Text(
          "WELCOME",
          style: TextStyle(
            fontSize: 30,
          )
        ),
      ),
    );
  }
}
