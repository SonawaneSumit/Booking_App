// import 'dart:ffi';

import 'package:booking_app/screen/Dashboard/dashboard.dart';
import 'package:booking_app/screen/LoginPage/login_card.dart';
import 'package:booking_app/screen/Signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// import 'package:url_launcher/url_launcher.dart';

class login_form extends StatefulWidget {
  const login_form({super.key});

  @override
  State<login_form> createState() => _login_form();
}

class _login_form extends State<login_form> {
  final formkey = GlobalKey<FormState>();
  var Email = TextEditingController();
  var Password = TextEditingController();

  var isobsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 20),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade500),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                            color: Colors.blueAccent, size: 50),
                                  );
                                });
                            // CircularProgressIndicator(),
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => dashboard(),
                                ),
                              );
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                              logincard(
                                svg: 'asset/icon/google.svg',
                                press: () {},
                              ),
                              logincard(
                                svg: 'asset/icon/facebook.svg',
                                press: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
