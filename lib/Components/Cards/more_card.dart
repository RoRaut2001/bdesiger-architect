import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final String image;
  final String message;
  final Color color;
  const MoreCard({super.key, required this.image, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3B3B3B)
            ),
            ),
          ),
          Image.asset(image),
        ],
      ),
    );
  }
}
