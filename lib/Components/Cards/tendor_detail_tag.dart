import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TenderDetailTag extends StatelessWidget {
  final bool isTitle;
  final String icon;
  final String name;
  final String value;
  const TenderDetailTag({super.key, required this.isTitle, required this.icon, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 15.0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
        color: isTitle ? Color(0xFFF2EADF) : Colors.transparent
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Text("${name} - ${value}"),
        ],
      ),
    );
  }
}
