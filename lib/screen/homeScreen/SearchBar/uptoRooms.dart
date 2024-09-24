// uptoRooms
// ignore_for_file: unused_import, unnecessary_import, unused_field, unnecessary_string_interpolations, unnecessary_null_comparison, avoid_unnecessary_containers

import 'dart:ui';

import 'package:booking_app/model/hotels.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/courtyardPage.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/seeAll/courtyard.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/seeAll/seeAllPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'selectRooms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

class uptoRooms extends StatefulWidget {
  const uptoRooms({
    super.key,
  });

  @override
  State<uptoRooms> createState() => _uptoRoomsState();
}

class _uptoRoomsState extends State<uptoRooms> {
  int selectedRooms = 01;
  int selectedAdults = 01;
  int selectedChildren = 00;

  @override
  void initState() {
    super.initState();
    saveGuestValues();
    readDates();
  }

  void saveGuestValues() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedRooms', selectedRooms);
    await prefs.setInt('selectedAdults', selectedAdults);
    await prefs.setInt('selectedChildren', selectedChildren);
  }

  void loadGuestValues() async {
    final prefs = await SharedPreferences.getInstance();
    selectedRooms = prefs.getInt('selectedRooms') ?? 0;
    selectedAdults = prefs.getInt('selectedAdults') ?? 0;
    selectedChildren = prefs.getInt('selectedChildren') ?? 0;
  }

  void _updateGuests() {
    // Custom method to update adults and children based on selected rooms
    // You can customize this logic based on your requirements
    //
    // selectedAdults = selectedRooms;
    selectedChildren = 0;
  }

  void _incrementCounter() {
    setState(() {
      selectedRooms++;
      saveGuestValues();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (selectedRooms > 1) {
        selectedRooms--;
        saveGuestValues();
      }
    });
  }

  void _incrementAdults() {
    setState(() {
      selectedAdults++;
      saveGuestValues();
    });
  }

  void _decrementAdults() {
    setState(() {
      if (selectedAdults > 1) {
        selectedAdults--;
        saveGuestValues();
      }
    });
  }

  void _incrementChildren() {
    setState(() {
      selectedChildren++;
      saveGuestValues();
    });
  }

  void _decrementChildren() {
    setState(() {
      if (selectedChildren > 0) {
        selectedChildren--;
        saveGuestValues();
      }
    });
  }

  Future<void> _showRoomBottomSheet() {
    return showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.grey.shade100),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Container(
              padding: const EdgeInsets.all(16.0),
              height: 310,
              child: Column(
                children: <Widget>[
                  Text(
                    'Select Rooms and Guests',
                    style: GoogleFonts.kanit(fontSize: 20),
                  ),
                  const Divider(
                    thickness: 2.5,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Rooms',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FloatingActionButton(
                              onPressed: () {
                                _incrementCounter();
                                _updateGuests();
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            child: Text(
                              '$selectedRooms',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FloatingActionButton(
                                tooltip: 'Decrement',
                                onPressed: () {
                                  _decrementCounter();
                                  _updateGuests();
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Adults',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FloatingActionButton(
                              onPressed: () {
                                _incrementAdults();

                                setState(
                                  () {},
                                );
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            child: Text(
                              '$selectedAdults',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 50,
                            width: 30,
                            child: FloatingActionButton(
                                tooltip: 'Decrement',
                                onPressed: () {
                                  _decrementAdults();
                                  setState(
                                    () {},
                                  );
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Children',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FloatingActionButton(
                              onPressed: () {
                                _incrementChildren();
                                setState(
                                  () {},
                                );
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            child: Text(
                              '$selectedChildren',
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FloatingActionButton(
                                tooltip: 'Decrement',
                                onPressed: () {
                                  _decrementChildren();
                                  setState(
                                    () {},
                                  );
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '0 - 17 Years old',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: Text('Cancel'),
                      // ),
                      Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xffff0844), Color(0xffffb199)]),
                            borderRadius: BorderRadius.circular(14)),
                        child: ElevatedButton(
                          onPressed: () {
                            // Do something with the selected values
                            // print('Selected Rooms: $selectedRooms');
                            // print('Selected Adults: $selectedAdults');
                            // print('Selected Children: $selectedChildren');
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: const Text(
                            'DONE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //
  }
  //
  //
  ///  /* Chekc-in And Chekc-Out Code */   //
  //

  /*   \\old Date rangePicker method//
  // late String _startDate, _endDate;
  // final DateRangePickerController _controller = DateRangePickerController();

  // @override
  // void initState() {
  //   final DateTime today = DateTime.now();
  //   _startDate = DateFormat('dd, MMM, yyyy').format(today).toString();
  //   _endDate = DateFormat('dd, MMM, yyyy')
  //       .format(today.add(Duration(days: 1)))
  //       .toString();
  //   _controller.selectedRange =
  //       PickerDateRange(today, today.add(Duration(days: 1)));
  //   super.initState();
  //   readText("");
  // }

  // void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   setState(() {
  //     _startDate =
  //         DateFormat('dd, MMM, yyyy').format(args.value.startDate).toString();
  //     _endDate = DateFormat('dd, MMM, yyyy')
  //         .format(args.value.endDate ?? args.value.startDate)
  //         .toString();
  //   });
  // }

  // void openDatePicker() async {
  //   final DateTimeRange? picked = await showDateRangePicker(
  //     context: context,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(DateTime.now().year + 2),
  //   );

  //   if (picked != null) {
  //     setState(() {
  //       _controller.selectedRange = PickerDateRange(
  //         picked.start,
  //         picked.end,
  //       );
  //     });
  //   }
  // } */
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 2));

  void openDatePicker() async {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now().subtract(const Duration(days: 30)),
      maximumDate: DateTime.now().add(const Duration(days: 30)),
      endDate: endDate,
      startDate: startDate,
      backgroundColor: Colors.white,
      primaryColor: Colors.blueAccent,
      onApplyClick: (start, end) {
        setState(() {
          startDate = start;
          endDate = end;
          saveDates();
        });
      },
      onCancelClick: () {
        setState(() {
          startDate = DateTime.now();
          endDate = DateTime.now().add(const Duration(days: 2));
        });
        // Call the saveDates method to update the saved values
        saveDates();
      },
    );
  }

  void readDates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Read startDate and endDate from SharedPreferences
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

    // Update the state if the saved values are not null
    if (savedStartDate != null && savedEndDate != null) {
      setState(() {
        startDate = savedStartDate;
        endDate = savedEndDate;
      });
    }
  }

  void saveDates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save startDate and endDate as milliseconds since epoch
    prefs.setInt("startDate", startDate.millisecondsSinceEpoch);
    prefs.setInt("endDate", endDate.millisecondsSinceEpoch);
  }

  TextEditingController controller = TextEditingController();

  void saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("text", text);
  }

  void readText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedValue = prefs.getString("text");
    if (savedValue != null) {
      controller.text = savedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: controller,
                onChanged: (value) {
                  saveText(value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  labelText: 'Find your desired stay',
                  labelStyle: const TextStyle(color: Colors.black54),
                  prefixStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),

            // const SearchBar(
            //   leading: Icon(Icons.search),
            //   trailing: [Icon(Icons.mic)],
            //   backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            //   shadowColor: MaterialStatePropertyAll(Colors.transparent),
            //   side: MaterialStatePropertyAll(
            //       BorderSide(color: const Color.fromARGB(255, 66, 65, 65))),
            //   hintText: 'Find your desired stay',
            //   hintStyle: MaterialStatePropertyAll(
            //       TextStyle(color: Colors.black54, fontSize: 15)),
            // ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: 59,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.black45),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Check-In | Check-Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: openDatePicker,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              height: 15,
                              width: 48,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  // '${DateFormat('dd-MMM').format(_controller.selectedRange!.startDate!)}',
                                  '${startDate != null ? DateFormat("dd-MMM").format(startDate) : DateFormat(" dd-MMM").format(DateTime.now())}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 58, 57, 57)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: openDatePicker,
                                child: const Icon(Icons.compare_arrows),
                              ),
                            ),
                            GestureDetector(
                              onTap: openDatePicker,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                height: 15,
                                width: 50,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    // '${DateFormat(' dd-MMM').format(_controller.selectedRange!.endDate ?? _controller.selectedRange!.startDate!)}',
                                    '${endDate != null ? DateFormat("dd-MMM").format(endDate) : DateFormat("dd-MMM").format(DateTime.now().add(const Duration(days: 2)))}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 58, 57, 57)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Container(
                  height: 59,
                  width: 159,
                  decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.black45),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: _showRoomBottomSheet,
                        child: Container(
                          padding: const EdgeInsets.only(left: 3),
                          constraints: const BoxConstraints(maxWidth: 152),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Image.asset(
                                  "asset/image/people.png",
                                  height: 19,
                                  width: 19,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text(
                                    //   '$selectedRooms RM,$selectedAdults AD,$selectedChildren CH',
                                    //   style: const TextStyle(
                                    //       color:
                                    //           Color.fromARGB(255, 58, 57, 57),
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 15),
                                    // ),
                                    Row(
                                      children: [
                                        Text(
                                          "$selectedRooms ${selectedRooms > 1 ? 'Rooms' : 'Room'}, $selectedAdults ${selectedAdults > 1 ? 'Adults' : 'Adult'}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 58, 57, 57),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "$selectedAdults ${selectedAdults > 1 ? 'Adults' : 'Adult'}",
                                    //       style: const TextStyle(
                                    //           color: Color.fromARGB(
                                    //               255, 58, 57, 57),
                                    //           fontWeight: FontWeight.bold,
                                    //           fontSize: 15),
                                    //     ),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Text(
                                          "$selectedChildren ${selectedChildren > 1 ? 'Children' : 'Child'}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 58, 57, 57),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            ////             OLD             ////////////////
            // Container(
            //   child: Center(
            //     child: Container(
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //             style: BorderStyle.solid, color: Colors.black45),
            //         color: Colors.transparent,
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       // width: 307,
            //       constraints: BoxConstraints(minWidth: 307, maxWidth: 355),
            //       child: Row(
            //         children: [
            //           IconButton(
            //             onPressed: openDatePicker,
            //             icon: Icon(Icons.calendar_month),
            //           ),
            //           GestureDetector(
            //             onTap: openDatePicker,
            //             child: Container(
            //               padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            //               height: 50,
            //               width: 49,
            //               child: SingleChildScrollView(
            //                 scrollDirection: Axis.horizontal,
            //                 child: Text(
            //                   // '${DateFormat('dd-MMM').format(_controller.selectedRange!.startDate!)}',
            //                   '${startDate != null ? DateFormat("dd-MMM").format(startDate) : DateFormat(" dd-MMM").format(DateTime.now())}',
            //                   style: const TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       color: Color.fromARGB(255, 58, 57, 57)),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const Icon(Icons.compare_arrows),
            //           // IconButton(
            //           //   onPressed: openDatePicker,
            //           //   icon: Icon(Icons.calendar_month),
            //           // ),
            //           GestureDetector(
            //             onTap: openDatePicker,
            //             child: Container(
            //               padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            //               height: 50,
            //               width: 50,
            //               child: SingleChildScrollView(
            //                 scrollDirection: Axis.horizontal,
            //                 child: Text(
            //                   // '${DateFormat(' dd-MMM').format(_controller.selectedRange!.endDate ?? _controller.selectedRange!.startDate!)}',
            //                   '${endDate != null ? DateFormat("dd-MMM").format(endDate) : DateFormat("dd-MMM").format(DateTime.now().add(Duration(days: 2)))}',
            //                   style: const TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       color: Color.fromARGB(255, 58, 57, 57)),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const Padding(
            //             padding: EdgeInsets.only(bottom: 3),
            //             child: Text(
            //               ' |',
            //               style: TextStyle(
            //                   fontSize: 24, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           TextButton(
            //             onPressed: _showRoomBottomSheet,
            //             child: Container(
            //               // width: 100,
            //               constraints: BoxConstraints(maxWidth: 110),
            //               child: SingleChildScrollView(
            //                 scrollDirection: Axis.horizontal,
            //                 child: Text(
            //                   '$selectedRooms Rooms,$selectedAdults Adults,$selectedChildren Children',
            //                   style: const TextStyle(
            //                       color: Color.fromARGB(255, 58, 57, 57),
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 17),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            ////     OLD     ////////
            const SizedBox(
              height: 12,
            ),
            Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffff0844),
                    Color(0xffffb199),
                  ],
                ),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SeeAllPage()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors
                        .transparent, /* padding: EdgeInsets.fromLTRB(92, 10, 92, 10) */
                  ),
                  child: const Text(
                    'SEARCH',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
