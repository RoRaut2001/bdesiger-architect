


import 'package:b_designer_architecture/View/Screens/Sidebar/sidebar/sidebar_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/sidebar/sidebar_tab.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/sidebar/sidebar_web.dart';
import 'package:flutter/material.dart';

import '../../../../Helper/responsive.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile:  SidebarMobile(),
      tablet:  SidebarTablet(),
      desktop:  SidebarWeb(),
    );
  }
}
