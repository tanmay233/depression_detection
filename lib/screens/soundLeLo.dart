// ignore_for_file: file_names, unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:avatar_glow/avatar_glow.dart';
import 'package:depression_app/screens/test.dart';
import 'package:flutter/material.dart';

class soundLelo extends StatefulWidget {
  const soundLelo({super.key});

  @override
  State<soundLelo> createState() => _soundLeloState();
}

class _soundLeloState extends State<soundLelo> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  Widget _buildBody() {
    return AnimatedBuilder(
      animation:
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            _buildContainer(150 * _controller.value),
            _buildContainer(200 * _controller.value),
            _buildContainer(250 * _controller.value),
            _buildContainer(300 * _controller.value),
            _buildContainer(350 * _controller.value),
          ],
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green.withOpacity(1 - _controller.value),
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
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Text(
                  "AI Sound Analysis",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4F3422)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please say something, Don't worry we do not steal you data",
                  style: TextStyle(fontSize: 16, color: Color(0xff4f3422)),
                ),
                Text('JK'),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 250,
                  child: _buildBody(),
                ),
                Center(child: Text('data')),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextButton(
                    onPressed: null,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                      decoration: const BoxDecoration(
                        color: Color(0xff0EBE7F),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
