import 'package:booking_app/model/topDestination.dart';
import 'package:booking_app/screen/homeScreen/TopDestination/body.dart';
import 'package:flutter/material.dart';

class destination extends StatelessWidget {
  const destination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Top destinations in India",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            ...List.generate(
              destinationset.length,
              (index) => destinationBody(destination: destinationset[index]),
            ),
          ]),
        )
      ],
    );
  }
}




//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Top destinations in India",
//               style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),

//         ...List.generate(destinationset.length,
//             (index) => destinationBody(destination: destinationset[index]))
//         // destinationBody(),
//       ],
//     );
//   }
// }

// 