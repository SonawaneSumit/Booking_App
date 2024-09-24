// import 'dart:ffi';

import 'package:booking_app/screen/LoginPage/Login_page.dart';
import 'package:booking_app/screen/Signup/signup_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:url_launcher/url_launcher.dart';

class signup_form extends StatefulWidget {
  const signup_form({super.key});

  @override
  State<signup_form> createState() => _signup_form();
}

class _signup_form extends State<signup_form> {
  final formkey = GlobalKey<FormState>();
  var Email = TextEditingController();
  var Password = TextEditingController();
  var confpassword = TextEditingController();

  var isobsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
          child: Container(
            width: 350,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                gradient: const LinearGradient(
                  colors: [Color(0xffFFCCCB), Color(0xffFFE6FA)],
                ),
                boxShadow: [
                  BoxShadow(color: Colors.red.shade200, blurRadius: 9)
                ]),

            //
            // Form Desiging start //
            //
            child: Column(
              children: [
                Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        TextFormField(
                          cursorColor: Colors.red,
                          controller: Email,
                          validator: (value) =>
                              value == '' ? 'Please Enter Email' : null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 21),
                            label: const Text(
                              'Email',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                            prefixIcon: const Icon(Icons.mail_lock,
                                color: Colors.black, size: 19),
                            hintText: 'Enter your Email',
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
                          height: 29,
                        ),
                        //
                        //
                        //
                        Obx(
                          () => TextFormField(
                            cursorColor: Colors.red,
                            controller: Password,
                            validator: (value) =>
                                value == '' ? 'Please Enter Password' : null,
                            obscureText: isobsecure.value,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 21),
                              prefixIcon: const Icon(
                                Icons.password_outlined,
                                color: Colors.black,
                                size: 19,
                              ),
                              label: const Text(
                                'Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              hintText: 'Enter your Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  isobsecure.value = !isobsecure.value;
                                },
                                child: Icon(
                                  isobsecure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
//
//
                        Obx(
                          () => TextFormField(
                            cursorColor: Colors.red,
                            controller: confpassword,
                            validator: (value) =>
                                value == '' ? 'Please Enter Password' : null,
                            obscureText: isobsecure.value,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 21),
                              prefixIcon: const Icon(
                                Icons.password_outlined,
                                color: Colors.black,
                                size: 19,
                              ),
                              label: const Text(
                                'Confirm Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              hintText: 'Enter your Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  isobsecure.value = !isobsecure.value;
                                },
                                child: Icon(
                                  isobsecure.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade500),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => login_page(),
                                ));
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
                        const SizedBox(
                          height: 17,
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              signupcard(
                                svg: 'asset/icon/google.svg',
                                press: () {},
                              ),
                              signupcard(
                                svg: 'asset/icon/facebook.svg',
                                press: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
