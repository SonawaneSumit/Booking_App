import 'package:flutter/material.dart';

class unSuccesful extends StatefulWidget {
  const unSuccesful({super.key});

  @override
  State<unSuccesful> createState() => _unSuccesful();
}

class _unSuccesful extends State<unSuccesful> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/image/luggage3.png',
                height: 50,
                width: 50,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You've no Failed bookings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text(
                      "All updates regarding your failed requests are displayed here",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
