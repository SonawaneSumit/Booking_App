// ignore_for_file: unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:google_fonts/google_fonts.dart';

class groupDeal extends StatefulWidget {
  const groupDeal({
    super.key,
  });

  @override
  State<groupDeal> createState() => _groupDeal();
}

class _groupDeal extends State<groupDeal> {
  int selectedRooms = 01;
  int selectedAdults = 01;
  int selectedChildren = 00;

  void _updateGuests() {
    // Custom method to update adults and children based on selected rooms
    // You can customize this logic based on your requirements
    selectedAdults = selectedRooms;
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
  //
  //
  ///  /* Chekc-in And Chekc-Out Code */   //
  //

  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd, MMM, yyyy').format(today).toString();
    _endDate = DateFormat('dd, MMM, yyyy')
        .format(today.add(Duration(days: 1)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 1)));
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('dd, MMM, yyyy').format(args.value.startDate).toString();
      _endDate = DateFormat('dd, MMM, yyyy')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
  }

  void openDatePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );

    if (picked != null) {
      setState(() {
        _controller.selectedRange = PickerDateRange(
          picked.start,
          picked.end,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
        child: Column(
          children: [
            //
            //
            // SizedBox(
            //   height: 50,
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       prefixIcon: const Icon(
            //         Icons.search,
            //         color: Colors.black38,
            //       ),
            //       labelText: 'Find your desired stay',
            //       labelStyle: const TextStyle(color: Colors.black87),
            //       prefixStyle: const TextStyle(color: Colors.black26),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       floatingLabelBehavior: FloatingLabelBehavior.always,
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15),
            //         borderSide: const BorderSide(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),
//
//
//
            const SearchBar(
              leading: Icon(Icons.search),
              trailing: [Icon(Icons.mic)],
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              shadowColor: MaterialStatePropertyAll(Colors.transparent),
              side: MaterialStatePropertyAll(
                  BorderSide(color: const Color.fromARGB(255, 66, 65, 65))),
              hintText: 'Find your desired stay',
              hintStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.black54, fontSize: 15)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.black45),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 307,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: openDatePicker,
                        icon: Icon(Icons.calendar_month),
                      ),
                      GestureDetector(
                        onTap: openDatePicker,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          height: 50,
                          width: 49,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${DateFormat('dd-MMM').format(_controller.selectedRange!.startDate!)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 58, 57, 57)),
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.compare_arrows),
                      // IconButton(
                      //   onPressed: openDatePicker,
                      //   icon: Icon(Icons.calendar_month),
                      // ),
                      GestureDetector(
                        onTap: openDatePicker,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          height: 50,
                          width: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${DateFormat(' dd-MMM').format(_controller.selectedRange!.endDate ?? _controller.selectedRange!.startDate!)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 58, 57, 57)),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Text(
                          '|',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                          onPressed: _showRoomBottomSheet,
                          child: Container(
                            width: 100,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '$selectedRooms Rooms,$selectedAdults Adults,$selectedChildren Children',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 58, 57, 57),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
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
                  onPressed: () {},
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
