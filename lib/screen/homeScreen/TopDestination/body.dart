import 'package:booking_app/loadingAnimation.dart';
import 'package:booking_app/model/topDestination.dart';
import 'package:flutter/material.dart';

class destinationBody extends StatefulWidget {
  const destinationBody({
    super.key,
    required this.destination,
  });
  final Destination destination;

  @override
  State<destinationBody> createState() => _destinationBody();
}

class _destinationBody extends State<destinationBody> {
  late bool _isLoading;

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: _isLoading
              ? ShimmerCircle()
              : Row(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        widget.destination.images[0],
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Added spacing between the image and text
                    // Display the destination name
                  ],
                ),
        ),
        Text(
          widget.destination.city,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 5, bottom: 4),
//               child: CircleAvatar(
//                 radius: 45,
//                 backgroundImage: AssetImage(
//                   'asset/image/Mumbai.jpg',
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Text('Mumbai'),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
