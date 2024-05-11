// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:depression_app/Firebase/authentication.dart';
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            authentication.signOut(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            child: Text("Sign out"),
          ),
        ),
      ),
    );
  }
}
