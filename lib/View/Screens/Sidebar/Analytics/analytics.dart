import 'package:b_designer_architecture/View/Screens/Sidebar/Analytics/analytics_tab.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Analytics/analytics_web.dart';
import 'package:flutter/material.dart';
import '../../../../Helper/responsive.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: AnalyticsWeb(),
        tablet: AnalyticsTab(),
        desktop: AnalyticsWeb());
  }
}


