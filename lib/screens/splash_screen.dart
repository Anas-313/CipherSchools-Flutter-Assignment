import 'dart:async';

import 'package:expense_tracking_app/screens/getting_started.dart';
import 'package:expense_tracking_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const GettingStarted(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Image(
              height: 200,
              width: 200,
              image: AssetImage('assets/images/recordcircle_top.png'),
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Image(
              height: 200,
              width: 200,
              image: AssetImage('assets/images/recordcircle_bottom.png'),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/images/Vector.png'),
                ),
              ),
              Text(
                'CiperX',
                style: TextStyle(
                  fontFamily: 'Bruno Ace',
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: mq.height * .06,
            left: mq.width * 0.25,
            child: const Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Cambay', fontSize: 15),
                ),
                Row(
                  children: [
                    Text('Open Source',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cambay',
                            fontSize: 15)),
                    Text(
                      ' Community',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Cambay',
                          fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
