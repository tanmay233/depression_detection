// ignore_for_file: use_build_context_synchronously, prefer_final_fields, annotate_overrides, camel_case_types, duplicate_ignore, unused_local_variable, unnecessary_null_comparison, unused_import, prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:back_button_interceptor/back_button_interceptor.dart';
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

  String email = "", password = "", name = "";
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();

  _register(TextEditingController _userEmailController,
      TextEditingController _userPasswordController) async {
    try {
      setState(() {
        _isloading = true;
      });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _userEmailController.text,
        password: _userPasswordController.text,
      );
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("successful")));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const home_screen()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isloading = false;
      });
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("The account already exists for that email.")));
      }
    } catch (e) {
      print(e);
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  final _formkey = GlobalKey<FormState>();

  bool _googleHold = false;
  bool _facebookHold = false;
  bool _passwordVisible = false;
  bool _isChecked = false;
  bool _isloading = false;

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
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 0.75,
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
                      GestureDetector(
                        onTapDown: (details) {
                          setState(() {
                            _googleHold = true;
                          });
                        },
                        onTapUp: (details) {
                          setState(() {
                            _googleHold = false;
                          });
                        },
                        child: Card(
                          elevation: _googleHold ? 0 : 5,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset('assets/images/google.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("Google")
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Button for facebook
                      GestureDetector(
                        onTapDown: (details) {
                          setState(() {
                            _facebookHold = true;
                          });
                        },
                        onTapUp: (details) {
                          setState(() {
                            _facebookHold = false;
                          });
                        },
                        child: Card(
                          elevation: _facebookHold ? 0 : 5,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.white),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/facebook.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("FaceBook")
                              ],
                            ),
                          ),
                        ),
                      )
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.05,
                              0,
                              MediaQuery.of(context).size.width * 0.05,
                              0),
                          child: Card(
                            elevation: 2.5,
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Name';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                controller: _userNameController,
                                decoration: const InputDecoration(
                                    hintText: 'Name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.white))),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.05,
                              0,
                              MediaQuery.of(context).size.width * 0.05,
                              0),
                          child: Card(
                            elevation: 2.5,
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Email';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                controller: _userEmailController,
                                decoration: const InputDecoration(
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.white))),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.05,
                              0,
                              MediaQuery.of(context).size.width * 0.05,
                              0),
                          child: Card(
                            elevation: 2.5,
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                controller: _userPasswordController,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Password',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    suffixIcon: IconButton(
                                      icon: Icon(_passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.grey)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.white))),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Sign in button

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        _register(
                            _userEmailController, _userPasswordController);
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
                          Navigator.pop(
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
