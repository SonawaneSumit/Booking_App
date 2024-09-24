// ignore_for_file: unused_import

import 'package:booking_app/model/slider.dart';
import 'package:booking_app/screen/homeScreen/SearchBar/uptoRooms.dart';
import 'package:booking_app/screen/homeScreen/carousel/carousel_Slider.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/body.dart';
import 'package:booking_app/screen/homeScreen/TopDestination/topDestination.dart';
import 'package:flutter/material.dart';
import 'groupDeal.dart';
import 'hourlyStay.dart';

class searchBar extends StatefulWidget {
  searchBar({
    super.key,
  });

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  final List<Tab> tabs = [
    const Tab(text: 'Up to 4 Rooms'),
    const Tab(text: 'Group Deals'),
    // Tab(text: 'Hourly Stays'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: tabs.length,
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 5, 12, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TabBar(
                          tabs: tabs,
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          indicatorPadding: EdgeInsets.all(10),
                          labelPadding: const EdgeInsets.only(
                              left: 11, right: 11, top: 5),
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        //  const SizedBox(height: 0),
                        SingleChildScrollView(
                          child: Container(
                            height: 190,
                            color: Colors
                                .transparent, // Adjust the height as needed
                            child: const TabBarView(
                              children: [
                                // Up to 4 Rooms Tab
                                uptoRooms(),

                                // Check-in Tab
                                groupDeal(),

                                // Check-out Tab
                                // hourlyStays(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                // const slider(),
                ...List.generate(imagesSet.length,
                    (index) => sliderPage(Slider: imagesSet[index])),
                const SizedBox(
                  height: 9,
                ),
                destination(),

                nearBy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
