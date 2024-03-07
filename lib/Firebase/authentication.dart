// ignore_for_file: unused_local_variable, prefer_const_constructors, use_build_context_synchronously, avoid_print

// import 'dart:js_interop';

import 'package:depression_app/screens/home_screen.dart';
import 'package:depression_app/screens/login_screen.dart';
import 'package:depression_app/screens/soundLeLo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic register(
      BuildContext context,
      TextEditingController userEmailController,
      TextEditingController userPasswordController) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: userEmailController.text,
        password: userPasswordController.text,
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("successful")));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const loginScreen()));
    } on FirebaseAuthException catch (e) {
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

  dynamic login(BuildContext context, TextEditingController userEmailController,
      TextEditingController userPasswordController) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userEmailController.text,
              password: userPasswordController.text);
      print('logged in');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => soundLelo()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No user found for that email.")));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wrong password provided for that user.")));
      } else {
        print(e.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await auth.signInWithCredential(credential);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => home_screen()));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future signOut(BuildContext context) async {
    try {
      return await _auth.signOut().then((value) => Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => const loginScreen()),
          ));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
