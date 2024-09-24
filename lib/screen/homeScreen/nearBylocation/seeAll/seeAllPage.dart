// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:booking_app/model/hotels.dart';
import 'package:booking_app/screen/Dashboard/dashboard.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/seeAll/filters/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'courtyard.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPage();
}

class _SeeAllPage extends State<SeeAllPage> {
  TextEditingController searchController = TextEditingController();
  Color iconColor = Colors.white;
  String searchQuery = '';
  double _startValue = 500.0;
  double _endValue = 50000.0;

  List<Hotel> newDataList = List.from(demoProducts);

  @override
  void initState() {
    super.initState();
    readsText();
    // _saveSliderValues();
    _loadSliderValues(); // Load slider values when the widget initializes
  }

  void readsText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedValue = prefs.getString("text");
    if (savedValue != null) {
      setState(() {
        searchQuery = savedValue;
        searchController.text = savedValue;
        onSearch(savedValue);
      });
    }
  }

  void _loadSliderValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? startValue = prefs.getDouble('startValue');
    double? endValue = prefs.getDouble('endValue');

    if (startValue != null && endValue != null) {
      setState(() {
        _startValue = startValue;
        _endValue = endValue;
      });
      onSearch(searchQuery); // Update the hotel list based on slider values
    }
  }

  void _saveSliderValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('startValue', _startValue);
    prefs.setDouble('endValue', _endValue);
  }

  onSearch(String value) {
    setState(() {
      searchQuery = value;
      newDataList = demoProducts
          .where((hotel) =>
              hotel.city.toLowerCase().contains(value.toLowerCase()) &&
              hotel.disPrice >= _startValue &&
              hotel.disPrice <= _endValue)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 9, bottom: 7),
                    child: SizedBox(
                      height: 45,
                      width: 299,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 9,
                          right: 9,
                        ),
                        child: TextFormField(
                          // enabled: false,
                          onChanged: onSearch,
                          controller: searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 11),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "Search",
                            hintText: "Start typing here",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: IconButton(
                              onPressed: () {
                                // Navigator.of(context);
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => uptoRooms()),
                                //     (route) => false);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => dashboard()));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => filters_page()),
                        );
                      },
                      icon: Icon(Icons.tune)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            if (newDataList.isEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "asset/image/notFound.png",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      ' No result Found for "$searchQuery"',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ...List.generate(newDataList.length,
                (index) => courtyard(hotel: newDataList[index])),
            SizedBox(
              height: 7,
            ),
          ],
        ),
      ),
    );
  }
}
