import 'package:b_designer_architecture/Constants/constant_color.dart';
import 'package:flutter/material.dart';

class SignupCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final bool isSelected;

  const SignupCard({super.key, required this.title, required this.image, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 10.0,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20.0),
        height: 170,
        width: 140,
        padding: EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kcLightGrey,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 6,
                spreadRadius: 1,
              )
            ]
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: kcDarkGrey,
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 5,
                left: 5,
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: isSelected ? kcMediumYellow : Colors.white,
                  child: isSelected ? Icon(Icons.done_rounded, color: Colors.white, size: 12,) : null,
                )
            ),
          ],
        ),
      ),
    );
  }
}
