import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/About/about_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/About/about_web.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: AboutMobile(),
        tablet: AboutMobile(),
        desktop: AboutWeb());
  }
}
