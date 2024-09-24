// import 'dart:ffi';

// ignore_for_file: non_constant_identifier_names, camel_case_types, unused_field

import 'package:booking_app/screen/LoginPage/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:url_launcher/url_launcher.dart';

class signup_form extends StatefulWidget {
  const signup_form({super.key});

  @override
  State<signup_form> createState() => _signup_form();
}

class _signup_form extends State<signup_form> {
  final formkey = GlobalKey<FormState>();
  var Email = TextEditingController();
  var Name = TextEditingController();
  var Mobile = TextEditingController();

  // var isobsecure = true.obs;

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 170,
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

          //
          // Form Desiging start //
          //
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
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
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        child: TextFormField(
                          cursorColor: Colors.red,
                          controller: Name,
                          validator: (value) =>
                              value == '' ? 'Please Enter Name' : null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 18),
                            label: const Text(
                              'Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                            prefixIcon: const Icon(Icons.person,
                                color: Colors.black, size: 23),
                            hintText: 'Enter your Name',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //
                      //
                      //
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        cursorColor: Colors.red,
                        controller: Mobile,
                        validator: (value) =>
                            value == '' ? 'Please Enter Mobile No.' : null,
                        // obscureText: isobsecure.value,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          prefixIcon: const Icon(
                            Icons.phone_iphone,
                            color: Colors.black,
                            size: 19,
                          ),
                          label: const Text(
                            'Mobile No.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          hintText: 'Enter your Mobile No.',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),

                      const SizedBox(
                        height: 25,
                      ),
                      //
                      //
                      TextFormField(
                        onTap: () {
                          setState(() {
                            _validate = false;
                          });
                        },
                        cursorColor: Colors.red,
                        controller: Email,
                        validator: (value) =>
                            value == '' ? 'Please Enter Email ID' : null,
                        // obscureText: isobsecure.value,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 19,
                          ),
                          label: const Text(
                            'Email ID',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          hintText: 'Enter your Email ID',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text(
                                  'By creating your account you agree to our Terms of use and Privacy Policy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 22,
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
                                // Call the register method with user data

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login_page()));
                              }
                              setState(() {
                                if (TextEditingController().text.isEmpty) {
                                  _validate = true;
                                } else {
                                  _validate = false;
                                }
                                // TextEditingController().text.isEmpty
                                //     ? _validate = true
                                //     : _validate = false;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => login_page(),
                              //   ),
                              // );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                "Sign Up",
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
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => login_page(),
                                  ));
                            },
                            child: const Text("login Here",
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
