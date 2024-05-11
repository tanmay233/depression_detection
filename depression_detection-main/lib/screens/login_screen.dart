// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors, prefer_final_fields, unused_import, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:depression_app/Firebase/authentication.dart';
import 'package:depression_app/reusableWidgets/modelBottomSheet.dart';
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
                              "Sign In",
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
                        displayBottomSheet(context, _resetemailController);
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
