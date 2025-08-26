import 'package:flutter/material.dart';
import '../../../helper/responsive.dart';
import '../Mobile/home_mobile.dart';
import 'home_tab.dart';
import 'home_web.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: HomeMobile(), tablet: HomeTab(), desktop: HomeWeb());
  }
}


