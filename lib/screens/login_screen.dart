// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors, prefer_final_fields, unused_import, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:depression_app/Firebase/authentication.dart';
import 'package:depression_app/reusableWidgets/reusableFormField.dart';
import 'package:depression_app/screens/home_screen.dart';
import 'package:depression_app/screens/signup_screen.dart';
import 'package:depression_app/screens/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginStateScreen();
}

// ignore: camel_case_types
class _loginStateScreen extends State<loginScreen> {
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _resetemailController = TextEditingController();

  bool _isLoading = false;

  Authentication authentication = Authentication();

  final _formkey = GlobalKey<FormState>();

  _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              20, 0, 10, MediaQuery.of(context).viewInsets.bottom),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              Center(
                child: Container(
                  width: 130,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFC4C4C4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Forgot password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w500,
                  height: 0,
                  letterSpacing: -0.30,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Enter you email for verification process,',
                style: TextStyle(
                  color: Color(0xFF677294),
                  fontSize: 14,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: -0.30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _resetemailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 54,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: ShapeDecoration(
                        color: const Color(0xFF0EBE7F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff86DEBF),
            Colors.white,
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: <Widget>[
                //upper padding

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),

                //For the text
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                // bottom padding

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),

                // Buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // button for google
                    reusableGestureDetector(
                        path: 'assets/images/google.svg', name: 'Google'),
                    //Button for facebook
                    reusableGestureDetector(
                        path: 'assets/images/facebook.svg', name: 'Facebook'),
                  ],
                ),
                // in between space

                const SizedBox(
                  height: 40,
                ),

                // Text fields

                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      reusableFormField(
                        controller: _userEmailController,
                        hint: 'Email',
                        isPassword: false,
                      ),
                      reusableFormField(
                        controller: _userPasswordController,
                        hint: 'Password',
                        isPassword: true,
                      )
                    ],
                  ),
                ),

                // Sign in button

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        await authentication.login(context,
                            _userEmailController, _userPasswordController);
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                      decoration: const BoxDecoration(
                        color: Color(0xff0EBE7F),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  ),
                ),

                //in between space
                const SizedBox(
                  height: 20,
                ),

                //forget password
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _displayBottomSheet(context);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style:
                            TextStyle(color: Color(0xff0ebe7f), fontSize: 14),
                      ),
                    ),
                    // in between space
                    const SizedBox(
                      height: 20,
                    ),
                    // Sign up
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const signup_screen()));
                      },
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Don't have an account? Join us",
                          style:
                              TextStyle(color: Color(0xff0ebe7f), fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
