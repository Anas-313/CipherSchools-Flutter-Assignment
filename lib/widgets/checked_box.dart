import 'package:flutter/material.dart';

class CheckedBox extends StatefulWidget {
  const CheckedBox({super.key});

  @override
  State<CheckedBox> createState() => _CheckedBoxState();
}

class _CheckedBoxState extends State<CheckedBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Checkbox(
        checkColor: Colors.white,
        focusColor: Color(0xFF7F3DFF),
        side: const BorderSide(color: Color(0xFF7F3DFF), width: 1.5),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
