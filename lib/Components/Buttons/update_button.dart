import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const UpdateButton({
    super.key,
    required this.onTap,
    this.label = 'Update',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF4182F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
