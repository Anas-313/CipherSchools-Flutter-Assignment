import 'package:flutter/material.dart';

class RectangularCard extends StatelessWidget {
  final Color backGroundColor;
  final String cardIcon;
  final String cardTitle;
  final String cardAmount;

  const RectangularCard({
    super.key,
    required this.backGroundColor,
    required this.cardIcon,
    required this.cardTitle,
    required this.cardAmount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 170,
      child: Card(
        color: backGroundColor,
        // Color(0xFF00A86B),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage(cardIcon),
                  height: 48,
                  width: 48,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cardTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: Color(0xFFFCFCFC)),
                ),
                Text(
                  '₹' '$cardAmount',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      fontFamily: 'Inter',
                      color: Color(0xFFFCFCFC)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
