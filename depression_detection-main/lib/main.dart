// ignore_for_file: unused_import

import 'package:depression_app/screens/login_screen.dart';
import 'package:depression_app/screens/signup_screen.dart';
import 'package:depression_app/screens/soundLeLo.dart';
import 'package:depression_app/views/onboarding_page.dart';
import 'package:depression_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: soundLelo(),
      // home: loginScreen(),
      home: seenOnboard == true ? signup_screen() : SplashScreen(),
    );
  }
}
