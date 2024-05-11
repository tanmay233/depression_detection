// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:depression_app/Firebase/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class reusableFormField extends StatefulWidget {
  const reusableFormField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.isPassword});

  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  @override
  State<reusableFormField> createState() => _reusableFormFieldState();
}

class _reusableFormFieldState extends State<reusableFormField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
          MediaQuery.of(context).size.width * 0.05, 0),
      child: Card(
        elevation: 2.5,
        child: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter $Widget.hint';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            controller: widget.controller,
            obscureText: widget.isPassword ? !passwordVisible : false,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hint,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )
                    : null,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.grey)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white))),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class reusableGestureDetector extends StatefulWidget {
  const reusableGestureDetector(
      {super.key, required this.path, required this.name});

  final String path;
  final String name;

  @override
  State<reusableGestureDetector> createState() =>
      _reusableGestureDetectorState();
}

class _reusableGestureDetectorState extends State<reusableGestureDetector> {
  final Authentication authentication = Authentication();
  bool hold = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          hold = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          hold = false;
        });
      },
      onTap: () {
        if (widget.name == 'Google') {
          authentication.signInWithGoogle(context);
        }
      },
      child: Card(
        elevation: hold ? 0 : 5,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(widget.path),
              const SizedBox(
                width: 10,
              ),
              Text(widget.name)
            ],
          ),
        ),
      ),
    );
  }
}
