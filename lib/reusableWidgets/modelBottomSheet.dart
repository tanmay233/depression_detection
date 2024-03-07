// ignore_for_file: file_names

import 'package:flutter/material.dart';

// final TextEditingController _resetemailController = TextEditingController();
displayBottomSheet(
    BuildContext context, TextEditingController resetemailController) {
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
              controller: resetemailController,
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
