import 'package:booking_app/screen/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class signup_page extends StatefulWidget {
  const signup_page({super.key});

  @override
  State<signup_page> createState() => _signup_page();
}

class _signup_page extends State<signup_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Register Account',
                      style: GoogleFonts.robotoCondensed(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 37),
                    ),
                    const Text(
                      'Complete your details',
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    const signup_form(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
