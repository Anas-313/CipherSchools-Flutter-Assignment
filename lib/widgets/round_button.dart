import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String btnName;
  final Color btnBackgroundColor;
  final Color btnTextColor;
  final Function()? onPressed;

  const RoundButton({
    super.key,
    required this.btnName,
    required this.btnBackgroundColor,
    required this.btnTextColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) => btnBackgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        onPressed: onPressed,
        child: Text(
          btnName,
          style: TextStyle(
            color: btnTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}

// const Color(0xFF7F3DFF)
