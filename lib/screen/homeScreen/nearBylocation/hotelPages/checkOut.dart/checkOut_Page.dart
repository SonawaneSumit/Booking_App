// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_null_comparison

import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/checkOut.dart/bookingPage/booking_page.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/courtyardPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:booking_app/model/hotels.dart';

class checkOutPage extends StatefulWidget {
  const checkOutPage({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<checkOutPage> createState() => _checkOutPageState();
}

class _checkOutPageState extends State<checkOutPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 2));
//
  int selectedRooms = 01;
  int selectedAdults = 01;
  int selectedChildren = 00;

  @override
  void initState() {
    loadGuestValues();
    readDates();
    super.initState();
  }

  void readDates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime? savedStartDate = prefs.getInt("startDate") != null
        ? DateTime.fromMillisecondsSinceEpoch(
            prefs.getInt("startDate")!,
          )
        : null;

    DateTime? savedEndDate = prefs.getInt("endDate") != null
        ? DateTime.fromMillisecondsSinceEpoch(
            prefs.getInt("endDate")!,
          )
        : null;

    if (savedStartDate != null && savedEndDate != null) {
      setState(() {
        startDate = savedStartDate;
        endDate = savedEndDate;
      });
    }
  }

  void loadGuestValues() async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    selectedRooms = prefs.getInt('selectedRooms') ?? 0;
    selectedAdults = prefs.getInt('selectedAdults') ?? 0;
    selectedChildren = prefs.getInt('selectedChildren') ?? 0;
    setState(() {});
    // return loadGuestValues();
  }

  double calculateDiscountValue() {
    // Calculate 18% of widget.hotel.disPrice
    double discountValue = 0.18 * widget.hotel.disPrice;
    return discountValue;
  }

  double calculateAcRoomValue() {
    // Calculate 18% of widget.hotel.disPrice
    double acRoomValue = 0.18 * widget.hotel.Acprice;
    return acRoomValue;
  }

  taxValue() {
    var taxValue = widget.hotel.Acprice * selectedRooms;
    return taxValue;
  }

  @override
  Widget build(BuildContext context) {
    if (selectedRooms == 1) {
      selectedAdults = 2;
    } else if (selectedAdults > selectedRooms * 2) {
      selectedRooms++;
      // selectedAdults = selectedRooms * 2;
    } /* else if (selectedRooms >= 2) {
      selectedRooms--;
      selectedAdults = selectedRooms * 2;
    } */
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                    builder: (context) => courtyardPage(hotel: widget.hotel)));
          },
        ),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      "Select Room",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${startDate != null ? DateFormat("dd MMM").format(startDate) : DateFormat(" dd MMM").format(DateTime.now())} - ${endDate != null ? DateFormat("dd MMM").format(endDate) : DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 1)))}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' | $selectedRooms Room, $selectedAdults Adult, $selectedChildren Child',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "$selectedRooms Room Combo",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "$selectedAdults Adults",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Divider(
                        height: 25,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$selectedRooms AC Standard Small   ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "asset/image/cross.png",
                            height: 12,
                            width: 12,
                            color: Colors.grey.shade700,
                          ),
                          Text(
                            " 2 Adults",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          // Image.asset(
                          //   widget.hotel.Rimages,
                          //   height: 80,
                          //   width: 80,
                          // )
                        ],
                      ),
                      Divider(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Room with Breakfast",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
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
                                      width: 3,
                                    ),
                                    SizedBox(
                                        width: 120,
                                        child: Text("Free Breakfast"))
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
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
                                      width: 3,
                                    ),
                                    SizedBox(
                                        width: 120,
                                        child: Text("Non-Refundable"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              widget.hotel.Rimages,
                              height: 80,
                              width: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text(
                                  "\u{20B9} ${NumberFormat("#,##0").format(widget.hotel.price)}",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red,
                                      decorationThickness: 2),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "\u{20B9} ${NumberFormat("#,##0").format(widget.hotel.disPrice * selectedRooms)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "+ \u{20B9} ${calculateDiscountValue().toStringAsFixed(2)} taxes & service fees per night",
                                    // Display the calculated discount value
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight
                                            .w600 // You can change the color
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                FittedBox(
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffff0844),
                                          Color(0xffffb199),
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => booking_Page(
                                              hotel: widget.hotel,
                                              price: widget.hotel.disPrice *
                                                  selectedRooms.toDouble(),
                                              taxesAndFees:
                                                  calculateDiscountValue(),
                                              sDate: startDate,
                                              eDate: endDate,
                                              seleRooms: selectedRooms,
                                              seleAdults: selectedAdults,
                                              seleChild: selectedChildren,
                                              roomType: "AC Standard Small",
                                              point1: "Free Brekfast",
                                              point2: "Non-Refundable",
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      child: Text('SELECT'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            ////  Next container create //////////////////////////////////
            /////
            ///

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FittedBox(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "$selectedRooms Room Combo",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "$selectedAdults Adults",
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Divider(
                        height: 25,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$selectedRooms Standard AC Room   ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "asset/image/cross.png",
                            height: 12,
                            width: 12,
                            color: Colors.grey.shade700,
                          ),
                          Text(
                            " 2 Adults",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          // Image.asset(
                          //   widget.hotel.Rimages,
                          //   height: 80,
                          //   width: 80,
                          // )
                        ],
                      ),
                      Divider(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Room with Breakfast",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
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
                                      width: 3,
                                    ),
                                    SizedBox(
                                        width: 120,
                                        child: Text("Free Breakfast"))
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
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
                                      width: 3,
                                    ),
                                    SizedBox(
                                        width: 120,
                                        child: Text("Non-Refundable"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              widget.hotel.Rimages,
                              height: 80,
                              width: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Text(
                                  "\u{20B9} ${widget.hotel.price}",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red,
                                      decorationThickness: 2),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "\u{20B9} ${NumberFormat("#,##0").format(/* widget.hotel.Acprice * selectedRooms */ taxValue())}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "+ \u{20B9} ${calculateAcRoomValue().toStringAsFixed(2)} taxes & service fees per night",
                                    // Display the calculated discount value
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight
                                            .w600 // You can change the color
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                FittedBox(
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffff0844),
                                          Color(0xffffb199),
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => booking_Page(
                                              hotel: widget.hotel,
                                              price: widget.hotel.Acprice *
                                                  selectedRooms.toDouble(),
                                              taxesAndFees:
                                                  calculateAcRoomValue(),
                                              sDate: startDate,
                                              eDate: endDate,
                                              seleRooms: selectedRooms,
                                              seleAdults: selectedAdults,
                                              seleChild: selectedChildren,
                                              roomType: "AC Standard Room",
                                              point1: "Free Brekfast",
                                              point2: "Non-Refundable",
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent),
                                      child: Text('SELECT'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
