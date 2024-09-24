import 'package:booking_app/screen/signup/signup_form.dart';
import 'package:flutter/material.dart';

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
          child: Stack(
            children: [
              Image.asset(
                'asset/image/Login2.jpg',
                height: 250,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              const SingleChildScrollView(
                child: Column(
                  children: [
                    signup_form(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
