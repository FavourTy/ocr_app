import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orc_application/Provider/auth_provider.dart';
import 'package:orc_application/Screens/homepage.dart';
import 'package:orc_application/Screens/reset.dart';
import 'package:orc_application/Styles/colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:orc_application/Widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool showPassword = false;
  bool isChecked = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors.white,
        appBar: AppBar(
          backgroundColor: ProjectColors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: ProjectColors.black,
                ),
              )
            ],
          ),
        ),
        body: isLoading == false
            ? SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          bottom: 15.0,
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: Text(
                                          "Email Address",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        height: 50.0,
                                        child: TextFormField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            hintText: "email address",
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              width: 1,
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: Text(
                                          "Password",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        height: 50.0,
                                        child: TextFormField(
                                          controller: _passwordController,
                                          decoration: InputDecoration(
                                            hintText: "password",
                                            focusedBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              width: 1,
                                            )),
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    showPassword =
                                                        !showPassword;
                                                  });
                                                },
                                                icon: Iconify(
                                                    !showPassword
                                                        ? Mdi.eye_outline
                                                        : Mdi.eye_off_outline,
                                                    color:
                                                        ProjectColors.black)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          activeColor: ProjectColors.black,
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          }),
                                      const Text("Remember me"),
                                      const SizedBox(
                                        width: 150,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      const ResetPasswordPage()));
                                        },
                                        child: const Text(
                                          "Forgot Password ?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: CustomButton(
                                    onpress: () {
                                      setState(() {
                                        isLoading == true;
                                      });
                                      AuthClass()
                                          .signInUser(
                                              emailAddress:
                                                  _emailController.text.trim(),
                                              password: _passwordController.text
                                                  .trim())
                                          .then((value) {
                                        if (value == "Welcome") {
                                          setState(() {
                                            isLoading == false;
                                          });
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()));
                                        } else {
                                           setState(() {
                                            isLoading == false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(value)));
                                        }
                                      });
                                    },
                                    buttonColor: ProjectColors.pink,
                                    buttonText: "Sign In",
                                  ),
                                ),
                              ],
                            ),
                            ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dont have an account?"),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: ProjectColors.pink,
                                      fontWeight: FontWeight.bold),
                                ))
                          ]),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
