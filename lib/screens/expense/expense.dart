import 'package:expense_tracking_app/utils/theme_text.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../widgets/round_button.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
          onPressed: null,
        ),
        backgroundColor: const Color(0xFF0077FF),
        centerTitle: true,
        title: const Text(
          'Expense',
          style: ThemeText.kInter18White,
        ),
      ),
      backgroundColor: const Color(0xFF0077FF),
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: mq.height * .25),
                  const Text(
                    'How much ?',
                    style: ThemeText.kInter18White,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '₹ ' '0',
                    style: ThemeText.kInter64,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: mq.height * .40,
            child: Container(
              height: mq.height * .60,
              width: mq.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: mq.height * .40),
                    const RoundButton(
                      btnName: 'Continue',
                      btnBackgroundColor: Color(0xFF7F3DFF),
                      btnTextColor: Color(0xFFFCFCFC),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
