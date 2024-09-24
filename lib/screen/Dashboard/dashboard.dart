// ignore_for_file: unused_import, camel_case_types

import 'package:booking_app/screen/Mytrip/myTrip.dart';
import 'package:booking_app/screen/homeScreen/home.dart';
import 'package:booking_app/screen/profileScreen/profileScreen.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:bottom_bar_matu/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking_app/screen/Wishlist/wishlisht.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Color primaryColor = Colors.grey;
  int _indexnumber = 0;

  final List<Widget> _pages = [
    const Home(),
    MyTrip(),
    const Wishlist(),
    const profileScreen(),
  ];

  void _ontapindex(int index) {
    setState(() {
      _indexnumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
        systemStatusBarContrastEnforced: false,
      ),
      child: Scaffold(
        body: IndexedStack(
          index: _indexnumber,
          children: _pages,
        ),
        bottomNavigationBar: BottomBarBubble(
          selectedIndex: _indexnumber,
          height: 50,
          color: const Color.fromARGB(255, 0, 140, 255),
          backgroundColor: Colors.black87,
          items: <BottomBarItem>[
            BottomBarItem(
              iconSize: 25,
              iconData: Icons.home,
              label: 'HOME',
              labelTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            BottomBarItem(
              iconSize: 25,
              iconData: Icons.luggage,
              label: 'My TRIP',
              labelTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            BottomBarItem(
              iconSize: 25,
              iconData: Icons.favorite,
              label: 'WISHLIST',
              labelTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            BottomBarItem(
              iconSize: 25,
              iconData: Icons.account_circle_outlined,
              label: 'PROFILE',
              labelTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ],
          onSelect: (index) {
            _ontapindex(index);
            // Drawer();
          },

          /* const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.travel_explore,
                  color: Colors.green,
                ),
                label: 'MyTrip'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.blueGrey,
                ),
                label: 'Profile'),
          ], */
        ),
      ),
    );
  }
}
