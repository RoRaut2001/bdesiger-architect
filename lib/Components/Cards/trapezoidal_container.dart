import 'package:flutter/material.dart';

class TrapezoidalContainer extends StatelessWidget {
  const TrapezoidalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Apply border radius
      ),
      clipBehavior: Clip.hardEdge, // Ensure clipping
      child: ClipPath(
        clipper: TrapezoidClipper(),
        child: Image.network(
          "https://res.cloudinary.com/dculivch8/image/upload/v1735551506/Hotel_Suspended_Above_Paris_by_Sara_Tarokh_md0cj0.jpg", // Replace with your network image URL
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover, // Ensure the image covers the entire trapezoidal area
        ),
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 50, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
