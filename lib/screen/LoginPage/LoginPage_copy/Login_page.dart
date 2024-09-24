import 'package:booking_app/screen/LoginPage/Login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_page();
}

class _login_page extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.robotoCondensed(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 49),
                    ),
                    const Text(
                      'Login with your Email & Password',
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    const login_form(),
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
