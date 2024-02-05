// ignore_for_file: file_names, unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace

import 'package:avatar_glow/avatar_glow.dart';
import 'package:depression_app/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class soundLelo extends StatefulWidget {
  const soundLelo({super.key});

  @override
  State<soundLelo> createState() => _soundLeloState();
}

class _soundLeloState extends State<soundLelo> with TickerProviderStateMixin {
  late AnimationController _controller;
  final speechToText = SpeechToText();
  String lastWords = '';
  bool startRecord = false;
  final SpeechToText speech = SpeechToText();
  bool isAvailable = false;
  var text = 'press the mic button to start recording';

  @override
  void initState() {
    super.initState();
    make();
    _controller = new AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  make() async {
    isAvailable = await speech.initialize();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      lastWords = result.recognizedWords;
    });
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
                Center(child: Text(text)),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextButton(
                    onPressed: null,
                    child: GestureDetector(
                      onTapDown: (value) async {
                        setState(() {
                          startRecord = true;
                        });
                        if (isAvailable) {
                          await speech.listen(onResult: (value) {
                            setState(() {
                              text = value.recognizedWords;
                            });
                          });
                        }
                      },
                      onTapUp: (value) async {
                        setState(() {
                          startRecord = false;
                        });
                        await speech.stop();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                        decoration: const BoxDecoration(
                          color: Color(0xff0EBE7F),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Text(
                          "Tap to record audio",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
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
