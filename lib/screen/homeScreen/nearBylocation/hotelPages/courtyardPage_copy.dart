// ignore_for_file: unused_import, unused_field

import 'package:booking_app/model/hotels.dart';
import 'package:booking_app/loadingAnimation.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/checkOut.dart/checkOut_Page.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/travelDateG.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';

class courtyardPage extends StatefulWidget {
  courtyardPage({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  State<courtyardPage> createState() => _courtyardPage();
}

class _courtyardPage extends State<courtyardPage> {
  Color iconColor = Colors.white;
  bool isReadMore = false;
  DateTime? startDate;
  DateTime? endDate;
  late bool _isLoading;
  //

  final DateRangePickerController _controller = DateRangePickerController();

  void _toggleIconColor() {
    setState(() {
      // If the current color is black, change it to red, otherwise change it to black
      iconColor = (iconColor == Colors.white) ? Colors.red : Colors.white;
    });
  }

  _launchURL() async {
    Uri _url = Uri.parse(widget.hotel.location);
    // ignore: unnecessary_null_comparison
    if (_url != null && await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      print('Invalid URL: $_url');
    }
  }

  double taxvalueSaved() {
    double printTaxValue = 0.18 * widget.hotel.disPrice;
    return printTaxValue;
  }

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              _toggleIconColor();
            },
            icon: Icon(
              Icons.favorite_rounded,
              color: iconColor,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 50,
        // color: Colors.black87,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff29323c),
              Color(0xff485563),
            ],
          ),
        ),
        child: _isLoading
            ? const rowShimmer()
            : Column(
                children: [
                  //
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text:
                                '\u{20B9} ${NumberFormat("#,##0").format(widget.hotel.disPrice)}\n',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            children: [
                              TextSpan(
                                  text:
                                      "+ \u{20B9} ${taxvalueSaved()} taxes & service fees \nPer Night(2 Adults)",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, right: 9),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xffff0844),
                                  Color(0xffffb199),
                                ]),
                                borderRadius: BorderRadius.circular(12)),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        checkOutPage(hotel: widget.hotel),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: Text('SELECT ROOM'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 35, 8, 0),
          child: _isLoading
              ? ShimmerWidget()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      /*  */
                      //ClipRRect use when you use CarouselSlider Widget//
                      /*  */
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: CarouselSlider(
                            items: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Image.asset(widget.hotel.images[0],
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Image.asset(widget.hotel.images[1],
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Image.asset(widget.hotel.images[2],
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Image.asset(widget.hotel.images[3],
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 350,
                              enlargeCenterPage: false,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 1.2,
                            )),
                      ),
                      // child: Stack(
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             Padding(
                      //               padding:
                      //                   EdgeInsets.only(top: 290, right: 9),
                      //               child: TextButton(
                      //                 onPressed: () {},
                      //                 style: TextButton.styleFrom(
                      //                   backgroundColor: Colors.black45,
                      //                 ),
                      //                 child: const Text(
                      //                   '+4 Images',
                      //                   style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Text(
                                widget.hotel.title,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  const Icon(Icons.star, size: 10),
                                  const Icon(Icons.star, size: 10),
                                  const Icon(Icons.star, size: 10),
                                  const Icon(Icons.star, size: 10),
                                  const Icon(Icons.star, size: 10),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blueAccent,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: InkWell(
                                    child: Image.asset(
                                      'asset/image/locationSmall.png',
                                      height: 27,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: _launchURL,
                                      child: Text.rich(
                                        TextSpan(
                                            text: widget.hotel.address,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                            children: const [
                                              TextSpan(
                                                  text: '\nView on map',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 9)),
                                            ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    const Icon(
                                      Icons.location_city,
                                      color: Colors.blueAccent,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              height: 22,
                              thickness: 2,
                              color: Colors.grey.shade400,
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text(
                                    'Description :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 0),
                                  child: Text(
                                    widget.hotel.description,
                                    // maxLines: 3,
                                    maxLines: isReadMore ? 15 : 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isReadMore = !isReadMore;
                                      });
                                    },
                                    child: Text(
                                      isReadMore ? "Read less" : "Read more",
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.grey,
                            ),
                            travelDateG(
                                /* endDate: endDate, startDate: startDate */)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
