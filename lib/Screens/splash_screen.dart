import 'package:flutter/material.dart';
import 'package:orc_application/Screens/login_options.dart';
import 'package:orc_application/Styles/colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
            duration: 3000,
            splash: const Text("WELCOME"),
            nextScreen: const LoginOptionScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor:ProjectColors.pink );
  }
}