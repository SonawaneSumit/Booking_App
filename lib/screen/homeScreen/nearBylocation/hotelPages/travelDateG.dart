// import 'package:booking_app/selectDate.dart';
// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class travelDateG extends StatefulWidget {
  travelDateG({
    Key? key,
    // required this.endDate,
    // required this.startDate,
  }) : super(key: key);

  // DateTime? endDate;
  // DateTime? startDate;

  @override
  State<travelDateG> createState() => _travelDateGState();
}

class _travelDateGState extends State<travelDateG> {
  int selectedRooms = 01;
  int selectedAdults = 01;
  int selectedChildren = 00;

  @override
  void initState() {
    super.initState();
    loadGuestValues();
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
    setState(() {});
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
    });
  }

  void _decrementCounter() {
    setState(() {
      if (selectedRooms > 1) {
        selectedRooms--;
      }
    });
  }

  void _incrementAdults() {
    setState(() {
      selectedAdults++;
    });
  }

  void _decrementAdults() {
    setState(() {
      if (selectedAdults > 1) {
        selectedAdults--;
      }
    });
  }

  void _incrementChildren() {
    setState(() {
      selectedChildren++;
    });
  }

  void _decrementChildren() {
    setState(() {
      if (selectedChildren > 0) {
        selectedChildren--;
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.grey.shade100),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Container(
              padding: EdgeInsets.all(16.0),
              height: 310,
              child: Column(
                children: <Widget>[
                  Text(
                    'Select Rooms and Guests',
                    style: GoogleFonts.kanit(fontSize: 20),
                  ),
                  Divider(
                    thickness: 2.5,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
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
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            child: Text(
                              '$selectedRooms',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
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
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
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
                              style: TextStyle(
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
                  SizedBox(height: 10),
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
                              style: TextStyle(
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
                                child: Icon(
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
                  SizedBox(height: 17),
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
                            gradient: LinearGradient(
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
                          child: Text(
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
          saveDate();
        });
      },
      onCancelClick: () {
        setState(() {
          startDate = DateTime.now();
          endDate = DateTime.now().add(const Duration(days: 2));
        });
        // Call the saveDates method to update the saved values
        saveDate();
      },
    );
  }

  void saveDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save startDate and endDate as milliseconds since epoch
    prefs.setInt("startDate", startDate.millisecondsSinceEpoch);
    prefs.setInt("endDate", endDate.millisecondsSinceEpoch);
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(
                'Travel Date & Guests',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 9,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                ),
                height: 50,
                width: 125,
                child: InkWell(
                  onTap: () async {
                    showCustomDateRangePicker(
                      context,
                      dismissible: true,
                      minimumDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      maximumDate: DateTime.now().add(const Duration(days: 30)),
                      endDate: endDate,
                      startDate: startDate,
                      backgroundColor: Colors.white,
                      primaryColor: Colors.blueAccent,
                      onApplyClick: (start, end) {
                        setState(() {
                          startDate = start;
                          endDate = end;
                        });
                      },
                      onCancelClick: () {
                        setState(() {});
                      },
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      // InkWell(
                      //   child: Icon(Icons.calendar_month),

                      //   // onTap: () {
                      //   //   Navigator.push(
                      //   //       context,
                      //   //       MaterialPageRoute(
                      //   //         builder: (context) => selectDate
                      //   //             .openDatePicker(context),
                      //   //       ));
                      //   // },
                      // ),
                      Text(
                        '${startDate != null ? DateFormat("dd,MMM").format(startDate) : DateFormat(" dd,MMM").format(DateTime.now())} / ${endDate != null ? DateFormat("dd,MMM").format(endDate) : DateFormat("dd,MMM").format(DateTime.now().add(Duration(days: 1)))}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade300,
              ),
              height: 50,
              width: 165,
              child: InkWell(
                onTap: _showRoomBottomSheet,
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    // InkWell(
                    //   child: Icon(Icons.calendar_month),

                    //   // onTap: () {
                    //   //   Navigator.push(
                    //   //       context,
                    //   //       MaterialPageRoute(
                    //   //         builder: (context) => selectDate
                    //   //             .openDatePicker(context),
                    //   //       ));
                    //   // },
                    // ),
                    Text(
                      '$selectedRooms Room,$selectedAdults Adult,$selectedChildren Child',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 15),
            //   child: Container(
            //     height: 50,
            //     width: 120,
            //     color: Colors.grey,
            //     child: Row(
            //       children: [
            //         InkWell(
            //           child: const Icon(Icons.calendar_month),
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => MyHomePage(),
            //                 ));
            //           },

            //           // onTap: () {
            //           //   Navigator.push(
            //           //       context,
            //           //       MaterialPageRoute(
            //           //         builder: (context) => selectDate
            //           //             .openDatePicker(context),
            //           //       ));
            //           // },
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
        SizedBox(
          height: 9,
        ),
        const Divider(
          thickness: 2,
          color: Colors.grey,
        ),
        Row(
          children: [
            Title(
              color: Colors.black,
              child: Text(
                "Amenities",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 9,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("asset/image/swimming.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        child: Text(
                          'Swimming\n     Pool',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  //
                  //
                  // SizedBox(
                  //   width: 18,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              "asset/image/spa.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: Text(
                            'Spa',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 18,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("asset/image/restaurant.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: Text(
                            'Restaurant',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 18,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("asset/image/table tennis.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: Text(
                            'Indoor\nGames',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              "10+",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: Colors.grey,
        ),
        Column(
          children: [
            Row(
              children: [
                Title(
                  color: Colors.black,
                  child: Text(
                    "Property Rules & Information",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text(
                  "Check-In:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 14),
                ),
                Text(" 2 PM"),
                Text(
                  "  |  ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Check-Out:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 14),
                ),
                Text(" 12 PM"),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "asset/image/Dot.png",
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      width: 310,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: Text(
                          "Guest below 18 years of age are not allowed at the property.",
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          maxLines: 3,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "asset/image/Dot.png",
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      width: 310,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: Text(
                          "Passport, Aadhar and Driving Licence are accepted as ID proof(s)",
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          maxLines: 3,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "asset/image/Dot.png",
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      width: 310,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: Text(
                          "Pets are not allowed",
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          maxLines: 3,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
