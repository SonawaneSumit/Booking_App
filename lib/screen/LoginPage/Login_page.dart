import 'package:booking_app/screen/LoginPage/Login_form.dart';
import 'package:flutter/material.dart';

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
          child: Stack(
            children: [
              Image.asset(
                'asset/image/Login1.jpg',
                height: 270,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              const SingleChildScrollView(
                child: Column(
                  children: [
                    // Divider(),
                    login_form(),
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
