// ignore_for_file: file_names, camel_case_types

import 'package:booking_app/model/hotels.dart';
// import 'package:booking_app/model/slider.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/hotelPages/courtyardPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class hotelList extends StatefulWidget {
  const hotelList({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<hotelList> createState() => _hotelListState();
}

class _hotelListState extends State<hotelList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 250,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
                child: InkWell(
                  child: Image(
                    height: 150,
                    width: 200,
                    image: AssetImage(widget.hotel.images[0]),
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );

                    Future.delayed(const Duration(seconds: 1), () {
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
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // ignore: unnecessary_string_interpolations
                      "${widget.hotel.city}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      widget.hotel.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 17, color: Colors.orange),
                        Text(
                          ' 4.3 | 2487',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '\u{20B9}${NumberFormat("#,##0").format(widget.hotel.price)}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          '\u{20B9}${NumberFormat("#,##0").format(widget.hotel.disPrice)}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        const SizedBox(
          width: 7,
        ),
      ],
    );
  }
}
