// ignore_for_file: use_build_context_synchronously, prefer_final_fields, annotate_overrides, camel_case_types, duplicate_ignore, unused_local_variable, unnecessary_null_comparison, unused_import, prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print, unused_field, prefer_const_literals_to_create_immutables

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:depression_app/Firebase/authentication.dart';
import 'package:depression_app/reusableWidgets/reusableFormField.dart';
import 'package:depression_app/screens/home_screen.dart';
import 'package:depression_app/screens/login_screen.dart';
import 'package:depression_app/screens/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => const loginScreen()));
    return true;
  }

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool _googleHold = false;
  bool _facebookHold = false;
  bool _isChecked = false;
  bool _isloading = false;

  Authentication authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.selected,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.grey;
    }

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
                      "Join us to start searching",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                          controller: _userNameController,
                          hint: 'Name',
                          isPassword: false,
                        ),
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
                        if (_isChecked == true) {
                          setState(() {
                            _isloading = true;
                          });
                          await authentication.register(context,
                              _userEmailController, _userPasswordController);
                          setState(() {
                            _isloading = false;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Please accept the Terms and Conditions")));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                        decoration: const BoxDecoration(
                          color: Color(0xff0EBE7F),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: _isloading
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
                    height: 10,
                  ),
                  //T&C

                  Row(
                    children: [
                      Checkbox(
                        shape: const CircleBorder(),
                        checkColor: Colors.black,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        side: MaterialStateBorderSide.resolveWith((states) =>
                            BorderSide(
                                width: 1.0,
                                color: _isChecked
                                    ? Colors.black
                                    : Colors.transparent)),
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        "I agree with Terms of Services & Privacy Policy",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ],
                  ),

                  // inbetween space
                  const SizedBox(
                    height: 30,
                  ),
                  //login
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const loginScreen()));
                        },
                        child: const Text(
                          "Have an Account? Log In",
                          style:
                              TextStyle(color: Color(0xff0ebe7f), fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
