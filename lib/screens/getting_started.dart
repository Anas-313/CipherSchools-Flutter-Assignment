import 'package:expense_tracking_app/screens/auth/signin_screen.dart';
import 'package:expense_tracking_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

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
          Positioned(
            top: mq.height * .07,
            left: mq.width * .05,
            child: const Image(
              image: AssetImage('assets/images/Vector.png'),
              height: 60,
              width: 60,
            ),
          ),
          Positioned(
            bottom: mq.height * .09,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Welcome to ',
                            style: TextStyle(
                              fontFamily: 'ABeZee',
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'CipherX.',
                            style: TextStyle(
                              fontFamily: 'Bruno Ace',
                              fontSize: 36,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: mq.width * .10),
                      Column(
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: const Color(0xFFD1C1E9),
                              child:
                                  SvgPicture.asset('assets/images/Vector.svg'),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignInScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'The best way to track your expenses.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'ABeeZee'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
