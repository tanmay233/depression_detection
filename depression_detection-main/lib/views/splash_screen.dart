// ignore_for_file: unused_import

import 'package:depression_app/screens/login_screen.dart';
import 'package:depression_app/views/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingPage()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xB760CDFF),
            Colors.white,
            Colors.white,
            Color(0xff0ebe7f),
          ],
        ),
      ),
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Depression detection app ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 25,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.30,
            ),
          )
        ],
      ),
    ));
  }
}
