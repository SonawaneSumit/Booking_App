// import 'dart:ffi';
// ignore_for_file: non_constant_identifier_names, camel_case_types, unused_field, file_names

import 'package:booking_app/screen/LoginPage/otp_screen/otp_screen.dart';
import 'package:booking_app/screen/Signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:url_launcher/url_launcher.dart';

class login_form extends StatefulWidget {
  const login_form({super.key});

  @override
  State<login_form> createState() => _login_form();
}

class _login_form extends State<login_form> {
  final formkey = GlobalKey<FormState>();
  var Mobile = TextEditingController();

  // var isobsecure = true.obs;

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 230,
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(29)),
              gradient: const LinearGradient(
                colors: [Color(0xfff5f7fa), Color(0xffc3cfe2)],
              ),
              boxShadow: [
                BoxShadow(color: Colors.blue.shade200, blurRadius: 9)
              ]),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                'Welcome Back',
                style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 41),
              ),
              const Text(
                'Login with Mobile Number',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        cursorColor: Colors.red,
                        controller: Mobile,
                        validator: (value) =>
                            value == '' ? 'Please Enter Mobile Number' : null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 21),
                          label: Text(
                            'Enter your Mobile Number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),

                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            child: Image.asset(
                              'asset/image/dialer.png', // Replace 'your_image.jpg' with the actual file name
                              width: 19,
                              height: 19,
                              color: Colors.black,
                            ),
                          ),
                          // hintText: 'Enter your Mobile Number',
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      FittedBox(
                        child: Container(
                          width: 270,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(colors: [
                                Color(0xffff0844),
                                Color(0xffffb199)
                              ])),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: LoadingAnimationWidget
                                            .staggeredDotsWave(
                                                color: Colors.blueAccent,
                                                size: 50),
                                      );
                                    });
                                // CircularProgressIndicator(),
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          otpscreen(mobileNumber: Mobile.text),
                                    ),
                                  );
                                });
                              }
                              setState(() {
                                TextEditingController().text.isEmpty
                                    ? _validate = true
                                    : _validate = false;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                "CONTINUE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => signup_page(),
                              ));
                            },
                            child: const Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
