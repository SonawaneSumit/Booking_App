// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, camel_case_types, file_names

import 'dart:async';
import 'package:booking_app/screen/LoginPage/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay using Future.delayed
    Timer(
      Duration(seconds: 2),
      () {
        // Navigate to the next page after 5 seconds
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  login_page()), // Replace NextPage with your actual next page
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.blueAccent,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffff8473), Color(0xfffff9d2)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("asset/image/Animation.json", height: 300, width: 300)
          ],
        ),
      ),
    );
  }
}
