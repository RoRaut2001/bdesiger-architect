import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String theme;
  const SubmitButton({super.key, required this.title, required this.onTap, required this.theme});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: theme == "grey" ? kcLightGrey : Colors.black,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
                color: theme == "black" ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
        ),
      ),
    );
  }
}
