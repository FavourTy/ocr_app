import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:orc_application/Provider/auth_provider.dart';
import 'package:orc_application/Screens/login_screen.dart';
import 'package:orc_application/Styles/colors.dart';
import 'package:orc_application/Widgets/custom_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.pink,
      body: Center(
        child: CustomButton(
          onpress: () {
            AuthClass().signOut();
             Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
          },
          buttonText: 'Log out',
          buttonColor: ProjectColors.pink,
        ),
      ),
    );
  }
}
