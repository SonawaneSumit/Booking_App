import 'package:booking_app/screen/Dashboard/dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Text(
                    "Wishlist",
                    style: GoogleFonts.mooli(
                        fontWeight: FontWeight.bold, fontSize: 17),
                    // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: DottedBorder(
                  strokeWidth: 1,
                  color: Colors.grey.shade700,
                  child: Center(
                    child: Image.asset(
                      "asset/image/heart.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Title(
                    color: Colors.black,
                    child: const Text(
                      "Nothing Saved Yet",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "While exploring, tap on heart icon to wishlist your favourite hotel",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 45,
              width: 145,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffff0844),
                    Color(0xffffb199),
                  ]),
                  borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dashboard()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: const FittedBox(
                  child: Text(
                    'Start Exploring',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
