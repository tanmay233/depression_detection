import 'package:depression_app/screens/signup_screen.dart';
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

  bool _googleHold = false;
  bool _facebookHold = false;
  bool _passwordVisible = false;

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
                              SvgPicture.asset('assets/google.svg'),
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
                              SvgPicture.asset('assets/facebook.svg'),
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
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: _userEmailController,
                        decoration: const InputDecoration(
                            hintText: 'Enter Email',
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white))),
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
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: _userPasswordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Password',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white))),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),

                // Sign in button

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                      decoration: const BoxDecoration(
                        color: Color(0xff0EBE7F),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "Log In",
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
