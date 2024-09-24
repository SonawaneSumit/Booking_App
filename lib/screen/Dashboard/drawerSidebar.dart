// ignore_for_file: camel_case_types, file_names

import 'package:booking_app/screen/Dashboard/dashboard.dart';
import 'package:booking_app/screen/Mytrip/myTrip.dart';
import 'package:booking_app/screen/Wishlist/wishlisht.dart';
import 'package:booking_app/screen/profileScreen/profileScreen.dart';
import 'package:flutter/material.dart';

class drawerSideBar extends StatelessWidget {
  const drawerSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: Drawer(
        width: 230,
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff89f7fe), Color(0xff66a6ff)])),
              child: Stack(
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("asset/image/manAvatar.png"),
                      radius: 60,
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 118,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              "Sumit Sonawane",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.blue,
                              size: 25,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => dashboard(),
                                    ));
                              },
                              child: Text(
                                'HOME',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.travel_explore,
                              color: Colors.green,
                              size: 25,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyTrip(),
                                    ));
                              },
                              child: Text(
                                'EXPLORE',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_outlined,
                              size: 25,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (Context) => Wishlist(),
                                  ),
                                );
                              },
                              child: const Text(
                                'WISHLIST',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "asset/image/profile.png",
                              height: 26,
                              width: 26,
                            ),
                            // Icon(
                            //   Icons.account_circle_outlined,
                            //   color: Colors.black,
                            // ),
                            const SizedBox(
                              width: 9,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const profileScreen()),
                                );
                              },
                              child: const Text(
                                'PROFILE',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 190,
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(0.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           InkWell(
            //               onTap: () {
            //                 Navigator.pop(context);
            //               },
            //               child:
            //                   // Text(
            //                   //   'BACK',
            //                   //   style: TextStyle(
            //                   //       fontWeight: FontWeight.w700, fontSize: 17),
            //                   // ),
            //                   Icon(
            //                 Icons.arrow_back,
            //                 size: 30,
            //               )
            //               ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
