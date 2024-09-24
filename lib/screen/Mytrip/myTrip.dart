// import 'package:intl/intl.dart';

import 'package:booking_app/screen/Mytrip/cancel.dart';
import 'package:booking_app/screen/Mytrip/complete.dart';
import 'package:booking_app/screen/Mytrip/unsuccesful.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  // ignore: non_constant_identifier_names
  final List<Tab> Tabs = [
    const Tab(text: 'CANCELLED'),
    const Tab(text: 'COMPLETED'),
    const Tab(text: 'UNSUCCESFUL'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          flexibleSpace: SafeArea(
              child: Row(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Text(
                    'My Trips',
                    style: GoogleFonts.mooli(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
            ],
          )),
        ),
        body: DefaultTabController(
            length: Tabs.length,
            child: Column(
              children: [
                TabBar(
                  tabs: Tabs,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: const TextStyle(fontSize: 14),
                  isScrollable: true,
                  indicatorColor: Colors.blue,
                  indicatorWeight: 3.0,
                ),
                const Expanded(
                    child: TabBarView(children: [
                  Cancel(),
                  Complete(),
                  unSuccesful(),
                ]))
              ],
            )));
  }
}
