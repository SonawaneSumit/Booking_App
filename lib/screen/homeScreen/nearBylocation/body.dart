// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:booking_app/screen/Wishlist/wishlisht.dart';
import 'package:booking_app/model/hotels.dart';
import 'package:booking_app/screen/homeScreen/nearBylocation/seeAll/seeAllPage.dart';
import 'package:flutter/material.dart';
import 'hotelList.dart';

class nearBy extends StatelessWidget {
  const nearBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearby your location',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                InkWell(
                  child: Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeAllPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(/* demoProducts.length, */ 4,
                    (index) => hotelList(hotel: demoProducts[index])),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
