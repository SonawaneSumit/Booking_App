// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:booking_app/model/hotels.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/courtyardPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
// import 'package:booking_app/model/hotels.dart';

class courtyard extends StatefulWidget {
  const courtyard({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  State<courtyard> createState() => _courtyardState();
}

class _courtyardState extends State<courtyard> {
  Color iconColor = Colors.white;
  bool flag = true;

  // Function to toggle the icon color
  void _toggleIconColor() {
    setState(() {
      // If the current color is black, change it to red, otherwise change it to black
      iconColor = (iconColor == Colors.white) ? Colors.red : Colors.white;
    });
  }

  double taxSavedValue() {
    double taxValue = 0.18 * widget.hotel.disPrice;
    return taxValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            height: 300,
            width: 325,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.grey.shade100,
            ),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );

                Future.delayed(Duration(seconds: 1), () {
                  // List.generate(demoProducts.length,
                  //     (index) => courtyardPage(hotel: demoProducts[index]));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => courtyardPage(hotel: widget.hotel),
                    ),
                  );
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                    child: CarouselSlider(
                      items: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );

                            Future.delayed(Duration(seconds: 1), () {
                              // List.generate(demoProducts.length,
                              //     (index) => courtyardPage(hotel: demoProducts[index]));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      courtyardPage(hotel: widget.hotel),
                                ),
                              );
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),

                              // image:  DecorationImage(
                              //     image: demoProducts[0].images[0],
                              //     fit: BoxFit.cover),
                            ),
                            child: Image.asset(widget.hotel.images[0],
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),

                            // image:  DecorationImage(
                            //     image: demoProducts[0].images[0],
                            //     fit: BoxFit.cover),
                          ),
                          child: Image.asset(widget.hotel.images[1],
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),

                            // image:  DecorationImage(
                            //     image: demoProducts[0].images[0],
                            //     fit: BoxFit.cover),
                          ),
                          child: Image.asset(widget.hotel.images[2],
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),

                            // image:  DecorationImage(
                            //     image: demoProducts[0].images[0],
                            //     fit: BoxFit.cover),
                          ),
                          child: Image.asset(widget.hotel.images[3],
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 170.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.hotel.city}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.hotel.title}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 9),
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: iconColor,
                                  size: 26,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black45,
                                      blurRadius: 19,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                _toggleIconColor();
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 17, color: Colors.orange),
                            Text(
                              ' 4.3 | 2487',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "\u{20B9}${NumberFormat("#,##0").format(widget.hotel.price)}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "\u{20B9}${NumberFormat("#,##0").format(widget.hotel.disPrice)}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),

                            // Row(
                            //   children: [
                            //     IconButton(
                            //       icon: Icon(
                            //         Icons.favorite_rounded,
                            //         color: iconColor,
                            //         size: 24,
                            //         shadows: [
                            //           Shadow(
                            //             color: Colors.black45,
                            //             blurRadius: 19,
                            //           )
                            //         ],
                            //       ),
                            //       highlightColor: Colors.redAccent,
                            //       onPressed: () {
                            //         _toggleIconColor();
                            //       },
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                // SizedBox(
                                //   width: 5,
                                // ),
                                Text(
                                    '+ \u{20B9} ${taxSavedValue()} Taxes & fees \nPer Night',
                                    style:
                                        Theme.of(context).textTheme.bodySmall)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
