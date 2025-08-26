import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/home_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Dashboard/dashboard_web.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: HomeMobile(), tablet: DashboardWeb(), desktop: DashboardWeb());
  }
}


