// ignore_for_file: unused_import

import 'package:booking_app/screen/Dashboard/drawerSidebar.dart';
import 'package:booking_app/screen/homeScreen/carousel/carousel_Slider.dart';
import 'package:flutter/material.dart';
import 'SearchBar/searchBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: unused_field
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: Builder(builder: (context) {
            {
              return IconButton(
                icon: Image.asset('asset/image/menu.png'),
                color: Colors.red,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }
          }),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'asset/image/alert2.png',
                height: 22,
                width: 22,
              ),
            ),
          ],
          title: Text(
            'Booking App',
            style: GoogleFonts.mooli(
                color: Colors.red, fontWeight: FontWeight.bold),
          )),
      body: Container(
        child: searchBar(),
      ),
      drawer: drawerSideBar(),
    );
  }
}
