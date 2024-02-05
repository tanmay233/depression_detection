import 'package:depression_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:depression_app/views/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import './views/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Depression Detection App',
        theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());

    // return const MaterialApp(

    //   home: loginScreen(),
    // );
  }
}
