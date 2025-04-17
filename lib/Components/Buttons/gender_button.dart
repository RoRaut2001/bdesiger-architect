import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String icon;
  final VoidCallback onTap;

  const GenderButton(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: title == "Female" ? Radius.circular(10) : Radius.circular(0),
            topLeft: title == "Male" ? Radius.circular(10) : Radius.circular(0),
            bottomLeft: title == "Male" ? Radius.circular(10) : Radius.circular(0),
            bottomRight: title == "Female" ? Radius.circular(10) : Radius.circular(0),
          ),
          border: BorderDirectional(
            end: title == "Male" ? BorderSide(color: Colors.black, width: 0.5) : BorderSide.none,
            start: title == "Female" ? BorderSide(color: Colors.black, width: 0.5) : BorderSide.none,
          ),
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    kcGradient1,
                    kcGradient2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                  color: isSelected ? Colors.black : kcLightGrey,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
