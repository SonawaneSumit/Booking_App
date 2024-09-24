import 'package:booking_app/screen/homeScreen/nearBylocation/seeAll/filters/range_slider.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/seeAll/seeAllPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class filters_page extends StatefulWidget {
  const filters_page({super.key});

  @override
  State<filters_page> createState() => _filters_page();
}

class _filters_page extends State<filters_page> {
  bool hotel = false;
  bool villa = false;
  bool resort = false;
  bool guestH = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        flexibleSpace: const SafeArea(
            child: Center(
          child: Text(
            "Filters",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 50,
        // color: Colors.black87,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffdfbfb),
              Color(0xffebedee),
            ],
          ),
        ),
        child: Column(
          children: [
            //
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      bool shouldClearSharedPreferences =
                          true; // Change this condition as needed

                      if (shouldClearSharedPreferences) {
                        clearSharedPreferences();
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => super.widget));
                      setState(() {});
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 9),
                    child: Container(
                      height: 45,
                      width: 110,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color(0xffff0844),
                            Color(0xffffb199),
                          ]),
                          borderRadius: BorderRadius.circular(12)),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SeeAllPage()));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: const FittedBox(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
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
      body: Column(
        children: [
          const range_Slider(),
          propType(hotel: hotel, villa: villa, resort: resort, guestH: guestH),
        ],
      ),
    );
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Clear the SharedPreferences values here
    prefs.clear();
  }
}

class propType extends StatelessWidget {
  const propType({
    super.key,
    required this.hotel,
    required this.villa,
    required this.resort,
    required this.guestH,
  });

  final bool hotel;
  final bool villa;
  final bool resort;
  final bool guestH;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 8),
              child: Text(
                "Property Type",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        CheckboxListTile(
          value: hotel,
          onChanged: (bool? value) {
            // setState(() {
            //   hotel = value!;
            // });
          },
          title: const Text('Hotel'),
        ),
        const Divider(height: 0),
        CheckboxListTile(
          value: villa,
          onChanged: (bool? value) {
            // setState(() {
            //   villa = value!;
            // });
          },
          title: const Text('Villa'),
        ),
        const Divider(height: 0),
        CheckboxListTile(
          value: resort,
          onChanged: (bool? value) {
            // setState(() {
            //   resort = value!;
            // });
          },
          title: const Text('Resort'),
          // subtitle: const Text(
          //     "Longer supporting text to demonstrate how the text wraps and how setting 'CheckboxListTile.isThreeLine = true' aligns the checkbox to the top vertically with the text."),
          // isThreeLine: true,
        ),
        const Divider(height: 0),
        CheckboxListTile(
          value: guestH,
          onChanged: (bool? value) {
            // setState(() {
            //   guestH = value!;
            // });
          },
          title: const Text('Guest House'),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
