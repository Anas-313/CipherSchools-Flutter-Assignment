import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function()? onPressed;

  const RoundIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            side: MaterialStateProperty.all(
                const BorderSide(color: Color(0xFFDDDDEF))),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        onPressed: onPressed,
        icon: const Image(
          image: AssetImage('assets/images/flat-icons_google.png'),
        ),
        label: const Text(
          'Sign Up with Google',
          style: TextStyle(
            color: Color(0xFF212325),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
