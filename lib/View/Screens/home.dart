import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/home_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Web/home_web.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: HomeMobile(), tablet: HomeWeb(), desktop: HomeWeb());
  }
}
