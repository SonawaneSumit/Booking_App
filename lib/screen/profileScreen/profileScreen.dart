import 'package:booking_app/screen/Dashboard/drawerSidebar.dart';
import 'package:booking_app/screen/LoginPage/Login_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff89f7fe), Color(0xff66a6ff)])),
              height: 230,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("asset/image/manAvatar.png"),
                        radius: 65,
                      ),
                      Positioned(
                        bottom: -10,
                        left: 75,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              width: 290,
              child: Padding(
                padding: EdgeInsets.only(left: 0),
                child: Row(
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              width: 290,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.grey.shade200),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      '   Sumit Sonawane',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              width: 290,
              child: const Padding(
                padding: EdgeInsets.only(left: 0),
                child: Row(
                  children: [
                    Text(
                      'Mobile Number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              width: 290,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.grey.shade200),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    Icon(Icons.call),
                    Text(
                      '   +91 9139917517',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              width: 290,
              child: const Padding(
                padding: EdgeInsets.only(left: 0),
                child: Row(
                  children: [
                    Text(
                      'Email ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              width: 290,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.grey.shade200),
              child: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    Icon(Icons.email),
                    Text(
                      '   sumitsonawane@gmail.com',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffff0844),
                    Color(0xffffb199),
                  ]),
                  borderRadius: BorderRadius.circular(12)),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (contex) => login_page()));
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text('Please Confirm'),
                          content:
                              const Text('Are you sure,do you want to logout?'),
                          actions: [
                            // The "Yes" button
                            TextButton(
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) => login_page()));
                                },
                                child: const Text('Yes')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'))
                          ],
                        );
                      });
                },
                child: Text('LOG OUT'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
              ),
            ),
          ],
        ),
      ),
      drawer: const drawerSideBar(),
    );
  }
}
