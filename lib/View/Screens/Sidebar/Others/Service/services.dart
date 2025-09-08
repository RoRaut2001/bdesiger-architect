import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/Service/services_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Sidebar/Others/Service/services_web.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: ServicesMobile(), tablet: ServicesMobile(), desktop: ServicesWeb());
  }
}
