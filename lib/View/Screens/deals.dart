import 'package:b_designer_architecture/Controller/screen_controller.dart';
import 'package:b_designer_architecture/Helper/responsive.dart';
import 'package:b_designer_architecture/View/Screens/Mobile/deals_mobile.dart';
import 'package:b_designer_architecture/View/Screens/Web/deals_web.dart';
import 'package:flutter/material.dart';

class Deals extends StatelessWidget {
  final ScreenController controller;
  const Deals({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: DealsMobile(controller: controller), tablet: DealsWeb(controller: controller), desktop: DealsWeb(controller: controller));
  }
}
