// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unused_local_variable, non_constant_identifier_names

import 'package:booking_app/model/hotels.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/checkOut.dart/checkOut_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class booking_Page extends StatefulWidget {
  final double price;
  final double taxesAndFees;
  final sDate;
  final eDate;
  final seleRooms;
  final seleAdults;
  final seleChild;
  final roomType;
  final point1;
  final point2;

  const booking_Page({
    super.key,
    required this.hotel,
    required this.price,
    required this.taxesAndFees,
    required this.sDate,
    required this.eDate,
    required this.seleRooms,
    required this.seleAdults,
    required this.seleChild,
    required this.roomType,
    required this.point1,
    required this.point2,
  });

  final Hotel hotel;

  @override
  State<booking_Page> createState() => _booking_PageState();
}

class _booking_PageState extends State<booking_Page> {
  var Name = TextEditingController();
  var Email = TextEditingController();
  var Mnumber = TextEditingController();

  totalValue() {
    var totalValue = widget.price + widget.taxesAndFees;
    return totalValue;
  }

  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Success : ${response.paymentId}", timeInSecForIosWeb: 7);
  }

  void _handlePaymentError(PaymentSuccessResponse response) {}

  void _handlePaymentWallet(PaymentSuccessResponse response) {}

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);
  }

  void makePayment() async {
    var options = {
      'key': 'rzp_test_qT16sXfkCM9Yh9',
      'amount':
          totalValue().toInt() * 100, // Convert to paise (Indian currency)
      'name': 'Sumit',
      'description': widget.roomType,
      'prefill': {'contact': '9999999999', 'email': 'jhon@razorpay.com'},
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => checkOutPage(hotel: widget.hotel)));
          },
        ),
        flexibleSpace: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Confirm Booking",
                  // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  style: GoogleFonts.mooli(
                      fontWeight: FontWeight.bold, fontSize: 17),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 240,
                    width: 400,
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                      widget.hotel.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    // Row(
                                    //   children: [],
                                    // ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          widget.hotel.address,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 13),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                widget.hotel.images[0],
                                height: 90,
                                width: 125,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  const Text(
                                    "CHECK-IN",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  // Text(widget.sDate.toString()),
                                  Text(
                                    DateFormat.yMMMEd()
                                        .format(widget.sDate)
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  Text('2 PM'),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    '${widget.eDate.difference(widget.sDate).inDays} Night',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    "CHECK-OUT",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    DateFormat.yMMMEd()
                                        .format(widget.eDate)
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  Text('12 PM'),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(),
                        const Row(
                          children: [
                            Text(
                              'Guests & Rooms',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              ' ${widget.seleRooms.toString()} Room',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            Image.asset(
                              "asset/image/Dot.png",
                              height: 15,
                              width: 12,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              ' ${widget.seleAdults.toString()} Adult',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            Image.asset(
                              "asset/image/Dot.png",
                              height: 15,
                              width: 12,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              ' ${widget.seleChild.toString()} Children',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        // const Divider()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 97,
                    width: 400,
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.roomType,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "asset/image/Dot.png",
                              height: 15,
                              width: 12,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.point1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "asset/image/Dot.png",
                              height: 15,
                              width: 12,
                              color: Colors.grey.shade700,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.point2,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 130,
                    width: 400,
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Price Breakup",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount :",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '\u{20B9} ${NumberFormat("#,##0").format(widget.price)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total GST Amount :",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '\u{20B9} ${NumberFormat("#,##0").format(widget.taxesAndFees)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Final Payble Amount :",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '\u{20B9} ${NumberFormat("#,##0").format(totalValue()).toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 270,
                    width: 400,
                    color: Colors.white,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Primary Guest Detail",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Row(
                        //   children: [
                        //     Text("Name"),
                        //   ],
                        // ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            cursorColor: Colors.red,
                            controller: Name,
                            decoration: InputDecoration(
                                label: Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                hintText: "Enter Full Name",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.grey))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            cursorColor: Colors.red,
                            controller: Email,
                            decoration: InputDecoration(
                                label: Text(
                                  'Email Id',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                hintText: "Enter Email-Id",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.grey)),
                                focusColor: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            cursorColor: Colors.red,
                            controller: Mnumber,
                            decoration: InputDecoration(
                                label: Text(
                                  'Mobile Number',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                hintText: "Enter Mobile Number",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12)),
                                hoverColor: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xffff0844),
                        Color(0xffffb199),
                      ]),
                      borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                    onPressed: () {
                      makePayment();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: const FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        'Make a Payment',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
