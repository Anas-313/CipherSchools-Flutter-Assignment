import 'package:flutter/material.dart';

class SelectCalender extends StatefulWidget {
  const SelectCalender({super.key});

  @override
  State<SelectCalender> createState() => _SelectCalenderState();
}

class _SelectCalenderState extends State<SelectCalender> {
  String selectedMonth = 'January'; // Default selected month

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Image(
        image: AssetImage('assets/images/arrow_down.png'),
      ),
      value: selectedMonth,
      onChanged: (String? newValue) {
        setState(() {
          selectedMonth = newValue!;
        });
      },
      items: <String>[
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
