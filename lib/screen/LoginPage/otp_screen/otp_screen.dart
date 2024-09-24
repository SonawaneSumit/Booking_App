// ignore_for_file: camel_case_types

import 'package:booking_app/screen/Dashboard/dashboard.dart';
import 'package:booking_app/screen/LoginPage/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class otpscreen extends StatefulWidget {
  final String mobileNumber;
  const otpscreen({
    super.key,
    required this.mobileNumber,
  });

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  @override
  Widget build(BuildContext context) {
    String lastFourDigits =
        widget.mobileNumber.substring(widget.mobileNumber.length - 4);

    String maskedNumber = '*' * 6 + lastFourDigits;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        flexibleSpace: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xfff5f7fa), Color(0xffc3cfe2)])),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            height: 550,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(29),
                    bottomRight: Radius.circular(29)),
                gradient: const LinearGradient(
                  colors: [Color(0xfff5f7fa), Color(0xffc3cfe2)],
                ),
                boxShadow: [
                  BoxShadow(color: Colors.blue.shade200, blurRadius: 9)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Verification Code',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Row(
                    children: [Text('We have sent the code verification to')],
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Text('+91 $maskedNumber'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const login_page()));
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text('  Change Mobile Number?'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  Form(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 54,
                        width: 52,
                        child: TextFormField(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2))),
                        ),
                      ),
                      SizedBox(
                        height: 54,
                        width: 52,
                        child: TextFormField(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2))),
                        ),
                      ),
                      SizedBox(
                        height: 54,
                        width: 52,
                        child: TextFormField(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2))),
                        ),
                      ),
                      SizedBox(
                        height: 54,
                        width: 52,
                        child: TextFormField(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2))),
                        ),
                      ),
                      SizedBox(
                        height: 54,
                        width: 52,
                        child: TextFormField(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2))),
                        ),
                      ),
                      SizedBox(
                        height: 54,
                        width: 52,
                        child: TextFormField(
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2))),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 180,
                  ),
                  FittedBox(
                    child: Container(
                      width: 270,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              colors: [Color(0xffff0844), Color(0xffffb199)])),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dashboard()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            "VERIFY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive OTP ?"),
                      TextButton(onPressed: () {}, child: const Text("RESEND"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
