import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Dashboard/dashboard_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Dashboard/dashboard_web.dart';
import 'package:flutter/material.dart';
import '../../../Helper/size_config.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation){
          SizeConfig.init(constraints, orientation);
          return Responsive(
              mobile: DashboardMobile(),
              tablet: DashboardWeb(),
              desktop: DashboardWeb());
        });
      },
    );
  }
}