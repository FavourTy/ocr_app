import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:orc_application/Provider/auth_provider.dart';
import 'package:orc_application/Screens/homepage.dart';
import 'package:orc_application/Screens/login_screen.dart';
import 'package:orc_application/Styles/colors.dart';
import 'package:orc_application/Widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool showPassword = false;
  bool isChecked = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors.white,
        appBar: AppBar(
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
        body: _isLoading == false
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
                          "Create Account",
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
                                          "Username",
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
                                          controller: _usernameController,
                                          decoration: const InputDecoration(
                                            hintText: "Your Username",
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
                                          "Email",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        height: 50.0,
                                        child: TextFormField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            hintText: "Your Email",
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
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
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
                                            focusedBorder:
                                                const UnderlineInputBorder(
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
                                      const Text(
                                          "I accept the terms and privacy policy")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: CustomButton(
                                    onpress: () {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      AuthClass()
                                          .createAccount(
                                              email:
                                                  _emailController.text.trim(),
                                              password: _passwordController.text
                                                  .trim())
                                          .then((value) {
                                        if (value ==
                                            "Account Created Successfully") {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()));
                                        } else {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(value),
                                          ));
                                        }
                                      });
                                    },
                                    buttonColor: ProjectColors.pink,
                                    buttonText: "Sign Up",
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: ((context) =>
                                                  const LoginScreen())));
                                    },
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                        color: ProjectColors.pink,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))
                            ]),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
