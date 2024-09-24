import 'package:flutter/material.dart';

class hourlyStays extends StatelessWidget {
  const hourlyStays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: 'Find your desired stay',
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }
}
