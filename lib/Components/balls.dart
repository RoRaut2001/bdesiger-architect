import 'package:flutter/material.dart';

class Balls extends StatelessWidget {
  final double radius;
  final List<Color> gradient;
  const Balls({super.key, required this.radius, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: gradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }
}
