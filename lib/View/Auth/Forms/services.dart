import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:flutter/material.dart';
import '../../Screens/Sidebar/Others/Service/services_mobile.dart';
import '../../Screens/Sidebar/Others/Service/services_web.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: ServicesMobile(),
        tablet: ServicesWeb(),
        desktop: ServicesWeb());
  }
}
