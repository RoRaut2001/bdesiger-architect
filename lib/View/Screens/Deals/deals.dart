import 'package:b_designer_architecture/View/Screens/Deals/deals_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/screen_controller.dart';
import '../../../Helper/responsive.dart';
import 'deals_web.dart';

class Deals extends StatelessWidget {
  Deals({super.key});
  final ScreenController controller = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: DealsMobile(controller: controller),
        tablet: DealsWeb(controller: controller),
        desktop: DealsWeb(controller: controller));
  }
}
