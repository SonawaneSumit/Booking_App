import 'package:booking_app/model/slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class sliderPage extends StatefulWidget {
  sliderPage({
    super.key,
    required this.Slider,
  });

  final slider Slider;

  @override
  State<sliderPage> createState() => _slider();
}

class _slider extends State<sliderPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(widget.Slider.image[0]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Brand\nExclusive",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Center(
                    //   child: Padding(
                    //     padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
                    //     child: Text(
                    //       'Neo QLED\n',
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold),
                    //       textDirection: TextDirection.rtl,
                    //     ),
                    //   ),
                    // ),
                    // Center(
                    //   child: Padding(
                    //     padding: EdgeInsets.fromLTRB(120, 15, 0, 0),
                    //     child: Text(
                    //       'Avail benifites Upto \u{20B9}${20000}*',
                    //       style: TextStyle(color: Colors.white, fontSize: 9),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(widget.Slider.image[1]),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: const Stack(
                //   children: [
                //     Center(
                //       child: Padding(
                //         padding: EdgeInsets.fromLTRB(0, 35, 210, 0),
                //         child: Text(
                //           'From \u{20B9}${79},${999}* | \u{20B9}${1000} Off',
                //           style: TextStyle(
                //               color: Colors.red,
                //               fontSize: 9,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(widget.Slider.image[2]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 90.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        DotsIndicator(
          dotsCount: widget.Slider.image.length,
          position: _currentIndex.toInt(),
          decorator: const DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.blue,
            size: Size.square(8.0),
            // activeSize: Size(16.0, 8.0),
            spacing: EdgeInsets.all(4.0),
          ),
        ),
      ],
    );
  }
}
