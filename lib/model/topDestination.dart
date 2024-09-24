// ignore: unused_import
import 'package:flutter/material.dart';

class Destination {
  final int id;
  final List<String> images;
  final String city;

  Destination({
    required this.id,
    required this.images,
    required this.city,
  });
}

List<Destination> destinationset = [
  Destination(
    id: 1,
    images: ["asset/image/Mumbai.jpg"],
    city: "Mumbai",
  ),
  Destination(
    id: 2,
    images: ["asset/image/Delhi.jpg"],
    city: "Delhi",
  ),
  Destination(
    id: 3,
    images: ["asset/image/Goa.jpg"],
    city: "Goa",
  ),
  Destination(
    id: 4,
    images: ["asset/image/Hyderabad.jpg"],
    city: "Hyderabad",
  ),
  Destination(
    id: 5,
    images: ["asset/image/bangalore.jpg"],
    city: "Bangalore",
  ),
];
