// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class range_Slider extends StatefulWidget {
  const range_Slider({
    super.key,
  });

  @override
  State<range_Slider> createState() => _range_SliderState();
}

class _range_SliderState extends State<range_Slider> {
  double _startValue = 500.0;
  double _endValue = 50000.0;

  @override
  void initState() {
    super.initState();
    _loadSliderValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 8),
              child: Text(
                "Price (for 1 night)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\u{20B9}${_formatValue(_startValue)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('\u{20B9}${_formatValue(_endValue)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 5,
            activeTrackColor: Colors.blue,
            inactiveTrackColor: Color.fromARGB(255, 182, 200, 230),
            disabledActiveTrackColor: Colors.grey,
            thumbColor: Colors.blueGrey,
            rangeThumbShape: RoundRangeSliderThumbShape(
              enabledThumbRadius: 10,
            ),
          ),
          child: RangeSlider(
            values: RangeValues(_startValue, _endValue),
            onChanged: (RangeValues values) {
              setState(() {
                _startValue =
                    values.start.roundToDouble().clamp(500.0, double.infinity);
                _endValue = values.end
                    .roundToDouble()
                    .clamp(_startValue, double.infinity);
                _saveSliderValues();
                _printSavedValues();
                // _startValue = values.start;
                // _endValue = values.end;
              });
            },
            min: 500,
            max: 50000,
            divisions: 100,
            // activeColor: Colors.blue,
            // inactiveColor: Colors.blueAccent.shade100,
            overlayColor: MaterialStateProperty.all(Colors.white),
            labels: RangeLabels(
              _formatValue(_startValue),
              '${_formatValue(_endValue)}',
            ),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }

  String _formatValue(double value) {
    // Use NumberFormat to format the value with commas
    final formatter = NumberFormat('#,###');
    return formatter.format(value);
  }

  void _loadSliderValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _startValue = prefs.getDouble('startValue') ?? 500.0;
      _endValue = prefs.getDouble('endValue') ?? 50000.0;
    });
  }

  void _saveSliderValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('startValue', _startValue);
    prefs.setDouble('endValue', _endValue);
    print('Slider values saved: $_startValue - $_endValue');
  }

  void _printSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double startValue = prefs.getDouble('startValue') ?? 0.0;
    double endValue = prefs.getDouble('endValue') ?? 0.0;
    print('Start Value: $startValue, End Value: $endValue');
  }

  // @override
  // void dispose() {
  //   _saveSliderValues(); // Save values when the widget is disposed
  //   super.dispose();
  // }

  // ... (Your existing methods remain the same)
}
