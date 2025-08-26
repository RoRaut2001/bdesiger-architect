import 'package:flutter/material.dart';
import '../../Controller/screen_controller.dart';
import '../../helper/responsive.dart';
import 'package:get/get.dart';

import 'Mobile/deals_mobile.dart';
import 'Web/deals_web.dart';

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
